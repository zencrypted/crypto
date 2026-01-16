import Foundation
import CommonCrypto

public enum PBEAlgorithm: String {
    case pbeWithSHA1And3KeyTripleDES_CBC = "1.2.840.113549.1.12.1.3"
    case pbeWithSHA1And40BitRC2_CBC = "1.2.840.113549.1.12.1.6" // Used for Certs often
}

// PKCS#12 password conversion (16-bit BE + null terminator)
func pkcs12PasswordBytes(_ password: String) -> [UInt8] {
    var bytes = [UInt8]()
    for codeUnit in password.utf16 {
        bytes.append(UInt8(codeUnit >> 8))
        bytes.append(UInt8(codeUnit & 0xFF))
    }
    // Null terminator (2 bytes)
    bytes.append(0)
    bytes.append(0)
    return bytes
}

public struct PBE {
    public static func encrypt(data: [UInt8], password: String, algorithm: PBEAlgorithm, salt: [UInt8], iterations: Int) throws -> [UInt8] {
        guard algorithm == .pbeWithSHA1And3KeyTripleDES_CBC else {
            throw PKCS12Error.unsupportedAlgorithm
        }
        
        return try encryptPKCS12(data: data, password: password, salt: salt, iterations: iterations)
    }
    
    // PKCS#12 Key Derivation Function (RFC 7292 Appendix B)
    // ID: 1 for Key, 2 for IV, 3 for MAC
    private static func deriveKeyPKCS12(password: [UInt8], salt: [UInt8], iterations: Int, id: UInt8, length: Int) -> [UInt8] {
        let v = 64 // Block size for SHA-1
        let u = 20 // Digest size for SHA-1
        
        // D is static
        let D = [UInt8](repeating: id, count: v)
        // S and P are padded
        let S = concat(data: salt, blockSize: v)
        let P = concat(data: password, blockSize: v)
        
        var I = S + P
        var derived = [UInt8]()
        
        let c = (length + u - 1) / u
        
        for _ in 1...c {
            // Ai = Hash^r(D || I)
            var input = D + I
            var Ai = [UInt8](repeating: 0, count: u)
            
            // First Hash
            _ = input.withUnsafeBytes { ptr in
                if let base = ptr.baseAddress {
                    CC_SHA1(base, CC_LONG(ptr.count), &Ai)
                }
            }
            
            // Iterations
            for _ in 1..<iterations {
                let temp = Ai
                _ = temp.withUnsafeBytes { ptr in
                    if let base = ptr.baseAddress {
                        CC_SHA1(base, CC_LONG(ptr.count), &Ai)
                    }
                }
            }
            
            derived.append(contentsOf: Ai)
            
            // Update I (B)
            // B = Ai concatenated to length v
            var B = [UInt8]()
            for _ in 0..<(v/u) + 1 { B.append(contentsOf: Ai) }
            B = Array(B.prefix(v))
            
            // I_j = (I_j + B + 1) mod 2^v
            // Iterate over each v-byte block of I
            let blockCount = I.count / v
            for blockIndex in 0..<blockCount {
                 var carry: UInt16 = 1
                 // Big-endian addition on the block
                 for j in stride(from: v - 1, through: 0, by: -1) {
                     let idxI = blockIndex * v + j
                     let sum = UInt16(I[idxI]) &+ UInt16(B[j]) &+ carry
                     I[idxI] = UInt8(sum & 0xFF)
                     carry = sum >> 8
                 }
            }
        }
        
        return Array(derived.prefix(length))
    }
    
    private static func concat(data: [UInt8], blockSize: Int) -> [UInt8] {
        guard !data.isEmpty else { return [] }
        
        // Correct implementation:
        // Length v * ceil(S/v)
        let k = (data.count + blockSize - 1) / blockSize
        let targetLen = blockSize * k
        if targetLen == 0 { return [] }
        
        var result = [UInt8]()
        result.reserveCapacity(targetLen)
        while result.count < targetLen {
            result.append(contentsOf: data)
        }
        return Array(result.prefix(targetLen))
    }
    
    
    // 3DES-CBC-SHA1 Encryption
    private static func encryptPKCS12(data: [UInt8], password: String, salt: [UInt8], iterations: Int) throws -> [UInt8] {
        let passBytes = pkcs12PasswordBytes(password)
        
        // 1. Derive Key (24 bytes for 3DES)
        let key = deriveKeyPKCS12(password: passBytes, salt: salt, iterations: iterations, id: 1, length: 24)
        
        // 2. Derive IV (8 bytes for 3DES)
        // Note: Some legacy implementations use ID=2 for IV. Standard is ID=2.
        let iv = deriveKeyPKCS12(password: passBytes, salt: salt, iterations: iterations, id: 2, length: 8)
        
        // 3. Encrypt 3DES
        var encrypted = [UInt8](repeating: 0, count: data.count + kCCBlockSize3DES)
        var numBytesEncrypted: Int = 0
        
        let cryptStatus = key.withUnsafeBytes { keyPtr in
            iv.withUnsafeBytes { ivPtr in
                data.withUnsafeBytes { dataPtr in
                    CCCrypt(
                        CCOperation(kCCEncrypt),
                        CCAlgorithm(kCCAlgorithm3DES),
                        CCOptions(kCCOptionPKCS7Padding),
                        keyPtr.baseAddress, 24, // Key length
                        ivPtr.baseAddress,
                        dataPtr.baseAddress, data.count,
                        &encrypted,
                        encrypted.count,
                        &numBytesEncrypted
                    )
                }
            }
        }
        
        guard cryptStatus == kCCSuccess else { throw PKCS12Error.encryptionFailed }
        return Array(encrypted[0..<numBytesEncrypted])
    }
}

public enum PKCS12Error: Error {
    case unsupportedAlgorithm
    case keyDerivationFailed
    case encryptionFailed
}
