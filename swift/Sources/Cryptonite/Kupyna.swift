import Foundation

public class Kupyna {
    public enum DigestSize: Int {
        case bits256 = 32
        case bits384 = 48
        case bits512 = 64
    }
    
    private let digestSize: Int
    private let rounds: Int
    private let columns: Int
    private let nBytes: Int
    
    private var state: [UInt64]
    private var buffer: [UInt8]
    private var totalBytesProcessed: UInt64 = 0
    
    public init(digestSize: DigestSize) {
        self.digestSize = digestSize.rawValue
        
        // Configuration based on dstu7564_init
        if digestSize.rawValue <= 32 {
            self.rounds = 10 // NR_512
            self.columns = 8 // NB_512
            self.nBytes = 64 // 512 bits
        } else {
            self.rounds = 14 // NR_1024
            self.columns = 16 // NB_1024
            self.nBytes = 128 // 1024 bits
        }
        
        self.state = [UInt64](repeating: 0, count: self.columns)
        self.buffer = []
        
        // Initial state
        state[0] = UInt64(self.nBytes)
    }
    
    public func update(data: [UInt8]) {
        totalBytesProcessed += UInt64(data.count)
        buffer.append(contentsOf: data)
        
        while buffer.count >= nBytes {
            let chunk = Array(buffer.prefix(nBytes))
            buffer.removeFirst(nBytes)
            processBlock(chunk)
        }
    }
    
    public func finalize() -> [UInt8] {
        // Padding logic matching dstu7564
        // Append 0x80
        buffer.append(0x80)
        
        // Fill with zeros until length is (block_size - 12) % block_size
        // We need 12 bytes at the end of a block.
        // So buffer.count % nBytes should be nBytes - 12.
        
        while (buffer.count % nBytes) != (nBytes - 12) {
            buffer.append(0)
        }
        
        // Append length in bits (96 bits = 12 bytes). Little endian.
        let processedBits = totalBytesProcessed * 8
        let lenBytes = uint64ToBytesLittleEndian(processedBits)
        buffer.append(contentsOf: lenBytes)
        buffer.append(contentsOf: [0, 0, 0, 0]) // Extend to 12 bytes (assuming high bits 0)
        
        // Process blocks
        while buffer.count >= nBytes {
             let chunk = Array(buffer.prefix(nBytes))
             buffer.removeFirst(nBytes)
             processBlock(chunk)
        }
        
        // Output transformation
        // P(state) ^ state
        var outputState = state
        permuteP(state: &outputState)
        for i in 0..<state.count {
            outputState[i] ^= state[i]
        }
        
        let outputBytes = uint64ToBytes(outputState)
        // Return LAST digestSize bytes
        let start = outputBytes.count - digestSize
        return Array(outputBytes[start..<outputBytes.count])
    }
    
    // MARK: - Core
    
    private func processBlock(_ block: [UInt8]) {
        let m = bytesToUInt64(block)
        
        // T+ = P(m + h) + Q(m) + h
        // h is state.
        // + is XOR.
        
        var t1 = [UInt64](repeating: 0, count: columns) // m + h
        for i in 0..<columns {
            t1[i] = m[i] ^ state[i]
        }
        permuteP(state: &t1)
        
        var t2 = m // Q(m)
        permuteQ(state: &t2)
        
        for i in 0..<columns {
            state[i] = t1[i] ^ t2[i] ^ state[i]
        }
    }
    
    private func permuteP(state: inout [UInt64]) {
        for r in 0..<rounds {
            // AddRoundConstant P (XOR)
            // G transform
            // C: kupyna_G_xor with p_pconst
            
            // Add constant
            // Note: C G function does CONSTANT addition INSIDE it (via macros).
            // Here implementation:
            // ShiftRows -> MixColumns -> Sbox? 
            // Sequence in dstu7564 is:
            // AddConst, SubBytes, ShiftBytes, MixColumns.
            // subrowcol combines Sub, Shift, Mix.
            // So: AddConst -> subrowcol.
            
            // AddConst(state, r, P_CONST)
            for i in 0..<columns {
                // P constant. Tables.p_pconst[r][i]
                state[i] ^= Tables.p_pconst[r][i]
            }
            
            subrowcol(state: &state)
        }
    }
    
    private func permuteQ(state: inout [UInt64]) {
        for r in 0..<rounds {
            // AddRoundConstant Q
            for i in 0..<columns {
                if columns == 8 {
                    state[i] &+= Tables.p_qconst_NB_512[r][i] // Add modulo 2^64?
                    // C uses + for Q constants?
                    // "The round constants ... are added to the state vectors arrays modulo 2^64"
                    // Yes, add.
                } else {
                    state[i] &+= Tables.p_qconst_NB_1024[r][i]
                }
            }
            
            subrowcol(state: &state)
        }
    }
    
    private func subrowcol(state: inout [UInt64]) {
        let shifts: [Int]
        if columns == 8 {
            shifts = [0, 1, 2, 3, 4, 5, 6, 7]
        } else {
            shifts = [0, 1, 2, 3, 4, 5, 6, 11]
        }
        
        var nextState = [UInt64](repeating: 0, count: columns)
        
        for col in 0..<columns {
            var val: UInt64 = 0
            for row in 0..<8 {
                // Input column index = (col - shift[row]) % columns.
                // We access specific BYTE 'row' from that input word.
                let inputCol = (col + columns - shifts[row]) % columns
                let inputWord = state[inputCol]
                let byteVal = Int((inputWord >> (row * 8)) & 0xFF)
                val ^= Tables.subrowcol[row][byteVal]
            }
            nextState[col] = val
        }
        state = nextState
    }
    
    private func bytesToUInt64(_ bytes: [UInt8]) -> [UInt64] {
        var u64s = [UInt64]()
        for i in stride(from: 0, to: bytes.count, by: 8) {
            var val: UInt64 = 0
            for j in 0..<8 {
                if i + j < bytes.count {
                    val |= UInt64(bytes[i+j]) << (j * 8)
                }
            }
            u64s.append(val)
        }
        return u64s
    }
    
    private func uint64ToBytes(_ u64s: [UInt64]) -> [UInt8] {
        var bytes = [UInt8]()
        for val in u64s {
            for j in 0..<8 {
                bytes.append(UInt8((val >> (j * 8)) & 0xFF))
            }
        }
        return bytes
    }
    
    private func uint64ToBytesLittleEndian(_ val: UInt64) -> [UInt8] {
        var bytes = [UInt8]()
        for j in 0..<8 {
            bytes.append(UInt8((val >> (j * 8)) & 0xFF))
        }
        return bytes
    }
}
