import SwiftASN1

extension ASN1ObjectIdentifier {
    static func + (lhs: ASN1ObjectIdentifier, rhs: [Int]) -> ASN1ObjectIdentifier {
        let lhsString = lhs.description
        let rhsString = rhs.map { String($0) }.joined(separator: ".")
        let newString = "\(lhsString).\(rhsString)"
        return try! ASN1ObjectIdentifier(dotRepresentation: newString)
    }
    
    static func + (lhs: ASN1ObjectIdentifier, rhs: [UInt]) -> ASN1ObjectIdentifier {
         let lhsString = lhs.description
         let rhsString = rhs.map { String($0) }.joined(separator: ".")
         let newString = "\(lhsString).\(rhsString)"
         return try! ASN1ObjectIdentifier(dotRepresentation: newString)
    }
}
