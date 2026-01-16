import XCTest
@testable import Cryptonite

final class KalynaTests: XCTestCase {
    
    func testKalyna128_128_ECB() throws {
        // dstu7624_ecb_16_16
        // Data: 101112131415161718191A1B1C1D1E1F
        // Key: 000102030405060708090A0B0C0D0E0F
        // Exp: 81BF1C7D779BAC20E1C9EA39B4D2AD06
        
        let keyBytes: [UInt8] = [
            0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
            0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F
        ]
        
        let dataBytes: [UInt8] = [
            0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
            0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
        ]
        
        let expectedCipher: [UInt8] = [
            0x81, 0xBF, 0x1C, 0x7D, 0x77, 0x9B, 0xAC, 0x20,
            0xE1, 0xC9, 0xEA, 0x39, 0xB4, 0xD2, 0xAD, 0x06
        ]
        
        let kalyna = try Kalyna(key: keyBytes, blockSize: .block128)
        let cipher = try kalyna.encrypt(block: dataBytes)
        
        XCTAssertEqual(cipher, expectedCipher, "Encryption failed")
        
        let decrypted = try kalyna.decrypt(block: cipher)
        XCTAssertEqual(decrypted, dataBytes, "Decryption failed")
    }
    
    func testKalynaCBC() throws {
        // Replicates test_dstu7624_cbc_core logic
        let key = [UInt8](repeating: 0x0F, count: 16) // 128-bit key
        let iv = [UInt8](repeating: 0xAA, count: 16)  // 128-bit IV
        let data = [UInt8](repeating: 0xCC, count: 64) // 64 bytes (4 blocks)
        
        let kalyna = try Kalyna(key: key, blockSize: .block128)
        
        // Encrypt
        let encrypted = try kalyna.encryptCBC(data: data, iv: iv)
        XCTAssertEqual(encrypted.count, 64)
        XCTAssertNotEqual(encrypted, data)
        
        // Decrypt
        let decrypted = try kalyna.decryptCBC(data: encrypted, iv: iv)
        XCTAssertEqual(decrypted.count, 64)
        
        XCTAssertEqual(decrypted, data, "CBC Decryption failed to restore original data")
    }
    
    func testKalynaKW() throws {
        // Replicates test_dstu7624_kw_core logic
        // key_len (random) -> used as KEK
        // data (random 64 bytes) -> treated as IV + KeyData
        
        let kek = [UInt8](repeating: 0x05, count: 16)
        var dataToWrap = [UInt8](0..<64)
        
        let kalyna = try Kalyna(key: kek, blockSize: .block128)
        
        // Wrap
        let wrapped = try kalyna.wrap(data: dataToWrap)
        XCTAssertEqual(wrapped.count, 64)
        XCTAssertNotEqual(wrapped, dataToWrap)
        
        // Unwrap
        let unwrapped = try kalyna.unwrap(data: wrapped)
        XCTAssertEqual(unwrapped, dataToWrap, "KW Unwrap failed to restore original data")
    }
}
