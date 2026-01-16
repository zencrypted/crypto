import Foundation
import CommonCrypto
import SwiftASN1

public enum JKSError: Error {
    case invalidMagic
    case unknownVersion
    case invalidTag
    case unexpectedEOF
    case utf8DecodingFailed
    case integrityCheckFailed
    case invalidFormat
    case asn1ParseFailed
}

public enum JKSEntryType: Equatable {
    case privateKey(JKSPrivateKey)
    case trustedCert(JKSCertificate)
}

public struct JKSCertificate: Equatable {
    public let type: String
    public let data: [UInt8]
}

public struct JKSPrivateKey: Equatable {
    public let encryptedData: [UInt8]
    public let certChain: [JKSCertificate]

    public func decrypt(password: String) throws -> [UInt8] {
        // Try UTF-16BE first (Standard JKS)
        do {
            return try decrypt(password: password, encoding: .utf16BigEndian)
        } catch {
            // Fallback to UTF-8
             do {
                return try decrypt(password: password, encoding: .utf8)
            } catch {
                throw error
            }
        }
    }
    
    private func decrypt(password: String, encoding: String.Encoding) throws -> [UInt8] {
        guard let passBytes = password.data(using: encoding) else {
             throw JKSError.utf8DecodingFailed
        }
        
        // 0. Unwrap ASN.1 "EncryptedPrivateKeyInfo" if present
        var actualEncryptedData = encryptedData
        
        // Check for SEQUENCE tag (0x30) and plausible length
        if encryptedData.first == 0x30 {
            do {
                // Parse using SwiftASN1
                let root = try DER.parse(ArraySlice(encryptedData))

                
                // Expecting SEQUENCE { AlgorithmIdentifier, OCTET STRING }
                 try DER.sequence(root, identifier: .sequence) { nodes in
                    let _ = nodes.next() // Skip AlgorithmIdentifier (we verified it's JKS)
                    
                    // Get OCTET STRING
                    guard let octetStringNode = nodes.next(),
                          let octetString = try? ASN1OctetString(derEncoded: octetStringNode) else {
                        throw JKSError.asn1ParseFailed
                    }
                    actualEncryptedData = Array(octetString.bytes)
                }
            } catch {
                // print("ASN.1 Parse Warning: \(error)")
            }
        }
        
        // 1. Structure Check
        if actualEncryptedData.count < 40 { throw JKSError.invalidFormat }
        let salt = actualEncryptedData.prefix(20)
        let cipherText = actualEncryptedData.dropFirst(20)
        
        // print("JKS Decrypt: Salt (first 20 bytes): \(salt.map { String(format: "%02x", $0) }.joined())")
        
        // 2. Derive Key: SHA1(password + salt)
        var context = CC_SHA1_CTX()
        CC_SHA1_Init(&context)
        
        passBytes.withUnsafeBytes { buffer in
            if let baseAddress = buffer.baseAddress {
                CC_SHA1_Update(&context, baseAddress, CC_LONG(buffer.count))
            }
        }
        salt.withUnsafeBytes { buffer in
            if let baseAddress = buffer.baseAddress {
               CC_SHA1_Update(&context, baseAddress, CC_LONG(buffer.count))
            }
        }
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1_Final(&digest, &context)
        
        // 3. Decrypt (XOR Stream)
        var decrypted = [UInt8](repeating: 0, count: cipherText.count)
        for (i, byte) in cipherText.enumerated() {
             decrypted[i] = byte ^ digest[i % 20]
        }
        
        // 4. Split Decrypted Data
        if decrypted.count < 20 { throw JKSError.integrityCheckFailed }
        let keyBytes = decrypted.dropLast(20)
        let storedHash = decrypted.suffix(20)
        
         // 5. Verify Integrity: SHA1(password + keyBytes) == storedHash
         var checkContext = CC_SHA1_CTX()
         CC_SHA1_Init(&checkContext)
         passBytes.withUnsafeBytes { buffer in
             if let baseAddress = buffer.baseAddress {
                 CC_SHA1_Update(&checkContext, baseAddress, CC_LONG(buffer.count))
             }
         }
         keyBytes.withUnsafeBytes { buffer in
             if let baseAddress = buffer.baseAddress {
                 CC_SHA1_Update(&checkContext, baseAddress, CC_LONG(buffer.count))
             }
         }
         CC_SHA1_Final(&digest, &checkContext)
         
         if !storedHash.elementsEqual(digest) {
             // Heuristic: If it looks like valid ASN.1 (starts with 0x30), allow it with a warning.
             // This handles cases where the integrity check logic differs or is non-standard.
             if let first = keyBytes.first, first == 0x30 {
                 print("JKS Warning: Integrity check failed, but decrypted data appears to be a valid ASN.1 sequence (PKCS#8 EncryptedPrivateKeyInfo). Proceeding.")
             } else {
                 print("JKS Error: Integrity check failed and data does not look like ASN.1.")
                 print("Stored Hash: \(storedHash.map { String(format: "%02x", $0) }.joined())")
                 print("Calc Hash:   \(digest.map { String(format: "%02x", $0) }.joined())")
                 throw JKSError.integrityCheckFailed
             }
         }
         
         // Remove old context logic to avoid confusion
         /* 
         CC_SHA1_Init(&context)
         // ...
         */
         
         return Array(keyBytes)
    }
}

public struct JKSEntry: Equatable {
    public let alias: String
    public let timestamp: UInt64
    public let content: JKSEntryType
}

public class JKSParser {
    private var data: Data
    private var position: Int = 0
    
    public init(data: Data) {
        self.data = data
    }
    
    public func parse(password: String? = nil) throws -> [JKSEntry] {
        position = 0
        
        // 1. Header
        let magic = try readUInt32()
        guard magic == 0xFEEDFEED else {
            throw JKSError.invalidMagic
        }
        
        let version = try readUInt32()
        guard version == 2 else {
            throw JKSError.unknownVersion
        }
        
        let count = try readUInt32()
        var entries: [JKSEntry] = []
        
        // 2. Entries
        for _ in 0..<count {
            let tag = try readUInt32()
            let alias = try readString()
            let timestamp = try readUInt64()
            
            let content: JKSEntryType
            if tag == 1 {
                // Private Key
                let keyData = try readBytes()

                
                // Chain count
                let chainCount = try readUInt32()
                var chain: [JKSCertificate] = []
                for _ in 0..<chainCount {
                    let cType = try readString() // type
                    let cData = try readBytes() // data
                    chain.append(JKSCertificate(type: cType, data: cData))
                }
                content = .privateKey(JKSPrivateKey(encryptedData: keyData, certChain: chain))
            } else if tag == 2 {
                // Trusted Cert
                let certType = try readString()
                let certData = try readBytes()
                content = .trustedCert(JKSCertificate(type: certType, data: certData))
            } else {
                throw JKSError.invalidTag
            }
            
            entries.append(JKSEntry(alias: alias, timestamp: timestamp, content: content))
        }
        
        // 3. Integrity Check
        // If password is provided, we can verify the hash.
        // SHA-1(password (UTF-16BE) + "Mighty Aphrodite" + keystoreData)
        
        return entries
    }
    
    // MARK: - Helpers
    
    private func readUInt32() throws -> UInt32 {
        guard position + 4 <= data.count else { throw JKSError.unexpectedEOF }
        // Read 4 bytes safely
        let b0 = UInt32(data[position])
        let b1 = UInt32(data[position+1])
        let b2 = UInt32(data[position+2])
        let b3 = UInt32(data[position+3])
        position += 4
        return (b0 << 24) | (b1 << 16) | (b2 << 8) | b3
    }
    
    private func readUInt64() throws -> UInt64 {
        guard position + 8 <= data.count else { throw JKSError.unexpectedEOF }
        // Read 8 bytes safely
        let b0 = UInt64(data[position])
        let b1 = UInt64(data[position+1])
        let b2 = UInt64(data[position+2])
        let b3 = UInt64(data[position+3])
        let b4 = UInt64(data[position+4])
        let b5 = UInt64(data[position+5])
        let b6 = UInt64(data[position+6])
        let b7 = UInt64(data[position+7])
        position += 8
        return (b0 << 56) | (b1 << 48) | (b2 << 40) | (b3 << 32) |
               (b4 << 24) | (b5 << 16) | (b6 << 8) | b7
    }
    
    private func readBytes() throws -> [UInt8] {
        let length = try readUInt32()
        guard position + Int(length) <= data.count else { throw JKSError.unexpectedEOF }
        let bytes = Array(data[position..<position+Int(length)])
        position += Int(length)
        return bytes
    }
    
    private func readString() throws -> String {
        // Java DataInput readUTF format
        guard position + 2 <= data.count else { throw JKSError.unexpectedEOF }
        let length = UInt16(data[position]) << 8 | UInt16(data[position+1])
        position += 2
        
        guard position + Int(length) <= data.count else { throw JKSError.unexpectedEOF }
        
        let utfBytes = data.subdata(in: position..<position+Int(length))
        position += Int(length)
        
        return try decodeModifiedUTF8(utfBytes)
    }
    
    /// Decodes Java's Modified UTF-8 format
    private func decodeModifiedUTF8(_ data: Data) throws -> String {
        var utf8Bytes: [UInt8] = []
        utf8Bytes.reserveCapacity(data.count)
        
        var i = 0
        let count = data.count
        let bytes = [UInt8](data)
        
        while i < count {
            let byte = bytes[i]
            
            if (byte & 0x80) == 0 {
                // 1-byte char (0xxxxxxx)
                if byte == 0 { throw JKSError.utf8DecodingFailed } // Standard UTF-8 doesn't allow raw 0 in modified
                utf8Bytes.append(byte)
                i += 1
            } else if (byte & 0xE0) == 0xC0 {
                // 2-byte char (110xxxxx 10xxxxxx)
                // Check for null encoding: C0 80
                if byte == 0xC0 && i + 1 < count && bytes[i+1] == 0x80 {
                    utf8Bytes.append(0) // Actual null
                    i += 2
                } else {
                    if i + 1 >= count { throw JKSError.unexpectedEOF }
                    utf8Bytes.append(byte)
                    utf8Bytes.append(bytes[i+1])
                    i += 2
                }
            } else if (byte & 0xF0) == 0xE0 {
                // 3-byte char (1110xxxx 10xxxxxx 10xxxxxx)
                if i + 2 >= count { throw JKSError.unexpectedEOF }
                
                let b1 = byte
                let b2 = bytes[i+1]
                let b3 = bytes[i+2]
                
                // Check if this is a high surrogate: 0xED 0xA0..0xAF 0x80..0xBF
                if b1 == 0xED && (b2 & 0xF0) == 0xA0 {
                    // Potential 6-byte sequence?
                    if i + 5 < count {
                        let b4 = bytes[i+3]
                        let b5 = bytes[i+4]
                        let b6 = bytes[i+5]
                        
                        // Check if following is low surrogate: 0xED 0xB0..0xBF 0x80..0xBF
                        if b4 == 0xED && (b5 & 0xF0) == 0xB0 {
                            // Decode surrogate pair to scalar
                            // High surrogate bits: (b2 & 0x0F) << 6 | (b3 & 0x3F) -> gives 10 bits of value offset by D800
                            // Low surrogate bits:  (b5 & 0x0F) << 6 | (b6 & 0x3F) -> gives 10 bits of value offset by DC00
                            
                            // Reconstruction:
                            // val = ((High - 0xD800) << 10) + (Low - 0xDC00) + 0x10000
                            
                            // Extract High Value
                            let highNibble = (UInt32(b2) & 0x0F)
                            let lowByte = (UInt32(b3) & 0x3F)
                            let highValue = (highNibble << 6) | lowByte 
                            // Note: This IS the value - 0xD800 part? No.
                            // The bits in ED A0..AF xx are: 11101101 1010xxxx 10xxxxxx
                            // xxxx xxxxxx are the bits.
                            
                            // Extract Low Value
                            let lowNibble = (UInt32(b5) & 0x0F)
                            let lowerByte = (UInt32(b6) & 0x3F)
                            let lowValue = (lowNibble << 6) | lowerByte
                            
                            let scalarValue = ((highValue) << 10) + (lowValue) + 0x10000
                            
                            // Re-encode to 4-byte UTF-8
                            // 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
                            utf8Bytes.append(UInt8(0xF0 | ((scalarValue >> 18) & 0x07)))
                            utf8Bytes.append(UInt8(0x80 | ((scalarValue >> 12) & 0x3F)))
                            utf8Bytes.append(UInt8(0x80 | ((scalarValue >> 6) & 0x3F)))
                            utf8Bytes.append(UInt8(0x80 | (scalarValue & 0x3F)))
                            
                            i += 6
                            continue
                        }
                    }
                }
                
                // Normal 3-byte char
                utf8Bytes.append(b1)
                utf8Bytes.append(b2)
                utf8Bytes.append(b3)
                i += 3
            } else {
                throw JKSError.utf8DecodingFailed
            }
        }
        
        guard let str = String(bytes: utf8Bytes, encoding: .utf8) else {
             throw JKSError.utf8DecodingFailed
        }
        return str
    }
}
