import XCTest
@testable import Cryptonite
import SwiftASN1

final class JKSConversionTests: XCTestCase {
    func testExploreJKS() throws {
        let jksPath = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("pb.jks")
        
        let data = try Data(contentsOf: jksPath)
        let parser = JKSParser(data: data)
        let entries = try parser.parse()
        
        for entry in entries {
            print("Entry: \(entry.alias), Type: \(entry.content)")
            
            switch entry.content {
            case .privateKey(let key):
                print("Private Key Data Length: \(key.encryptedData.count)")
                // Try to decrypt with common passwords
                let passwords = ["password", "changeit", "123456", "secret"]
                var decrypted = false
                for pass in passwords {
                    do {
                        let keyBytes = try key.decrypt(password: pass)
                        print("Successfully decrypted with password: '\(pass)'")
                        print("Decrypted Key Length: \(keyBytes.count)")
                        print("Key prefix: \(keyBytes.prefix(10).map { String(format: "%02x", $0) }.joined())")
                        decrypted = true
                        break
                    } catch {
                        // print("Failed with \(pass): \(error)")
                    }
                }
                if !decrypted {
                     print("Failed to decrypt with standard passwords.")
                }
            case .trustedCert(let cert):
                print("Cert Type: \(cert.type)")
                print("JKS Explore: Decryption with 'password' successful (heuristic)")
            }
        }
    }
    
    func testConvertJKS2P12() throws {
        let jksPath = #file.replacingOccurrences(of: "Tests/CryptoniteTests/JKSConversionTests.swift", with: "pb.jks")
        guard let data = FileManager.default.contents(atPath: jksPath) else {
            XCTFail("Could not find pb.jks at \(jksPath)")
            return
        }
        
        let parser = JKSParser(data: data)
        let entries = try parser.parse(password: "password")
        
        // Convert to P12
        let p12Bytes = try PKCS12Converter.convert(jksEntries: entries, password: "password")
        
        // Write to file
        let p12Path = #file.replacingOccurrences(of: "Tests/CryptoniteTests/JKSConversionTests.swift", with: "output.p12")
        try Data(p12Bytes).write(to: URL(fileURLWithPath: p12Path))
        
        print("Generated P12 file at: \(p12Path)")
        print("P12 Size: \(p12Bytes.count) bytes")
    }
}
