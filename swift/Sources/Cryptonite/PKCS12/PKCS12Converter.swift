import Foundation
import SwiftASN1

public struct PKCS12Converter {
    public static func convert(jksEntries: [JKSEntry], password: String) throws -> [UInt8] {
        var safeBags: [PKCS_12_SafeBag] = []
        
        // Fixed parameters for PBE (Should be random in production)
        let pbeSalt = [UInt8](repeating: 0x11, count: 20)
        let pbeIterations = 2000
        
        for entry in jksEntries {
            switch entry.content {
            case .privateKey(let pk):
                print("Converting Private Key alias: \(entry.alias)")
                // 1. Decrypt JKS Private Key (Soft fail handled in JKS.swift)
                let keyBytes = try pk.decrypt(password: password)
                
                // 2. Re-encrypt as PKCS#8 Shrouded KeyBag (Legacy 3DES)
                // Using pbeWithSHA1And3-KeyTripleDES-CBC (Legacy but highly compatible)
                // OID: 1.2.840.113549.1.12.1.3
                
                print("Encrypting Private Key (Length: \(keyBytes.count)) with PBE-SHA1-3DES")
                let encryptedKeyData = try PBE.encrypt(data: keyBytes, password: password, algorithm: .pbeWithSHA1And3KeyTripleDES_CBC, salt: pbeSalt, iterations: pbeIterations)
                
                // Construct AlgorithmIdentifier Parameters manually
                // SEQUENCE { salt OCTET STRING, iterations INTEGER }
                var paramsDer = [UInt8]()
                paramsDer.append(0x30) // SEQUENCE
                var contentDer = [UInt8]()
                
                // salt OCTET STRING
                contentDer.append(0x04) // OCTET STRING tag
                contentDer.append(UInt8(pbeSalt.count))
                contentDer.append(contentsOf: pbeSalt)
                
                // iterations INTEGER
                contentDer.append(0x02) // INTEGER tag
                // Assuming iterations fits in 2 bytes (2000) -> 0x07D0
                if pbeIterations < 65536 {
                     if pbeIterations < 128 {
                         contentDer.append(1)
                         contentDer.append(UInt8(pbeIterations))
                     } else {
                        contentDer.append(2)
                        contentDer.append(UInt8((pbeIterations >> 8) & 0xFF))
                        contentDer.append(UInt8(pbeIterations & 0xFF))
                     }
                } else {
                    // Fallback simpler
                    contentDer.append(1) 
                    contentDer.append(0x01)
                }
                
                paramsDer.append(UInt8(contentDer.count))
                paramsDer.append(contentsOf: contentDer)
                
                let paramsAny = try ASN1Any(derEncoded: paramsDer)
                let algId = AuthenticationFramework_AlgorithmIdentifier(algorithm: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.12.1.3"), parameters: paramsAny)
                
                let encInfo = PKCS_8_EncryptedPrivateKeyInfo(encryptionAlgorithm: algId, encryptedData: ASN1OctetString(contentBytes: ArraySlice(encryptedKeyData)))
                
                // Serialize encInfo to get Bytes for SafeBag value
                var serializer = DER.Serializer()
                try encInfo.serialize(into: &serializer, withIdentifier: ASN1Identifier.sequence) // SEQUENCE
                let encInfoBytes = serializer.serializedBytes
                let encInfoAny = try ASN1Any(derEncoded: encInfoBytes)
                
                // Create SafeBag
                // id-pkcs8ShroudedKeyBag = 1.2.840.113549.1.12.10.1.2
                let safeBag = PKCS_12_SafeBag(bagId: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.12.10.1.2"), bagValue: encInfoAny, bagAttributes: nil)
                safeBags.append(safeBag)

                
                // Add CertChain as CertBags
                for cert in pk.certChain {
                    print("Converting Chain Certificate type: \(cert.type)")
                    
                    // Wrap cert data in OCTET STRING (Required for x509Certificate bag)
                    let certOctet = ASN1OctetString(contentBytes: ArraySlice(cert.data))
                    var certSer = DER.Serializer()
                    try certOctet.serialize(into: &certSer)
                    let certValAny = try ASN1Any(derEncoded: certSer.serializedBytes)
                    
                    let certBagContent = PKCS_12_CertBag(certId: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.9.22.1"), certValue: certValAny)
                    
                    var cbSerializer = DER.Serializer()
                    try certBagContent.serialize(into: &cbSerializer, withIdentifier: ASN1Identifier.sequence)
                    let cbAny = try ASN1Any(derEncoded: cbSerializer.serializedBytes)
                    let certSafeBag = PKCS_12_SafeBag(bagId: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.12.10.1.3"), bagValue: cbAny, bagAttributes: nil)
                    safeBags.append(certSafeBag)
                }
                
            case .trustedCert(let cert):
                // Wrap in CertBag
                // id-certBag = 1.2.840.113549.1.12.10.1.3
                // CertBag = SEQUENCE { certId, certValue }
                // x509Certificate = 1.2.840.113549.1.9.22.1
                print("Converting Certificate alias: \(entry.alias)")
                
                // Construct CertBag Sequence manually valid for CertBag struct if available
                // PKCS_12_CertBag struct available?
                // ID: 1.2.840.113549.1.9.22.1
                let certBagContent = PKCS_12_CertBag(certId: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.9.22.1"), certValue: try ASN1Any(derEncoded: cert.data))
                
                // Serialize CertBag content
                var cbSerializer = DER.Serializer()
                try certBagContent.serialize(into: &cbSerializer, withIdentifier: ASN1Identifier.sequence)
                let cbAny = try ASN1Any(derEncoded: cbSerializer.serializedBytes)
                
                let safeBag = PKCS_12_SafeBag(bagId: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.12.10.1.3"), bagValue: cbAny, bagAttributes: nil)
                safeBags.append(safeBag)
            }
        }
        
        // Wrap SafeBags in SafeContents (SEQUENCE OF SafeBag)
        var scSerializer = DER.Serializer()
        try scSerializer.appendConstructedNode(identifier: ASN1Identifier.sequence) { coder in
            for bag in safeBags {
                try bag.serialize(into: &coder, withIdentifier: ASN1Identifier.sequence)
            }
        }
        let safeContentsBytes = scSerializer.serializedBytes
        
        // Wrap in EncryptedData ContentInfo (for AuthSafe) - usually we encrypt the SafeContents
        // But for simplicity/standard structure:
        // AuthSafe = SEQUENCE of ContentInfo.
        // We can put SafeContents in "Data" type (1.2.840.113549.1.7.1) unencrypted for now if we assume MacData protection is enough?
        // Standard PFX encrypts the Key bags (inside ShroudedKeyBag) but OFTEN also encrypts the Cert bags container.
        // However, ShroudedKeyBag is already encrypted.

        
        // Wrap in EncryptedData ContentInfo (for AuthSafe)
        // AuthSafe = SEQUENCE of ContentInfo.
        // We put SafeContents in "Data" type (1.2.840.113549.1.7.1)
        
        // Wrap safeContentsBytes in OCTET STRING proper
        let octetWrapper = ASN1OctetString(contentBytes: ArraySlice(safeContentsBytes))
        var osSer = DER.Serializer()
        try octetWrapper.serialize(into: &osSer)
        let octetAny = try ASN1Any(derEncoded: osSer.serializedBytes)
        
        let pfContentInfo = PKCS_7_ContentInfo(contentType: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.7.1"), content: octetAny)

        // AuthenticatedSafe = SEQUENCE OF ContentInfo
        // We just have 1 ContentInfo for now.
        var asSerializer = DER.Serializer()
        try asSerializer.appendConstructedNode(identifier: ASN1Identifier.sequence) { coder in
            try pfContentInfo.serialize(into: &coder, withIdentifier: ASN1Identifier.sequence)
        }
        let authSafeBytes = asSerializer.serializedBytes
        
        // Wrap AuthSafe in ContentInfo (Data)
        let authSafeOctet = ASN1OctetString(contentBytes: ArraySlice(authSafeBytes))
        var asOsSer = DER.Serializer()
        try authSafeOctet.serialize(into: &asOsSer)
        let authSafeAny = try ASN1Any(derEncoded: asOsSer.serializedBytes)
        
        let finalAuthSafeCI = CryptographicMessageSyntax_2010_ContentInfo(contentType: try ASN1ObjectIdentifier(dotRepresentation: "1.2.840.113549.1.7.1"), content: authSafeAny)

        // PFX
        // Version 3 (0x03)
        let pfx = PKCS_12_PFX(version: .v3, authSafe: finalAuthSafeCI, macData: nil)
        
        var pfxSer = DER.Serializer()
        try pfx.serialize(into: &pfxSer, withIdentifier: ASN1Identifier.sequence)
        return pfxSer.serializedBytes

    }
}
