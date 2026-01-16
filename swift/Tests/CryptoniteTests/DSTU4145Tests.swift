import XCTest
@testable import Cryptonite

final class DSTU4145Tests: XCTestCase {
    
    // Vectors from dstu4145_verify_test in utest_dstu4145.c
    func testM257VerifyCore() {
        let qxHex = "01799b65a6d2d1cecd08b044d599eecfab8412f599f52ca38ddb431bba38e66c00"
        let qyHex = "e54176a56aaf5e5bea7c7dbbacfbe6ad1c35bf9743cb534d839d62be68bc4c5a01"
        let rHex = "ace29a89ec34329abf529d109ca838c26b13cc0e14d8663071da94ab198e2e64"
        let sHex = "39b9c25ab0187694ec170221e9135405894bf439c9cefea7f23e4e1a974eca1b"
        let hashHex = "b591f4d5ea42d0005dedf238e8beccc2cb46a944419b6fdd66c57e66c751f683"
        
        let qx = BigInt(leBytes: hexToBytes(qxHex))
        let qy = BigInt(leBytes: hexToBytes(qyHex))
        let r = BigInt(leBytes: hexToBytes(rHex))
        let s = BigInt(leBytes: hexToBytes(sHex))
        let message = hexToBytes(hashHex)
        
        let publicKey = DSTU4145.Point(x: qx, y: qy, isInfinity: false)
        let params = DSTU4145Params.M257_PB
        
        let isValid = DSTU4145.verify(message: message, signature: (r, s), publicKey: publicKey, params: params)
        XCTAssertTrue(isValid, "Signature verification failed for M257 vector")
    }
    
    func testSignVerify() {
        let params = DSTU4145Params.M257_PB
        // Key from dstu4145_sign_test
        let keyHex = "4854f9d1eeeaab9516288183f164044ec3cdbd00288856db40b4cdf07dfc140900"
        let d = BigInt(leBytes: hexToBytes(keyHex))
        let hashHex = "b591f4d5ea42d0005dedf238e8beccc2cb46a944419b6fdd66c57e66c751f683"
        let message = hexToBytes(hashHex)
        
        // Use a fixed k for reproducibility or random? usage "k" implies nonce.
        // Let's use a non-zero k.
        let k = BigInt(123456789)
        
        guard let signature = DSTU4145.sign(message: message, privateKey: d, params: params, k: k) else {
            XCTFail("Signing failed")
            return
        }
        
        // Verify with the known public key from test
        // qx = 01799b65...
        // qy = e54176a5...
        let qxHex = "01799b65a6d2d1cecd08b044d599eecfab8412f599f52ca38ddb431bba38e66c00"
        let qyHex = "e54176a56aaf5e5bea7c7dbbacfbe6ad1c35bf9743cb534d839d62be68bc4c5a01"
        let qx = BigInt(leBytes: hexToBytes(qxHex))
        let qy = BigInt(leBytes: hexToBytes(qyHex))
        let publicKey = DSTU4145.Point(x: qx, y: qy, isInfinity: false)
        
        let isValid = DSTU4145.verify(message: message, signature: signature, publicKey: publicKey, params: params)
        XCTAssertTrue(isValid, "Self-signed signature verification failed")
    }
    
    // Helper
    func hexToBytes(_ hex: String) -> [UInt8] {
        var bytes = [UInt8]()
        var h = hex
        if h.count % 2 != 0 { h = "0" + h }
        var i = h.startIndex
        while i < h.endIndex {
            let next = h.index(i, offsetBy: 2)
            if let b = UInt8(h[i..<next], radix: 16) {
                bytes.append(b)
            }
            i = next
        }
        // Tests use LE hex string. But "b591..." is byte 0x b5, 0x91...
        // `ba_alloc_from_le_hex_string` in C usually means the string is written as bytes, allowing standard parsing, but the order is LE in memory?
        // Or "00..." is lowest byte? 
        // ba_alloc_from_le_hex_string("0102") -> [0x01, 0x02] in memory.
        // If this represents int 0x0201 (LE) or 0x0102 (BE)?
        // Byte array is just bytes.
        // `BigInt(leBytes: ...)` treats first byte as LSB.
        // So "b5..." -> LSB is 0xb5.
        // Correct.
        return bytes
    }
}
