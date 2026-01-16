import XCTest
@testable import Cryptonite

final class KupynaTests: XCTestCase {
    
    // Helper to convert hex string to bytes
    func hexToBytes(_ hex: String) -> [UInt8] {
        var bytes = [UInt8]()
        var startIndex = hex.startIndex
        while startIndex < hex.endIndex {
            let endIndex = hex.index(startIndex, offsetBy: 2)
            let byteString = String(hex[startIndex..<endIndex])
            if let byte = UInt8(byteString, radix: 16) {
                bytes.append(byte)
            }
            startIndex = endIndex
        }
        return bytes
    }
    
    func testKupyna512_Empty() {
        let kupyna = Kupyna(digestSize: .bits512)
        kupyna.update(data: [])
        let hash = kupyna.finalize()
        let expected = "656b2f4cd71462388b64a37043ea55dbe445d452aecd46c3298343314ef04019bcfa3f04265a9857f91be91fce197096187ceda78c9c1c021c294a0689198538"
        XCTAssertEqual(hash.toHexString(), expected.lowercased())
    }
    
    func testKupyna256_Sequence64Bytes() {
        // "0001...3F"
        var data = [UInt8]()
        for i in 0..<64 {
            data.append(UInt8(i))
        }
        
        let kupyna = Kupyna(digestSize: .bits256)
        kupyna.update(data: data)
        let hash = kupyna.finalize()
        let expected = "08f4ee6f1be6903b324c4e27990cb24ef69dd58dbe84813ee0a52f6631239875"
        XCTAssertEqual(hash.toHexString(), expected.lowercased())
    }
    
    func testKupyna256_Sequence128Bytes() {
        // "0001...7F"
        var data = [UInt8]()
        for i in 0..<128 {
            data.append(UInt8(i))
        }
        
        let kupyna = Kupyna(digestSize: .bits256)
        kupyna.update(data: data)
        let hash = kupyna.finalize()
        let expected = "0a9474e645a7d25e255e9e89fff42ec7eb31349007059284f0b182e452bda882"
        XCTAssertEqual(hash.toHexString(), expected.lowercased())
    }
}

extension Array where Element == UInt8 {
    func toHexString() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
}
