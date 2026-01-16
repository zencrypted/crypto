// Consolidated ASN.1 Generated Files
// Generated at 2026-01-17 01:22:27 +0200

import Foundation
import SwiftASN1

// MARK: - AttributeCertificateVersion1_2009_AlgorithmIdentifier.swift
@usableFromInline typealias AttributeCertificateVersion1_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - AttributeCertificateVersion1_2009_AttCertVersionV1.swift
public struct AttributeCertificateVersion1_2009_AttCertVersionV1 : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: AttributeCertificateVersion1_2009_AttCertVersionV1, rhs: AttributeCertificateVersion1_2009_AttCertVersionV1) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v1 = Self(rawValue: 0)
}

// MARK: - AttributeCertificateVersion1_2009_AttributeCertificateInfoV1.swift
@usableFromInline struct AttributeCertificateVersion1_2009_AttributeCertificateInfoV1: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: AttributeCertificateVersion1_2009_AttCertVersionV1?
    @usableFromInline var subject: AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice
    @usableFromInline var issuer: PKIX1Implicit88_GeneralNames
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @usableFromInline var attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod
    @usableFromInline var attributes: [PKIX_CommonTypes_2009_AttributeSet]
    @usableFromInline var issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier?
    @usableFromInline var extensions: AuthenticationFramework_Extensions?
    @inlinable init(version: AttributeCertificateVersion1_2009_AttCertVersionV1?, subject: AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice, issuer: PKIX1Implicit88_GeneralNames, signature: AuthenticationFramework_AlgorithmIdentifier, serialNumber: ArraySlice<UInt8>, attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod, attributes: [PKIX_CommonTypes_2009_AttributeSet], issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier?, extensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.subject = subject
        self.issuer = issuer
        self.signature = signature
        self.serialNumber = serialNumber
        self.attCertValidityPeriod = attCertValidityPeriod
        self.attributes = attributes
        self.issuerUniqueID = issuerUniqueID
        self.extensions = extensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var version: AttributeCertificateVersion1_2009_AttCertVersionV1? = nil
var peek_version = nodes
if let next = peek_version.next(), next.identifier == AttributeCertificateVersion1_2009_AttCertVersionV1.defaultIdentifier {
    version = try AttributeCertificateVersion1_2009_AttCertVersionV1(derEncoded: &nodes)
}
            let subject: AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice = try AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice(derEncoded: &nodes)
            let issuer: PKIX1Implicit88_GeneralNames = try PKIX1Implicit88_GeneralNames(derEncoded: &nodes)
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod = try AuthenticationFramework_AttCertValidityPeriod(derEncoded: &nodes)
            let attributes: [PKIX_CommonTypes_2009_AttributeSet] = try DER.sequence(of: PKIX_CommonTypes_2009_AttributeSet.self, identifier: .sequence, nodes: &nodes)
            var issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier? = nil
var peek_issuerUniqueID = nodes
if let next = peek_issuerUniqueID.next(), next.identifier == SelectedAttributeTypes_UniqueIdentifier.defaultIdentifier {
    issuerUniqueID = try SelectedAttributeTypes_UniqueIdentifier(derEncoded: &nodes)
}
            var extensions: AuthenticationFramework_Extensions? = nil
var peek_extensions = nodes
if let next = peek_extensions.next(), next.identifier == AuthenticationFramework_Extensions.defaultIdentifier {
    extensions = try AuthenticationFramework_Extensions(derEncoded: &nodes)
}

            return AttributeCertificateVersion1_2009_AttributeCertificateInfoV1(version: version, subject: subject, issuer: issuer, signature: signature, serialNumber: serialNumber, attCertValidityPeriod: attCertValidityPeriod, attributes: attributes, issuerUniqueID: issuerUniqueID, extensions: extensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(version) }
            try coder.serialize(subject)
            try coder.serialize(issuer)
            try coder.serialize(signature)
            try coder.serialize(serialNumber)
            try coder.serialize(attCertValidityPeriod)
            try coder.serializeSequenceOf(attributes)
            if let issuerUniqueID = self.issuerUniqueID { try coder.serialize(issuerUniqueID) }
            if let extensions = self.extensions { try coder.serialize(extensions) }

        }
    }
}

// MARK: - AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice.swift
@usableFromInline indirect enum AttributeCertificateVersion1_2009_AttributeCertificateInfoV1_subject_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case baseCertificateID(AuthenticationFramework_IssuerSerial)
    case subjectName(PKIX1Implicit88_GeneralNames)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .baseCertificateID(try AuthenticationFramework_IssuerSerial(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .subjectName(try PKIX1Implicit88_GeneralNames(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .baseCertificateID(let baseCertificateID): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try baseCertificateID.serialize(into: &coder) }
        case .subjectName(let subjectName): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try subjectName.serialize(into: &coder) }

        }
    }

}

// MARK: - AttributeCertificateVersion1_2009_AttributeCertificateV1.swift
@usableFromInline struct AttributeCertificateVersion1_2009_AttributeCertificateV1: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var toBeSigned: AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(toBeSigned: AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.toBeSigned = toBeSigned
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let toBeSigned: AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned = try AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned(derEncoded: &nodes)
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AttributeCertificateVersion1_2009_AttributeCertificateV1(toBeSigned: toBeSigned, algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(toBeSigned)
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned.swift
@usableFromInline typealias AttributeCertificateVersion1_2009_AttributeCertificateV1_toBeSigned = AttributeCertificateVersion1_2009_AttributeCertificateInfoV1

// MARK: - AttributeCertificateVersion1_2009_CertificateSerialNumber.swift
@usableFromInline typealias AttributeCertificateVersion1_2009_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - AttributeCertificateVersion1_2009_Extensions.swift
@usableFromInline typealias AttributeCertificateVersion1_2009_Extensions = AuthenticationFramework_Extensions

// MARK: - AttributeCertificateVersion1_2009_GeneralNames.swift
@usableFromInline typealias AttributeCertificateVersion1_2009_GeneralNames = PKIX1Implicit88_GeneralNames

// MARK: - AuthenticationFramework_ACPathData.swift
@usableFromInline struct AuthenticationFramework_ACPathData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certificate: AuthenticationFramework_Certificate?
    @usableFromInline var attributeCertificate: AuthenticationFramework_AttributeCertificate?
    @inlinable init(certificate: AuthenticationFramework_Certificate?, attributeCertificate: AuthenticationFramework_AttributeCertificate?) {
        self.certificate = certificate
        self.attributeCertificate = attributeCertificate

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certificate: AuthenticationFramework_Certificate? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Certificate(derEncoded: node) }
            let attributeCertificate: AuthenticationFramework_AttributeCertificate? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try AuthenticationFramework_AttributeCertificate(derEncoded: node) }

            return AuthenticationFramework_ACPathData(certificate: certificate, attributeCertificate: attributeCertificate)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let certificate = self.certificate { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(certificate) } }
            if let attributeCertificate = self.attributeCertificate { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(attributeCertificate) } }

        }
    }
}

// MARK: - AuthenticationFramework_ALGORITHM.swift
@usableFromInline typealias AuthenticationFramework_ALGORITHM = ASN1Any

// MARK: - AuthenticationFramework_AlgorithmIdentifier.swift
@usableFromInline struct AuthenticationFramework_AlgorithmIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any?) {
        self.algorithm = algorithm
        self.parameters = parameters

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let parameters: ASN1Any? = nodes.next().map { ASN1Any(derEncoded: $0) }

            return AuthenticationFramework_AlgorithmIdentifier(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = self.parameters { try coder.serialize(parameters) }

        }
    }
}

// MARK: - AuthenticationFramework_AttCertValidityPeriod.swift
@usableFromInline struct AuthenticationFramework_AttCertValidityPeriod: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBeforeTime: GeneralizedTime
    @usableFromInline var notAfterTime: GeneralizedTime
    @inlinable init(notBeforeTime: GeneralizedTime, notAfterTime: GeneralizedTime) {
        self.notBeforeTime = notBeforeTime
        self.notAfterTime = notAfterTime

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBeforeTime: GeneralizedTime = try GeneralizedTime(derEncoded: &nodes)
            let notAfterTime: GeneralizedTime = try GeneralizedTime(derEncoded: &nodes)

            return AuthenticationFramework_AttCertValidityPeriod(notBeforeTime: notBeforeTime, notAfterTime: notAfterTime)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(notBeforeTime)
            try coder.serialize(notAfterTime)

        }
    }
}

// MARK: - AuthenticationFramework_AttributeCertificate.swift
@usableFromInline struct AuthenticationFramework_AttributeCertificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var toBeSigned: AuthenticationFramework_AttributeCertificate_toBeSigned
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(toBeSigned: AuthenticationFramework_AttributeCertificate_toBeSigned, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.toBeSigned = toBeSigned
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let toBeSigned: AuthenticationFramework_AttributeCertificate_toBeSigned = try AuthenticationFramework_AttributeCertificate_toBeSigned(derEncoded: &nodes)
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_AttributeCertificate(toBeSigned: toBeSigned, algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(toBeSigned)
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AuthenticationFramework_AttributeCertificateAssertion.swift
@usableFromInline struct AuthenticationFramework_AttributeCertificateAssertion: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var subject: AuthenticationFramework_AttributeCertificateAssertion_subject_Choice?
    @usableFromInline var issuer: InformationFramework_Name?
    @usableFromInline var attCertValidity: GeneralizedTime?
    @usableFromInline var attType: [PKIX1Explicit88_AttributeType]?
    @inlinable init(subject: AuthenticationFramework_AttributeCertificateAssertion_subject_Choice?, issuer: InformationFramework_Name?, attCertValidity: GeneralizedTime?, attType: [PKIX1Explicit88_AttributeType]?) {
        self.subject = subject
        self.issuer = issuer
        self.attCertValidity = attCertValidity
        self.attType = attType

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let subject: AuthenticationFramework_AttributeCertificateAssertion_subject_Choice? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_AttributeCertificateAssertion_subject_Choice(derEncoded: node) }
            let issuer: InformationFramework_Name? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try InformationFramework_Name(derEncoded: node) }
            let attCertValidity: GeneralizedTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try GeneralizedTime(derEncoded: node) }
            let attType: [PKIX1Explicit88_AttributeType]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in try DER.set(of: PKIX1Explicit88_AttributeType.self, identifier: .set, rootNode: node) }

            return AuthenticationFramework_AttributeCertificateAssertion(subject: subject, issuer: issuer, attCertValidity: attCertValidity, attType: attType)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let subject = self.subject { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(subject) } }
            if let issuer = self.issuer { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(issuer) } }
            if let attCertValidity = self.attCertValidity { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(attCertValidity) } }
            if let attType = self.attType { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(attType) } }

        }
    }
}

// MARK: - AuthenticationFramework_AttributeCertificateAssertion_subject_Choice.swift
@usableFromInline indirect enum AuthenticationFramework_AttributeCertificateAssertion_subject_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case baseCertificateID(AuthenticationFramework_IssuerSerial)
    case subjectName(InformationFramework_Name)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .baseCertificateID(try AuthenticationFramework_IssuerSerial(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .subjectName(try InformationFramework_Name(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .baseCertificateID(let baseCertificateID): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try baseCertificateID.serialize(into: &coder) }
        case .subjectName(let subjectName): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try subjectName.serialize(into: &coder) }

        }
    }

}

// MARK: - AuthenticationFramework_AttributeCertificateInfo.swift
@usableFromInline struct AuthenticationFramework_AttributeCertificateInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: AuthenticationFramework_Version?
    @usableFromInline var subject: AuthenticationFramework_AttributeCertificateInfo_subject_Choice
    @usableFromInline var issuer: PKIX1Implicit88_GeneralNames
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @usableFromInline var attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod
    @usableFromInline var attributes: [PKIX1Explicit88_Attribute]
    @usableFromInline var issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier?
    @usableFromInline var extensions: AuthenticationFramework_Extensions?
    @inlinable init(version: AuthenticationFramework_Version?, subject: AuthenticationFramework_AttributeCertificateInfo_subject_Choice, issuer: PKIX1Implicit88_GeneralNames, signature: AuthenticationFramework_AlgorithmIdentifier, serialNumber: ArraySlice<UInt8>, attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod, attributes: [PKIX1Explicit88_Attribute], issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier?, extensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.subject = subject
        self.issuer = issuer
        self.signature = signature
        self.serialNumber = serialNumber
        self.attCertValidityPeriod = attCertValidityPeriod
        self.attributes = attributes
        self.issuerUniqueID = issuerUniqueID
        self.extensions = extensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var version: AuthenticationFramework_Version? = nil
var peek_version = nodes
if let next = peek_version.next(), next.identifier == AuthenticationFramework_Version.defaultIdentifier {
    version = try AuthenticationFramework_Version(derEncoded: &nodes)
}
            let subject: AuthenticationFramework_AttributeCertificateInfo_subject_Choice = try AuthenticationFramework_AttributeCertificateInfo_subject_Choice(derEncoded: &nodes)
            let issuer: PKIX1Implicit88_GeneralNames = try PKIX1Implicit88_GeneralNames(derEncoded: &nodes)
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let attCertValidityPeriod: AuthenticationFramework_AttCertValidityPeriod = try AuthenticationFramework_AttCertValidityPeriod(derEncoded: &nodes)
            let attributes: [PKIX1Explicit88_Attribute] = try DER.sequence(of: PKIX1Explicit88_Attribute.self, identifier: .sequence, nodes: &nodes)
            var issuerUniqueID: SelectedAttributeTypes_UniqueIdentifier? = nil
var peek_issuerUniqueID = nodes
if let next = peek_issuerUniqueID.next(), next.identifier == SelectedAttributeTypes_UniqueIdentifier.defaultIdentifier {
    issuerUniqueID = try SelectedAttributeTypes_UniqueIdentifier(derEncoded: &nodes)
}
            var extensions: AuthenticationFramework_Extensions? = nil
var peek_extensions = nodes
if let next = peek_extensions.next(), next.identifier == AuthenticationFramework_Extensions.defaultIdentifier {
    extensions = try AuthenticationFramework_Extensions(derEncoded: &nodes)
}

            return AuthenticationFramework_AttributeCertificateInfo(version: version, subject: subject, issuer: issuer, signature: signature, serialNumber: serialNumber, attCertValidityPeriod: attCertValidityPeriod, attributes: attributes, issuerUniqueID: issuerUniqueID, extensions: extensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(version) }
            try coder.serialize(subject)
            try coder.serialize(issuer)
            try coder.serialize(signature)
            try coder.serialize(serialNumber)
            try coder.serialize(attCertValidityPeriod)
            try coder.serializeSequenceOf(attributes)
            if let issuerUniqueID = self.issuerUniqueID { try coder.serialize(issuerUniqueID) }
            if let extensions = self.extensions { try coder.serialize(extensions) }

        }
    }
}

// MARK: - AuthenticationFramework_AttributeCertificateInfo_subject_Choice.swift
@usableFromInline indirect enum AuthenticationFramework_AttributeCertificateInfo_subject_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case baseCertificateID(AuthenticationFramework_IssuerSerial)
    case subjectName(PKIX1Implicit88_GeneralNames)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .baseCertificateID(try AuthenticationFramework_IssuerSerial(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .subjectName(try PKIX1Implicit88_GeneralNames(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .baseCertificateID(let baseCertificateID): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try baseCertificateID.serialize(into: &coder) }
        case .subjectName(let subjectName): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try subjectName.serialize(into: &coder) }

        }
    }

}

// MARK: - AuthenticationFramework_AttributeCertificate_toBeSigned.swift
@usableFromInline typealias AuthenticationFramework_AttributeCertificate_toBeSigned = AuthenticationFramework_AttributeCertificateInfo

// MARK: - AuthenticationFramework_AttributeCertificationPath.swift
@usableFromInline struct AuthenticationFramework_AttributeCertificationPath: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attributeCertificate: AuthenticationFramework_AttributeCertificate
    @usableFromInline var acPath: [AuthenticationFramework_ACPathData]?
    @inlinable init(attributeCertificate: AuthenticationFramework_AttributeCertificate, acPath: [AuthenticationFramework_ACPathData]?) {
        self.attributeCertificate = attributeCertificate
        self.acPath = acPath

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attributeCertificate: AuthenticationFramework_AttributeCertificate = try AuthenticationFramework_AttributeCertificate(derEncoded: &nodes)
            let acPath: [AuthenticationFramework_ACPathData]? = try DER.sequence(of: AuthenticationFramework_ACPathData.self, identifier: .sequence, nodes: &nodes)

            return AuthenticationFramework_AttributeCertificationPath(attributeCertificate: attributeCertificate, acPath: acPath)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attributeCertificate)
            if let acPath = self.acPath { try coder.serializeSequenceOf(acPath) }

        }
    }
}

// MARK: - AuthenticationFramework_Certificate.swift
@usableFromInline struct AuthenticationFramework_Certificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var toBeSigned: AuthenticationFramework_Certificate_toBeSigned
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(toBeSigned: AuthenticationFramework_Certificate_toBeSigned, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.toBeSigned = toBeSigned
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let toBeSigned: AuthenticationFramework_Certificate_toBeSigned = try AuthenticationFramework_Certificate_toBeSigned(derEncoded: &nodes)
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_Certificate(toBeSigned: toBeSigned, algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(toBeSigned)
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AuthenticationFramework_CertificateList.swift
@usableFromInline struct AuthenticationFramework_CertificateList: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var toBeSigned: AuthenticationFramework_CertificateList_toBeSigned
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(toBeSigned: AuthenticationFramework_CertificateList_toBeSigned, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.toBeSigned = toBeSigned
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let toBeSigned: AuthenticationFramework_CertificateList_toBeSigned = try AuthenticationFramework_CertificateList_toBeSigned(derEncoded: &nodes)
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_CertificateList(toBeSigned: toBeSigned, algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(toBeSigned)
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AuthenticationFramework_CertificateList_toBeSigned.swift
@usableFromInline struct AuthenticationFramework_CertificateList_toBeSigned: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: AuthenticationFramework_Version?
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var thisUpdate: AuthenticationFramework_Time
    @usableFromInline var nextUpdate: AuthenticationFramework_Time?
    @usableFromInline var revokedCertificates: [AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence]?
    @usableFromInline var crlExtensions: AuthenticationFramework_Extensions?
    @inlinable init(version: AuthenticationFramework_Version?, signature: AuthenticationFramework_AlgorithmIdentifier, issuer: InformationFramework_Name, thisUpdate: AuthenticationFramework_Time, nextUpdate: AuthenticationFramework_Time?, revokedCertificates: [AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence]?, crlExtensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.signature = signature
        self.issuer = issuer
        self.thisUpdate = thisUpdate
        self.nextUpdate = nextUpdate
        self.revokedCertificates = revokedCertificates
        self.crlExtensions = crlExtensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var version: AuthenticationFramework_Version? = nil
var peek_version = nodes
if let next = peek_version.next(), next.identifier == AuthenticationFramework_Version.defaultIdentifier {
    version = try AuthenticationFramework_Version(derEncoded: &nodes)
}
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let thisUpdate: AuthenticationFramework_Time = try AuthenticationFramework_Time(derEncoded: &nodes)
            var nextUpdate: AuthenticationFramework_Time? = nil
var peek_nextUpdate = nodes
if let next = peek_nextUpdate.next(), next.identifier == AuthenticationFramework_Time.defaultIdentifier {
    nextUpdate = try AuthenticationFramework_Time(derEncoded: &nodes)
}
            let revokedCertificates: [AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence]? = try DER.sequence(of: AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence.self, identifier: .sequence, nodes: &nodes)
            let crlExtensions: AuthenticationFramework_Extensions? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Extensions(derEncoded: node) }

            return AuthenticationFramework_CertificateList_toBeSigned(version: version, signature: signature, issuer: issuer, thisUpdate: thisUpdate, nextUpdate: nextUpdate, revokedCertificates: revokedCertificates, crlExtensions: crlExtensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(version) }
            try coder.serialize(signature)
            try coder.serialize(issuer)
            try coder.serialize(thisUpdate)
            if let nextUpdate = self.nextUpdate { try coder.serialize(nextUpdate) }
            if let revokedCertificates = self.revokedCertificates { try coder.serializeSequenceOf(revokedCertificates) }
            if let crlExtensions = self.crlExtensions { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(crlExtensions) } }

        }
    }
}

// MARK: - AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence.swift
@usableFromInline struct AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var userCertificate: ArraySlice<UInt8>
    @usableFromInline var revocationDate: AuthenticationFramework_Time
    @usableFromInline var crlEntryExtensions: AuthenticationFramework_Extensions?
    @inlinable init(userCertificate: ArraySlice<UInt8>, revocationDate: AuthenticationFramework_Time, crlEntryExtensions: AuthenticationFramework_Extensions?) {
        self.userCertificate = userCertificate
        self.revocationDate = revocationDate
        self.crlEntryExtensions = crlEntryExtensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let userCertificate: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let revocationDate: AuthenticationFramework_Time = try AuthenticationFramework_Time(derEncoded: &nodes)
            var crlEntryExtensions: AuthenticationFramework_Extensions? = nil
var peek_crlEntryExtensions = nodes
if let next = peek_crlEntryExtensions.next(), next.identifier == AuthenticationFramework_Extensions.defaultIdentifier {
    crlEntryExtensions = try AuthenticationFramework_Extensions(derEncoded: &nodes)
}

            return AuthenticationFramework_CertificateList_toBeSigned_revokedCertificates_Sequence(userCertificate: userCertificate, revocationDate: revocationDate, crlEntryExtensions: crlEntryExtensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(userCertificate)
            try coder.serialize(revocationDate)
            if let crlEntryExtensions = self.crlEntryExtensions { try coder.serialize(crlEntryExtensions) }

        }
    }
}

// MARK: - AuthenticationFramework_CertificatePair.swift
@usableFromInline struct AuthenticationFramework_CertificatePair: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuedByThisCA: AuthenticationFramework_Certificate?
    @usableFromInline var issuedToThisCA: AuthenticationFramework_Certificate?
    @inlinable init(issuedByThisCA: AuthenticationFramework_Certificate?, issuedToThisCA: AuthenticationFramework_Certificate?) {
        self.issuedByThisCA = issuedByThisCA
        self.issuedToThisCA = issuedToThisCA

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuedByThisCA: AuthenticationFramework_Certificate? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Certificate(derEncoded: node) }
            let issuedToThisCA: AuthenticationFramework_Certificate? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Certificate(derEncoded: node) }

            return AuthenticationFramework_CertificatePair(issuedByThisCA: issuedByThisCA, issuedToThisCA: issuedToThisCA)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let issuedByThisCA = self.issuedByThisCA { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(issuedByThisCA) } }
            if let issuedToThisCA = self.issuedToThisCA { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(issuedToThisCA) } }

        }
    }
}

// MARK: - AuthenticationFramework_CertificateSerialNumber.swift
@usableFromInline typealias AuthenticationFramework_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - AuthenticationFramework_Certificate_toBeSigned.swift
@usableFromInline struct AuthenticationFramework_Certificate_toBeSigned: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: AuthenticationFramework_Version?
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var validity: AuthenticationFramework_Validity
    @usableFromInline var subject: InformationFramework_Name
    @usableFromInline var subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo
    @usableFromInline var issuerUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier?
    @usableFromInline var subjectUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier?
    @usableFromInline var extensions: AuthenticationFramework_Extensions?
    @inlinable init(version: AuthenticationFramework_Version?, serialNumber: ArraySlice<UInt8>, signature: AuthenticationFramework_AlgorithmIdentifier, issuer: InformationFramework_Name, validity: AuthenticationFramework_Validity, subject: InformationFramework_Name, subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo, issuerUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier?, subjectUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier?, extensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.serialNumber = serialNumber
        self.signature = signature
        self.issuer = issuer
        self.validity = validity
        self.subject = subject
        self.subjectPublicKeyInfo = subjectPublicKeyInfo
        self.issuerUniqueIdentifier = issuerUniqueIdentifier
        self.subjectUniqueIdentifier = subjectUniqueIdentifier
        self.extensions = extensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: AuthenticationFramework_Version? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Version(derEncoded: node) }
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let validity: AuthenticationFramework_Validity = try AuthenticationFramework_Validity(derEncoded: &nodes)
            let subject: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo = try AuthenticationFramework_SubjectPublicKeyInfo(derEncoded: &nodes)
            let issuerUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let subjectUniqueIdentifier: SelectedAttributeTypes_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let extensions: AuthenticationFramework_Extensions? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Extensions(derEncoded: node) }

            return AuthenticationFramework_Certificate_toBeSigned(version: version, serialNumber: serialNumber, signature: signature, issuer: issuer, validity: validity, subject: subject, subjectPublicKeyInfo: subjectPublicKeyInfo, issuerUniqueIdentifier: issuerUniqueIdentifier, subjectUniqueIdentifier: subjectUniqueIdentifier, extensions: extensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(version) } }
            try coder.serialize(serialNumber)
            try coder.serialize(signature)
            try coder.serialize(issuer)
            try coder.serialize(validity)
            try coder.serialize(subject)
            try coder.serialize(subjectPublicKeyInfo)
            if let issuerUniqueIdentifier = self.issuerUniqueIdentifier { try coder.serializeOptionalImplicitlyTagged(issuerUniqueIdentifier, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let subjectUniqueIdentifier = self.subjectUniqueIdentifier { try coder.serializeOptionalImplicitlyTagged(subjectUniqueIdentifier, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let extensions = self.extensions { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serialize(extensions) } }

        }
    }
}

// MARK: - AuthenticationFramework_Certificates.swift
@usableFromInline struct AuthenticationFramework_Certificates: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var userCertificate: AuthenticationFramework_Certificate
    @usableFromInline var certificationPath: AuthenticationFramework_ForwardCertificationPath?
    @inlinable init(userCertificate: AuthenticationFramework_Certificate, certificationPath: AuthenticationFramework_ForwardCertificationPath?) {
        self.userCertificate = userCertificate
        self.certificationPath = certificationPath

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let userCertificate: AuthenticationFramework_Certificate = try AuthenticationFramework_Certificate(derEncoded: &nodes)
            var certificationPath: AuthenticationFramework_ForwardCertificationPath? = nil
var peek_certificationPath = nodes
if let next = peek_certificationPath.next(), next.identifier == AuthenticationFramework_ForwardCertificationPath.defaultIdentifier {
    certificationPath = try AuthenticationFramework_ForwardCertificationPath(derEncoded: &nodes)
}

            return AuthenticationFramework_Certificates(userCertificate: userCertificate, certificationPath: certificationPath)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(userCertificate)
            if let certificationPath = self.certificationPath { try coder.serialize(certificationPath) }

        }
    }
}

// MARK: - AuthenticationFramework_CertificationPath.swift
@usableFromInline struct AuthenticationFramework_CertificationPath: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var userCertificate: AuthenticationFramework_Certificate
    @usableFromInline var theCACertificates: [AuthenticationFramework_CertificatePair]?
    @inlinable init(userCertificate: AuthenticationFramework_Certificate, theCACertificates: [AuthenticationFramework_CertificatePair]?) {
        self.userCertificate = userCertificate
        self.theCACertificates = theCACertificates

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let userCertificate: AuthenticationFramework_Certificate = try AuthenticationFramework_Certificate(derEncoded: &nodes)
            let theCACertificates: [AuthenticationFramework_CertificatePair]? = try DER.sequence(of: AuthenticationFramework_CertificatePair.self, identifier: .sequence, nodes: &nodes)

            return AuthenticationFramework_CertificationPath(userCertificate: userCertificate, theCACertificates: theCACertificates)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(userCertificate)
            if let theCACertificates = self.theCACertificates { try coder.serializeSequenceOf(theCACertificates) }

        }
    }
}

// MARK: - AuthenticationFramework_CrossCertificates.swift
@usableFromInline struct AuthenticationFramework_CrossCertificates: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [AuthenticationFramework_Certificate]
    @inlinable public init(_ value: [AuthenticationFramework_Certificate]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: AuthenticationFramework_Certificate.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - AuthenticationFramework_ENCRYPTED.swift
@usableFromInline typealias AuthenticationFramework_ENCRYPTED = ASN1BitString

// MARK: - AuthenticationFramework_ENCRYPTED_HASH.swift
@usableFromInline typealias AuthenticationFramework_ENCRYPTED_HASH = ASN1BitString

// MARK: - AuthenticationFramework_Extension.swift
@usableFromInline struct AuthenticationFramework_Extension: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extnId: ASN1ObjectIdentifier
    @usableFromInline var critical: Bool
    @usableFromInline var extnValue: ASN1OctetString

    @inlinable init(extnId: ASN1ObjectIdentifier, critical: Bool = false, extnValue: ASN1OctetString) {
        self.extnId = extnId
        self.critical = critical
        self.extnValue = extnValue
    }

    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extnId = try ASN1ObjectIdentifier(derEncoded: &nodes)

            // critical is OPTIONAL with DEFAULT FALSE
            var critical: Bool = false
            var peekNodes = nodes
            if let nextNode = peekNodes.next(), nextNode.identifier == .boolean {
                critical = try Bool(derEncoded: &nodes)
            }

            let extnValue = try ASN1OctetString(derEncoded: &nodes)

            return AuthenticationFramework_Extension(extnId: extnId, critical: critical, extnValue: extnValue)
        }
    }

    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(extnId)
            // Only serialize critical if it's true (per DER rules for DEFAULT FALSE)
            if critical {
                try coder.serialize(critical)
            }
            try coder.serialize(extnValue)
        }
    }
}

// MARK: - AuthenticationFramework_Extensions.swift
@usableFromInline struct AuthenticationFramework_Extensions: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [AuthenticationFramework_Extension]
    @inlinable public init(_ value: [AuthenticationFramework_Extension]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: AuthenticationFramework_Extension.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - AuthenticationFramework_ForwardCertificationPath.swift
@usableFromInline struct AuthenticationFramework_ForwardCertificationPath: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [AuthenticationFramework_CrossCertificates]
    @inlinable public init(_ value: [AuthenticationFramework_CrossCertificates]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: AuthenticationFramework_CrossCertificates.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - AuthenticationFramework_GeneralNames.swift
@usableFromInline typealias AuthenticationFramework_GeneralNames = PKIX1Implicit88_GeneralNames

// MARK: - AuthenticationFramework_HASH.swift
@usableFromInline struct AuthenticationFramework_HASH: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var hash_value: ASN1BitString
    @inlinable init(algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, hash_value: ASN1BitString) {
        self.algorithmIdentifier = algorithmIdentifier
        self.hash_value = hash_value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let hash_value: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_HASH(algorithmIdentifier: algorithmIdentifier, hash_value: hash_value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(hash_value)

        }
    }
}

// MARK: - AuthenticationFramework_IssuerSerial.swift
@usableFromInline struct AuthenticationFramework_IssuerSerial: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuer: PKIX1Implicit88_GeneralNames
    @usableFromInline var serial: ArraySlice<UInt8>
    @usableFromInline var issuerUID: SelectedAttributeTypes_UniqueIdentifier?
    @inlinable init(issuer: PKIX1Implicit88_GeneralNames, serial: ArraySlice<UInt8>, issuerUID: SelectedAttributeTypes_UniqueIdentifier?) {
        self.issuer = issuer
        self.serial = serial
        self.issuerUID = issuerUID

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuer: PKIX1Implicit88_GeneralNames = try PKIX1Implicit88_GeneralNames(derEncoded: &nodes)
            let serial: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            var issuerUID: SelectedAttributeTypes_UniqueIdentifier? = nil
var peek_issuerUID = nodes
if let next = peek_issuerUID.next(), next.identifier == SelectedAttributeTypes_UniqueIdentifier.defaultIdentifier {
    issuerUID = try SelectedAttributeTypes_UniqueIdentifier(derEncoded: &nodes)
}

            return AuthenticationFramework_IssuerSerial(issuer: issuer, serial: serial, issuerUID: issuerUID)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuer)
            try coder.serialize(serial)
            if let issuerUID = self.issuerUID { try coder.serialize(issuerUID) }

        }
    }
}

// MARK: - AuthenticationFramework_Name.swift
@usableFromInline typealias AuthenticationFramework_Name = InformationFramework_Name

// MARK: - AuthenticationFramework_SIGNATURE.swift
@usableFromInline struct AuthenticationFramework_SIGNATURE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_SIGNATURE(algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AuthenticationFramework_SIGNED.swift
@usableFromInline struct AuthenticationFramework_SIGNED: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var toBeSigned: ASN1Any
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encrypted: ASN1BitString
    @inlinable init(toBeSigned: ASN1Any, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, encrypted: ASN1BitString) {
        self.toBeSigned = toBeSigned
        self.algorithmIdentifier = algorithmIdentifier
        self.encrypted = encrypted

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let toBeSigned: ASN1Any = try ASN1Any(derEncoded: &nodes)
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encrypted: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_SIGNED(toBeSigned: toBeSigned, algorithmIdentifier: algorithmIdentifier, encrypted: encrypted)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(toBeSigned)
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(encrypted)

        }
    }
}

// MARK: - AuthenticationFramework_SubjectPublicKeyInfo.swift
@usableFromInline struct AuthenticationFramework_SubjectPublicKeyInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var subjectPublicKey: ASN1BitString
    @inlinable init(algorithm: AuthenticationFramework_AlgorithmIdentifier, subjectPublicKey: ASN1BitString) {
        self.algorithm = algorithm
        self.subjectPublicKey = subjectPublicKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let subjectPublicKey: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return AuthenticationFramework_SubjectPublicKeyInfo(algorithm: algorithm, subjectPublicKey: subjectPublicKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            try coder.serialize(subjectPublicKey)

        }
    }
}

// MARK: - AuthenticationFramework_Time.swift
@usableFromInline indirect enum AuthenticationFramework_Time: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case utcTime(UTCTime)
    case generalizedTime(GeneralizedTime)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case UTCTime.defaultIdentifier:
            self = .utcTime(try UTCTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case GeneralizedTime.defaultIdentifier:
            self = .generalizedTime(try GeneralizedTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .utcTime(let utcTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utcTime)
                            }
                        } else {
                            try coder.serialize(utcTime)
                        }
        case .generalizedTime(let generalizedTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(generalizedTime)
                            }
                        } else {
                            try coder.serialize(generalizedTime)
                        }

        }
    }

}

// MARK: - AuthenticationFramework_Validity.swift
@usableFromInline struct AuthenticationFramework_Validity: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBefore: AuthenticationFramework_Time
    @usableFromInline var notAfter: AuthenticationFramework_Time
    @inlinable init(notBefore: AuthenticationFramework_Time, notAfter: AuthenticationFramework_Time) {
        self.notBefore = notBefore
        self.notAfter = notAfter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBefore: AuthenticationFramework_Time = try AuthenticationFramework_Time(derEncoded: &nodes)
            let notAfter: AuthenticationFramework_Time = try AuthenticationFramework_Time(derEncoded: &nodes)

            return AuthenticationFramework_Validity(notBefore: notBefore, notAfter: notAfter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(notBefore)
            try coder.serialize(notAfter)

        }
    }
}

// MARK: - AuthenticationFramework_Version.swift
public struct AuthenticationFramework_Version : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: AuthenticationFramework_Version, rhs: AuthenticationFramework_Version) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v1 = Self(rawValue: 0)
    public static let v2 = Self(rawValue: 1)
    public static let v3 = Self(rawValue: 2)
}

// MARK: - AuthenticationFramework_der_oid.swift
public let AuthenticationFramework_der: ASN1ObjectIdentifier = [2, 1, 2, 1]

// MARK: - AuthenticationFramework_id_at_attributeCertificateRevocationList_oid.swift
public let AuthenticationFramework_id_at_attributeCertificateRevocationList: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [59]

// MARK: - AuthenticationFramework_id_at_attributeCertificate_oid.swift
public let AuthenticationFramework_id_at_attributeCertificate: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [58]

// MARK: - AuthenticationFramework_id_at_authorityRevocationList_oid.swift
public let AuthenticationFramework_id_at_authorityRevocationList: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [38]

// MARK: - AuthenticationFramework_id_at_cAcertificate_oid.swift
public let AuthenticationFramework_id_at_cAcertificate: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [37]

// MARK: - AuthenticationFramework_id_at_certificateRevocationList_oid.swift
public let AuthenticationFramework_id_at_certificateRevocationList: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [39]

// MARK: - AuthenticationFramework_id_at_crossCertificatePair_oid.swift
public let AuthenticationFramework_id_at_crossCertificatePair: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [40]

// MARK: - AuthenticationFramework_id_at_userCertificate_oid.swift
public let AuthenticationFramework_id_at_userCertificate: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [36]

// MARK: - AuthenticationFramework_id_at_userPassword_oid.swift
public let AuthenticationFramework_id_at_userPassword: ASN1ObjectIdentifier = UsefulDefinitions_id_at + [35]

// MARK: - AuthenticationFramework_id_mr_attributeCertificateMatch_oid.swift
public let AuthenticationFramework_id_mr_attributeCertificateMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [42]

// MARK: - CryptographicMessageSyntax_2009_AlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_AlgorithmInformation_2009_AlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_AlgorithmInformation_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_Attribute.swift
@usableFromInline struct CryptographicMessageSyntax_2009_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var values: [ASN1Any]
    @inlinable init(type: ASN1ObjectIdentifier, values: [ASN1Any]) {
        self.type = type
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let values: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return CryptographicMessageSyntax_2009_Attribute(type: type, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serializeSetOf(values)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_AttributeCertificateV2.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_AttributeCertificateV2 = AuthenticationFramework_AttributeCertificate

// MARK: - CryptographicMessageSyntax_2009_Attributes.swift
@usableFromInline struct CryptographicMessageSyntax_2009_Attributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_AuthAttributes.swift
@usableFromInline struct CryptographicMessageSyntax_2009_AuthAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_AuthenticatedData.swift
@usableFromInline struct CryptographicMessageSyntax_2009_AuthenticatedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo?
    @usableFromInline var recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos
    @usableFromInline var macAlgorithm: CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier?
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo
    @usableFromInline var authAttrs: CryptographicMessageSyntax_2009_AuthAttributes?
    @usableFromInline var mac: CryptographicMessageSyntax_2009_MessageAuthenticationCode
    @usableFromInline var unauthAttrs: CryptographicMessageSyntax_2009_UnauthAttributes?
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo?, recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos, macAlgorithm: CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm, digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier?, encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo, authAttrs: CryptographicMessageSyntax_2009_AuthAttributes?, mac: CryptographicMessageSyntax_2009_MessageAuthenticationCode, unauthAttrs: CryptographicMessageSyntax_2009_UnauthAttributes?) {
        self.version = version
        self.originatorInfo = originatorInfo
        self.recipientInfos = recipientInfos
        self.macAlgorithm = macAlgorithm
        self.digestAlgorithm = digestAlgorithm
        self.encapContentInfo = encapContentInfo
        self.authAttrs = authAttrs
        self.mac = mac
        self.unauthAttrs = unauthAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos = try CryptographicMessageSyntax_2009_RecipientInfos(derEncoded: &nodes)
            let macAlgorithm: CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm = try CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo = try CryptographicMessageSyntax_2009_EncapsulatedContentInfo(derEncoded: &nodes)
            let authAttrs: CryptographicMessageSyntax_2009_AuthAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let mac: CryptographicMessageSyntax_2009_MessageAuthenticationCode = try CryptographicMessageSyntax_2009_MessageAuthenticationCode(derEncoded: &nodes)
            let unauthAttrs: CryptographicMessageSyntax_2009_UnauthAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_AuthenticatedData(version: version, originatorInfo: originatorInfo, recipientInfos: recipientInfos, macAlgorithm: macAlgorithm, digestAlgorithm: digestAlgorithm, encapContentInfo: encapContentInfo, authAttrs: authAttrs, mac: mac, unauthAttrs: unauthAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let originatorInfo = self.originatorInfo { try coder.serializeOptionalImplicitlyTagged(originatorInfo, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(recipientInfos)
            try coder.serialize(macAlgorithm)
            if let digestAlgorithm = self.digestAlgorithm { try coder.serializeOptionalImplicitlyTagged(digestAlgorithm, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            try coder.serialize(encapContentInfo)
            if let authAttrs = self.authAttrs { try coder.serializeOptionalImplicitlyTagged(authAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            try coder.serialize(mac)
            if let unauthAttrs = self.unauthAttrs { try coder.serializeOptionalImplicitlyTagged(unauthAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_CMSVersion.swift
public struct CryptographicMessageSyntax_2009_CMSVersion : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: CryptographicMessageSyntax_2009_CMSVersion, rhs: CryptographicMessageSyntax_2009_CMSVersion) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v0 = Self(rawValue: 0)
    public static let v1 = Self(rawValue: 1)
    public static let v2 = Self(rawValue: 2)
    public static let v3 = Self(rawValue: 3)
    public static let v4 = Self(rawValue: 4)
    public static let v5 = Self(rawValue: 5)
}

// MARK: - CryptographicMessageSyntax_2009_CONTENT_TYPE.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_CONTENT_TYPE = ASN1Any

// MARK: - CryptographicMessageSyntax_2009_Certificate.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_Certificate = AuthenticationFramework_Certificate

// MARK: - CryptographicMessageSyntax_2009_CertificateChoices.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_CertificateChoices: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certificate(AuthenticationFramework_Certificate)
    case extendedCertificate(CryptographicMessageSyntax_2009_ExtendedCertificate)
    case v1AttrCert(AttributeCertificateVersion1_2009_AttributeCertificateV1)
    case v2AttrCert(CryptographicMessageSyntax_2009_AttributeCertificateV2)
    case other(CryptographicMessageSyntax_2009_OtherCertificateFormat)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_Certificate.defaultIdentifier:
            self = .certificate(try AuthenticationFramework_Certificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .extendedCertificate(try CryptographicMessageSyntax_2009_ExtendedCertificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .v1AttrCert(try AttributeCertificateVersion1_2009_AttributeCertificateV1(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .v2AttrCert(try CryptographicMessageSyntax_2009_AttributeCertificateV2(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .other(try CryptographicMessageSyntax_2009_OtherCertificateFormat(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certificate(let certificate):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(certificate)
                            }
                        } else {
                            try coder.serialize(certificate)
                        }
        case .extendedCertificate(let extendedCertificate): try extendedCertificate.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .v1AttrCert(let v1AttrCert): try v1AttrCert.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .v2AttrCert(let v2AttrCert): try v2AttrCert.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .other(let other): try other.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_CertificateList.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_CertificateList = AuthenticationFramework_CertificateList

// MARK: - CryptographicMessageSyntax_2009_CertificateSerialNumber.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - CryptographicMessageSyntax_2009_CertificateSet.swift
@usableFromInline struct CryptographicMessageSyntax_2009_CertificateSet: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_CertificateChoices]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_CertificateChoices]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_CertificateChoices.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_ContentEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_ContentEncryptionAlgorithmIdentifier = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_ContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_ContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: ASN1ObjectIdentifier
    @usableFromInline var content: ASN1Any
    @inlinable init(contentType: ASN1ObjectIdentifier, content: ASN1Any) {
        self.contentType = contentType
        self.content = content

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let content: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return CryptographicMessageSyntax_2009_ContentInfo(contentType: contentType, content: content)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(content) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_ContentType.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_ContentType = ASN1ObjectIdentifier

// MARK: - CryptographicMessageSyntax_2009_Countersignature.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_Countersignature = CryptographicMessageSyntax_2009_SignerInfo

// MARK: - CryptographicMessageSyntax_2009_Digest.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_Digest = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_DigestedData.swift
@usableFromInline struct CryptographicMessageSyntax_2009_DigestedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo
    @usableFromInline var digest: CryptographicMessageSyntax_2009_Digest
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier, encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo, digest: CryptographicMessageSyntax_2009_Digest) {
        self.version = version
        self.digestAlgorithm = digestAlgorithm
        self.encapContentInfo = encapContentInfo
        self.digest = digest

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier = try CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo = try CryptographicMessageSyntax_2009_EncapsulatedContentInfo(derEncoded: &nodes)
            let digest: CryptographicMessageSyntax_2009_Digest = try CryptographicMessageSyntax_2009_Digest(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_DigestedData(version: version, digestAlgorithm: digestAlgorithm, encapContentInfo: encapContentInfo, digest: digest)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(digestAlgorithm)
            try coder.serialize(encapContentInfo)
            try coder.serialize(digest)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_EncapsulatedContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_EncapsulatedContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var eContentType: ASN1ObjectIdentifier
    @usableFromInline var eContent: ASN1OctetString?
    @inlinable init(eContentType: ASN1ObjectIdentifier, eContent: ASN1OctetString?) {
        self.eContentType = eContentType
        self.eContent = eContent

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let eContentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let eContent: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }

            return CryptographicMessageSyntax_2009_EncapsulatedContentInfo(eContentType: eContentType, eContent: eContent)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(eContentType)
            if let eContent = self.eContent { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(eContent) } }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_EncryptedContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_EncryptedContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: ASN1ObjectIdentifier
    @usableFromInline var contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedContent: ASN1OctetString?
    @inlinable init(contentType: ASN1ObjectIdentifier, contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedContent: ASN1OctetString?) {
        self.contentType = contentType
        self.contentEncryptionAlgorithm = contentEncryptionAlgorithm
        self.encryptedContent = encryptedContent

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedContent: ASN1OctetString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_EncryptedContentInfo(contentType: contentType, contentEncryptionAlgorithm: contentEncryptionAlgorithm, encryptedContent: encryptedContent)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            try coder.serialize(contentEncryptionAlgorithm)
            if let encryptedContent = self.encryptedContent { try coder.serializeOptionalImplicitlyTagged(encryptedContent, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_EncryptedData.swift
@usableFromInline struct CryptographicMessageSyntax_2009_EncryptedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo
    @usableFromInline var unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo, unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes?) {
        self.version = version
        self.encryptedContentInfo = encryptedContentInfo
        self.unprotectedAttrs = unprotectedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo = try CryptographicMessageSyntax_2009_EncryptedContentInfo(derEncoded: &nodes)
            let unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_EncryptedData(version: version, encryptedContentInfo: encryptedContentInfo, unprotectedAttrs: unprotectedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(encryptedContentInfo)
            if let unprotectedAttrs = self.unprotectedAttrs { try coder.serializeOptionalImplicitlyTagged(unprotectedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_EncryptedKey.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_EncryptedKey = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_EnvelopedData.swift
@usableFromInline struct CryptographicMessageSyntax_2009_EnvelopedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo?
    @usableFromInline var recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos
    @usableFromInline var encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo
    @usableFromInline var unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo?, recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos, encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo, unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes?) {
        self.version = version
        self.originatorInfo = originatorInfo
        self.recipientInfos = recipientInfos
        self.encryptedContentInfo = encryptedContentInfo
        self.unprotectedAttrs = unprotectedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let originatorInfo: CryptographicMessageSyntax_2009_OriginatorInfo? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let recipientInfos: CryptographicMessageSyntax_2009_RecipientInfos = try CryptographicMessageSyntax_2009_RecipientInfos(derEncoded: &nodes)
            let encryptedContentInfo: CryptographicMessageSyntax_2009_EncryptedContentInfo = try CryptographicMessageSyntax_2009_EncryptedContentInfo(derEncoded: &nodes)
            let unprotectedAttrs: CryptographicMessageSyntax_2009_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_EnvelopedData(version: version, originatorInfo: originatorInfo, recipientInfos: recipientInfos, encryptedContentInfo: encryptedContentInfo, unprotectedAttrs: unprotectedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let originatorInfo = self.originatorInfo { try coder.serializeOptionalImplicitlyTagged(originatorInfo, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(recipientInfos)
            try coder.serialize(encryptedContentInfo)
            if let unprotectedAttrs = self.unprotectedAttrs { try coder.serializeOptionalImplicitlyTagged(unprotectedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_ExtendedCertificate.swift
@usableFromInline struct CryptographicMessageSyntax_2009_ExtendedCertificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extendedCertificateInfo: CryptographicMessageSyntax_2009_ExtendedCertificateInfo
    @usableFromInline var signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier
    @usableFromInline var signature: CryptographicMessageSyntax_2009_Signature
    @inlinable init(extendedCertificateInfo: CryptographicMessageSyntax_2009_ExtendedCertificateInfo, signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier, signature: CryptographicMessageSyntax_2009_Signature) {
        self.extendedCertificateInfo = extendedCertificateInfo
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extendedCertificateInfo: CryptographicMessageSyntax_2009_ExtendedCertificateInfo = try CryptographicMessageSyntax_2009_ExtendedCertificateInfo(derEncoded: &nodes)
            let signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier = try CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier(derEncoded: &nodes)
            let signature: CryptographicMessageSyntax_2009_Signature = try CryptographicMessageSyntax_2009_Signature(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_ExtendedCertificate(extendedCertificateInfo: extendedCertificateInfo, signatureAlgorithm: signatureAlgorithm, signature: signature)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(extendedCertificateInfo)
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_ExtendedCertificateInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_ExtendedCertificateInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var certificate: AuthenticationFramework_Certificate
    @usableFromInline var attributes: CryptographicMessageSyntax_2009_UnauthAttributes
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, certificate: AuthenticationFramework_Certificate, attributes: CryptographicMessageSyntax_2009_UnauthAttributes) {
        self.version = version
        self.certificate = certificate
        self.attributes = attributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let certificate: AuthenticationFramework_Certificate = try AuthenticationFramework_Certificate(derEncoded: &nodes)
            let attributes: CryptographicMessageSyntax_2009_UnauthAttributes = try CryptographicMessageSyntax_2009_UnauthAttributes(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_ExtendedCertificateInfo(version: version, certificate: certificate, attributes: attributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(certificate)
            try coder.serialize(attributes)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_ExtendedCertificateOrCertificate.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_ExtendedCertificateOrCertificate: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certificate(AuthenticationFramework_Certificate)
    case extendedCertificate(CryptographicMessageSyntax_2009_ExtendedCertificate)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_Certificate.defaultIdentifier:
            self = .certificate(try AuthenticationFramework_Certificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .extendedCertificate(try CryptographicMessageSyntax_2009_ExtendedCertificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certificate(let certificate):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(certificate)
                            }
                        } else {
                            try coder.serialize(certificate)
                        }
        case .extendedCertificate(let extendedCertificate): try extendedCertificate.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_IssuerAndSerialNumber.swift
@usableFromInline struct CryptographicMessageSyntax_2009_IssuerAndSerialNumber: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @inlinable init(issuer: InformationFramework_Name, serialNumber: ArraySlice<UInt8>) {
        self.issuer = issuer
        self.serialNumber = serialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_IssuerAndSerialNumber(issuer: issuer, serialNumber: serialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuer)
            try coder.serialize(serialNumber)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_KEKIdentifier.swift
@usableFromInline struct CryptographicMessageSyntax_2009_KEKIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyIdentifier: ASN1OctetString
    @usableFromInline var date: GeneralizedTime?
    @usableFromInline var other: CryptographicMessageSyntax_2009_OtherKeyAttribute?
    @inlinable init(keyIdentifier: ASN1OctetString, date: GeneralizedTime?, other: CryptographicMessageSyntax_2009_OtherKeyAttribute?) {
        self.keyIdentifier = keyIdentifier
        self.date = date
        self.other = other

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyIdentifier: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            var date: GeneralizedTime? = nil
var peek_date = nodes
if let next = peek_date.next(), next.identifier == GeneralizedTime.defaultIdentifier {
    date = try GeneralizedTime(derEncoded: &nodes)
}
            var other: CryptographicMessageSyntax_2009_OtherKeyAttribute? = nil
var peek_other = nodes
if let next = peek_other.next(), next.identifier == CryptographicMessageSyntax_2009_OtherKeyAttribute.defaultIdentifier {
    other = try CryptographicMessageSyntax_2009_OtherKeyAttribute(derEncoded: &nodes)
}

            return CryptographicMessageSyntax_2009_KEKIdentifier(keyIdentifier: keyIdentifier, date: date, other: other)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(keyIdentifier)
            if let date = self.date { try coder.serialize(date) }
            if let other = self.other { try coder.serialize(other) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_KEKRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_KEKRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var kekid: CryptographicMessageSyntax_2009_KEKIdentifier
    @usableFromInline var keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, kekid: CryptographicMessageSyntax_2009_KEKIdentifier, keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey) {
        self.version = version
        self.kekid = kekid
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let kekid: CryptographicMessageSyntax_2009_KEKIdentifier = try CryptographicMessageSyntax_2009_KEKIdentifier(derEncoded: &nodes)
            let keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier = try CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey = try CryptographicMessageSyntax_2009_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_KEKRecipientInfo(version: version, kekid: kekid, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(kekid)
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_KEY_ATTRIBUTE.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_KEY_ATTRIBUTE = ASN1Any

// MARK: - CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2009_IssuerAndSerialNumber)
    case rKeyId(CryptographicMessageSyntax_2009_RecipientKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2009_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2009_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .rKeyId(try CryptographicMessageSyntax_2009_RecipientKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .rKeyId(let rKeyId): try rKeyId.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_KeyAgreeRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_KeyAgreeRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var originator: CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey
    @usableFromInline var ukm: CryptographicMessageSyntax_2009_UserKeyingMaterial?
    @usableFromInline var keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var recipientEncryptedKeys: CryptographicMessageSyntax_2009_RecipientEncryptedKeys
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, originator: CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey, ukm: CryptographicMessageSyntax_2009_UserKeyingMaterial?, keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, recipientEncryptedKeys: CryptographicMessageSyntax_2009_RecipientEncryptedKeys) {
        self.version = version
        self.originator = originator
        self.ukm = ukm
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.recipientEncryptedKeys = recipientEncryptedKeys

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let originator: CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey(derEncoded: node) }
            let ukm: CryptographicMessageSyntax_2009_UserKeyingMaterial? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try CryptographicMessageSyntax_2009_UserKeyingMaterial(derEncoded: node) }
            let keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let recipientEncryptedKeys: CryptographicMessageSyntax_2009_RecipientEncryptedKeys = try CryptographicMessageSyntax_2009_RecipientEncryptedKeys(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_KeyAgreeRecipientInfo(version: version, originator: originator, ukm: ukm, keyEncryptionAlgorithm: keyEncryptionAlgorithm, recipientEncryptedKeys: recipientEncryptedKeys)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(originator) }
            if let ukm = self.ukm { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(ukm) } }
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(recipientEncryptedKeys)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_KeyDerivationAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_KeyDerivationAlgorithmIdentifier = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_KeyTransRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_KeyTransRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var rid: CryptographicMessageSyntax_2009_RecipientIdentifier
    @usableFromInline var keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, rid: CryptographicMessageSyntax_2009_RecipientIdentifier, keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey) {
        self.version = version
        self.rid = rid
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let rid: CryptographicMessageSyntax_2009_RecipientIdentifier = try CryptographicMessageSyntax_2009_RecipientIdentifier(derEncoded: &nodes)
            let keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey = try CryptographicMessageSyntax_2009_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_KeyTransRecipientInfo(version: version, rid: rid, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(rid)
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_MessageAuthenticationCode.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_MessageAuthenticationCode = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_MessageAuthenticationCodeAlgorithm = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_MessageDigest.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_MessageDigest = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_Name.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_Name = InformationFramework_Name

// MARK: - CryptographicMessageSyntax_2009_OTHER_CERT_FMT.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_OTHER_CERT_FMT = ASN1Any

// MARK: - CryptographicMessageSyntax_2009_OTHER_RECIPIENT.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_OTHER_RECIPIENT = ASN1Any

// MARK: - CryptographicMessageSyntax_2009_OTHER_REVOK_INFO.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_OTHER_REVOK_INFO = ASN1Any

// MARK: - CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_OriginatorIdentifierOrKey: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2009_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2009_SubjectKeyIdentifier)
    case originatorKey(CryptographicMessageSyntax_2009_OriginatorPublicKey)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2009_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2009_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2009_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .originatorKey(try CryptographicMessageSyntax_2009_OriginatorPublicKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .originatorKey(let originatorKey): try originatorKey.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_OriginatorInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OriginatorInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certs: CryptographicMessageSyntax_2009_CertificateSet?
    @usableFromInline var crls: CryptographicMessageSyntax_2009_RevocationInfoChoices?
    @inlinable init(certs: CryptographicMessageSyntax_2009_CertificateSet?, crls: CryptographicMessageSyntax_2009_RevocationInfoChoices?) {
        self.certs = certs
        self.crls = crls

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certs: CryptographicMessageSyntax_2009_CertificateSet? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let crls: CryptographicMessageSyntax_2009_RevocationInfoChoices? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_OriginatorInfo(certs: certs, crls: crls)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let certs = self.certs { try coder.serializeOptionalImplicitlyTagged(certs, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let crls = self.crls { try coder.serializeOptionalImplicitlyTagged(crls, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_OriginatorPublicKey.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OriginatorPublicKey: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var publicKey: ASN1BitString
    @inlinable init(algorithm: AuthenticationFramework_AlgorithmIdentifier, publicKey: ASN1BitString) {
        self.algorithm = algorithm
        self.publicKey = publicKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let publicKey: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_OriginatorPublicKey(algorithm: algorithm, publicKey: publicKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            try coder.serialize(publicKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_OtherCertificateFormat.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OtherCertificateFormat: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var otherCertFormat: ASN1ObjectIdentifier
    @usableFromInline var otherCert: ASN1Any
    @inlinable init(otherCertFormat: ASN1ObjectIdentifier, otherCert: ASN1Any) {
        self.otherCertFormat = otherCertFormat
        self.otherCert = otherCert

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let otherCertFormat: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let otherCert: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_OtherCertificateFormat(otherCertFormat: otherCertFormat, otherCert: otherCert)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(otherCertFormat)
            try coder.serialize(otherCert)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_OtherKeyAttribute.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OtherKeyAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyAttrId: ASN1ObjectIdentifier
    @usableFromInline var keyAttr: ASN1Any
    @inlinable init(keyAttrId: ASN1ObjectIdentifier, keyAttr: ASN1Any) {
        self.keyAttrId = keyAttrId
        self.keyAttr = keyAttr

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyAttrId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let keyAttr: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_OtherKeyAttribute(keyAttrId: keyAttrId, keyAttr: keyAttr)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(keyAttrId)
            try coder.serialize(keyAttr)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_OtherRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OtherRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var oriType: ASN1ObjectIdentifier
    @usableFromInline var oriValue: ASN1Any
    @inlinable init(oriType: ASN1ObjectIdentifier, oriValue: ASN1Any) {
        self.oriType = oriType
        self.oriValue = oriValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let oriType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let oriValue: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_OtherRecipientInfo(oriType: oriType, oriValue: oriValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(oriType)
            try coder.serialize(oriValue)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_OtherRevocationInfoFormat.swift
@usableFromInline struct CryptographicMessageSyntax_2009_OtherRevocationInfoFormat: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var otherRevInfoFormat: ASN1ObjectIdentifier
    @usableFromInline var otherRevInfo: ASN1Any
    @inlinable init(otherRevInfoFormat: ASN1ObjectIdentifier, otherRevInfo: ASN1Any) {
        self.otherRevInfoFormat = otherRevInfoFormat
        self.otherRevInfo = otherRevInfo

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let otherRevInfoFormat: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let otherRevInfo: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_OtherRevocationInfoFormat(otherRevInfoFormat: otherRevInfoFormat, otherRevInfo: otherRevInfo)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(otherRevInfoFormat)
            try coder.serialize(otherRevInfo)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_PasswordRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_PasswordRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var keyDerivationAlgorithm: CryptographicMessageSyntax_2009_KeyDerivationAlgorithmIdentifier?
    @usableFromInline var keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, keyDerivationAlgorithm: CryptographicMessageSyntax_2009_KeyDerivationAlgorithmIdentifier?, keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey) {
        self.version = version
        self.keyDerivationAlgorithm = keyDerivationAlgorithm
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let keyDerivationAlgorithm: CryptographicMessageSyntax_2009_KeyDerivationAlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let keyEncryptionAlgorithm: CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier = try CryptographicMessageSyntax_2009_KeyEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey = try CryptographicMessageSyntax_2009_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_PasswordRecipientInfo(version: version, keyDerivationAlgorithm: keyDerivationAlgorithm, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let keyDerivationAlgorithm = self.keyDerivationAlgorithm { try coder.serializeOptionalImplicitlyTagged(keyDerivationAlgorithm, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_RecipientEncryptedKey.swift
@usableFromInline struct CryptographicMessageSyntax_2009_RecipientEncryptedKey: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var rid: CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey
    @inlinable init(rid: CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier, encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey) {
        self.rid = rid
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let rid: CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier = try CryptographicMessageSyntax_2009_KeyAgreeRecipientIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2009_EncryptedKey = try CryptographicMessageSyntax_2009_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_RecipientEncryptedKey(rid: rid, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(rid)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_RecipientEncryptedKeys.swift
@usableFromInline struct CryptographicMessageSyntax_2009_RecipientEncryptedKeys: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_RecipientEncryptedKey]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_RecipientEncryptedKey]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: CryptographicMessageSyntax_2009_RecipientEncryptedKey.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_RecipientIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_RecipientIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2009_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2009_SubjectKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2009_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2009_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2009_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_RecipientInfo.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_RecipientInfo: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case ktri(CryptographicMessageSyntax_2009_KeyTransRecipientInfo)
    case kari(CryptographicMessageSyntax_2009_KeyAgreeRecipientInfo)
    case kekri(CryptographicMessageSyntax_2009_KEKRecipientInfo)
    case pwri(CryptographicMessageSyntax_2009_PasswordRecipientInfo)
    case ori(CryptographicMessageSyntax_2009_OtherRecipientInfo)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2009_KeyTransRecipientInfo.defaultIdentifier:
            self = .ktri(try CryptographicMessageSyntax_2009_KeyTransRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .kari(try CryptographicMessageSyntax_2009_KeyAgreeRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .kekri(try CryptographicMessageSyntax_2009_KEKRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .pwri(try CryptographicMessageSyntax_2009_PasswordRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            self = .ori(try CryptographicMessageSyntax_2009_OtherRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .ktri(let ktri):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(ktri)
                            }
                        } else {
                            try coder.serialize(ktri)
                        }
        case .kari(let kari): try kari.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .kekri(let kekri): try kekri.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .pwri(let pwri): try pwri.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
        case .ori(let ori): try ori.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_RecipientInfos.swift
@usableFromInline struct CryptographicMessageSyntax_2009_RecipientInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_RecipientInfo]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_RecipientInfo]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_RecipientInfo.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_RecipientKeyIdentifier.swift
@usableFromInline struct CryptographicMessageSyntax_2009_RecipientKeyIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var subjectKeyIdentifier: CryptographicMessageSyntax_2009_SubjectKeyIdentifier
    @usableFromInline var date: GeneralizedTime?
    @usableFromInline var other: CryptographicMessageSyntax_2009_OtherKeyAttribute?
    @inlinable init(subjectKeyIdentifier: CryptographicMessageSyntax_2009_SubjectKeyIdentifier, date: GeneralizedTime?, other: CryptographicMessageSyntax_2009_OtherKeyAttribute?) {
        self.subjectKeyIdentifier = subjectKeyIdentifier
        self.date = date
        self.other = other

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let subjectKeyIdentifier: CryptographicMessageSyntax_2009_SubjectKeyIdentifier = try CryptographicMessageSyntax_2009_SubjectKeyIdentifier(derEncoded: &nodes)
            var date: GeneralizedTime? = nil
var peek_date = nodes
if let next = peek_date.next(), next.identifier == GeneralizedTime.defaultIdentifier {
    date = try GeneralizedTime(derEncoded: &nodes)
}
            var other: CryptographicMessageSyntax_2009_OtherKeyAttribute? = nil
var peek_other = nodes
if let next = peek_other.next(), next.identifier == CryptographicMessageSyntax_2009_OtherKeyAttribute.defaultIdentifier {
    other = try CryptographicMessageSyntax_2009_OtherKeyAttribute(derEncoded: &nodes)
}

            return CryptographicMessageSyntax_2009_RecipientKeyIdentifier(subjectKeyIdentifier: subjectKeyIdentifier, date: date, other: other)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(subjectKeyIdentifier)
            if let date = self.date { try coder.serialize(date) }
            if let other = self.other { try coder.serialize(other) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_RevocationInfoChoice.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_RevocationInfoChoice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case crl(AuthenticationFramework_CertificateList)
    case other(CryptographicMessageSyntax_2009_OtherRevocationInfoFormat)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_CertificateList.defaultIdentifier:
            self = .crl(try AuthenticationFramework_CertificateList(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .other(try CryptographicMessageSyntax_2009_OtherRevocationInfoFormat(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .crl(let crl):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(crl)
                            }
                        } else {
                            try coder.serialize(crl)
                        }
        case .other(let other): try other.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_RevocationInfoChoices.swift
@usableFromInline struct CryptographicMessageSyntax_2009_RevocationInfoChoices: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_RevocationInfoChoice]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_RevocationInfoChoice]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_RevocationInfoChoice.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_Signature.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_Signature = ASN1BitString

// MARK: - CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier = CryptographicMessageSyntax_2009_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2009_SignatureValue.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_SignatureValue = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_SignedAttributes.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_SignedAttributes = CryptographicMessageSyntax_2009_Attributes

// MARK: - CryptographicMessageSyntax_2009_SignedData.swift
@usableFromInline struct CryptographicMessageSyntax_2009_SignedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var digestAlgorithms: [CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier]
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo
    @usableFromInline var certificates: CryptographicMessageSyntax_2009_CertificateSet?
    @usableFromInline var crls: CryptographicMessageSyntax_2009_RevocationInfoChoices?
    @usableFromInline var signerInfos: CryptographicMessageSyntax_2009_SignerInfos
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, digestAlgorithms: [CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier], encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo, certificates: CryptographicMessageSyntax_2009_CertificateSet?, crls: CryptographicMessageSyntax_2009_RevocationInfoChoices?, signerInfos: CryptographicMessageSyntax_2009_SignerInfos) {
        self.version = version
        self.digestAlgorithms = digestAlgorithms
        self.encapContentInfo = encapContentInfo
        self.certificates = certificates
        self.crls = crls
        self.signerInfos = signerInfos

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let digestAlgorithms: [CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier] = try DER.set(of: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier.self, identifier: .set, nodes: &nodes)
            let encapContentInfo: CryptographicMessageSyntax_2009_EncapsulatedContentInfo = try CryptographicMessageSyntax_2009_EncapsulatedContentInfo(derEncoded: &nodes)
            let certificates: CryptographicMessageSyntax_2009_CertificateSet? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let crls: CryptographicMessageSyntax_2009_RevocationInfoChoices? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let signerInfos: CryptographicMessageSyntax_2009_SignerInfos = try CryptographicMessageSyntax_2009_SignerInfos(derEncoded: &nodes)

            return CryptographicMessageSyntax_2009_SignedData(version: version, digestAlgorithms: digestAlgorithms, encapContentInfo: encapContentInfo, certificates: certificates, crls: crls, signerInfos: signerInfos)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serializeSetOf(digestAlgorithms)
            try coder.serialize(encapContentInfo)
            if let certificates = self.certificates { try coder.serializeOptionalImplicitlyTagged(certificates, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let crls = self.crls { try coder.serializeOptionalImplicitlyTagged(crls, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            try coder.serialize(signerInfos)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_SignerIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_SignerIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2009_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2009_SubjectKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2009_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2009_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2009_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_SignerInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2009_SignerInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2009_CMSVersion
    @usableFromInline var sid: CryptographicMessageSyntax_2009_SignerIdentifier
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier
    @usableFromInline var signedAttrs: CryptographicMessageSyntax_2009_SignedAttributes?
    @usableFromInline var signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier
    @usableFromInline var signature: CryptographicMessageSyntax_2009_SignatureValue
    @usableFromInline var unsignedAttrs: CryptographicMessageSyntax_2009_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2009_CMSVersion, sid: CryptographicMessageSyntax_2009_SignerIdentifier, digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier, signedAttrs: CryptographicMessageSyntax_2009_SignedAttributes?, signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier, signature: CryptographicMessageSyntax_2009_SignatureValue, unsignedAttrs: CryptographicMessageSyntax_2009_Attributes?) {
        self.version = version
        self.sid = sid
        self.digestAlgorithm = digestAlgorithm
        self.signedAttrs = signedAttrs
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature
        self.unsignedAttrs = unsignedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2009_CMSVersion = try CryptographicMessageSyntax_2009_CMSVersion(derEncoded: &nodes)
            let sid: CryptographicMessageSyntax_2009_SignerIdentifier = try CryptographicMessageSyntax_2009_SignerIdentifier(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier = try CryptographicMessageSyntax_2009_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let signedAttrs: CryptographicMessageSyntax_2009_SignedAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let signatureAlgorithm: CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier = try CryptographicMessageSyntax_2009_SignatureAlgorithmIdentifier(derEncoded: &nodes)
            let signature: CryptographicMessageSyntax_2009_SignatureValue = try CryptographicMessageSyntax_2009_SignatureValue(derEncoded: &nodes)
            let unsignedAttrs: CryptographicMessageSyntax_2009_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2009_SignerInfo(version: version, sid: sid, digestAlgorithm: digestAlgorithm, signedAttrs: signedAttrs, signatureAlgorithm: signatureAlgorithm, signature: signature, unsignedAttrs: unsignedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(sid)
            try coder.serialize(digestAlgorithm)
            if let signedAttrs = self.signedAttrs { try coder.serializeOptionalImplicitlyTagged(signedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)
            if let unsignedAttrs = self.unsignedAttrs { try coder.serializeOptionalImplicitlyTagged(unsignedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2009_SignerInfos.swift
@usableFromInline struct CryptographicMessageSyntax_2009_SignerInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_SignerInfo]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_SignerInfo]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_SignerInfo.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_SigningTime.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_SigningTime = CryptographicMessageSyntax_2009_Time

// MARK: - CryptographicMessageSyntax_2009_SubjectKeyIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_SubjectKeyIdentifier = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_Time.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2009_Time: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case utcTime(UTCTime)
    case generalTime(GeneralizedTime)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case UTCTime.defaultIdentifier:
            self = .utcTime(try UTCTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case GeneralizedTime.defaultIdentifier:
            self = .generalTime(try GeneralizedTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .utcTime(let utcTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utcTime)
                            }
                        } else {
                            try coder.serialize(utcTime)
                        }
        case .generalTime(let generalTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(generalTime)
                            }
                        } else {
                            try coder.serialize(generalTime)
                        }

        }
    }

}

// MARK: - CryptographicMessageSyntax_2009_UnauthAttributes.swift
@usableFromInline struct CryptographicMessageSyntax_2009_UnauthAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2009_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2009_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2009_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2009_UserKeyingMaterial.swift
@usableFromInline typealias CryptographicMessageSyntax_2009_UserKeyingMaterial = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2009_id_contentType_oid.swift
public let CryptographicMessageSyntax_2009_id_contentType: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 3]

// MARK: - CryptographicMessageSyntax_2009_id_countersignature_oid.swift
public let CryptographicMessageSyntax_2009_id_countersignature: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 6]

// MARK: - CryptographicMessageSyntax_2009_id_ct_authData_oid.swift
public let CryptographicMessageSyntax_2009_id_ct_authData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 16, 1, 2]

// MARK: - CryptographicMessageSyntax_2009_id_ct_contentInfo_oid.swift
public let CryptographicMessageSyntax_2009_id_ct_contentInfo: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 16, 1, 6]

// MARK: - CryptographicMessageSyntax_2009_id_data_oid.swift
public let CryptographicMessageSyntax_2009_id_data: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 1]

// MARK: - CryptographicMessageSyntax_2009_id_digestedData_oid.swift
public let CryptographicMessageSyntax_2009_id_digestedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 5]

// MARK: - CryptographicMessageSyntax_2009_id_encryptedData_oid.swift
public let CryptographicMessageSyntax_2009_id_encryptedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 6]

// MARK: - CryptographicMessageSyntax_2009_id_envelopedData_oid.swift
public let CryptographicMessageSyntax_2009_id_envelopedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 3]

// MARK: - CryptographicMessageSyntax_2009_id_messageDigest_oid.swift
public let CryptographicMessageSyntax_2009_id_messageDigest: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 4]

// MARK: - CryptographicMessageSyntax_2009_id_signedData_oid.swift
public let CryptographicMessageSyntax_2009_id_signedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 2]

// MARK: - CryptographicMessageSyntax_2009_id_signingTime_oid.swift
public let CryptographicMessageSyntax_2009_id_signingTime: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 5]

// MARK: - CryptographicMessageSyntax_2010_AlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_AlgorithmInformation_2009_AlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_AlgorithmInformation_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_Attribute.swift
@usableFromInline struct CryptographicMessageSyntax_2010_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var values: [ASN1Any]
    @inlinable init(type: ASN1ObjectIdentifier, values: [ASN1Any]) {
        self.type = type
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let values: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return CryptographicMessageSyntax_2010_Attribute(type: type, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serializeSetOf(values)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_AttributeCertificateV2.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_AttributeCertificateV2 = AuthenticationFramework_AttributeCertificate

// MARK: - CryptographicMessageSyntax_2010_Attributes.swift
@usableFromInline struct CryptographicMessageSyntax_2010_Attributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_AuthAttributes.swift
@usableFromInline struct CryptographicMessageSyntax_2010_AuthAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_AuthenticatedData.swift
@usableFromInline struct CryptographicMessageSyntax_2010_AuthenticatedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo?
    @usableFromInline var recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos
    @usableFromInline var macAlgorithm: CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier?
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo
    @usableFromInline var authAttrs: CryptographicMessageSyntax_2010_AuthAttributes?
    @usableFromInline var mac: CryptographicMessageSyntax_2010_MessageAuthenticationCode
    @usableFromInline var unauthAttrs: CryptographicMessageSyntax_2010_UnauthAttributes?
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo?, recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos, macAlgorithm: CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm, digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier?, encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo, authAttrs: CryptographicMessageSyntax_2010_AuthAttributes?, mac: CryptographicMessageSyntax_2010_MessageAuthenticationCode, unauthAttrs: CryptographicMessageSyntax_2010_UnauthAttributes?) {
        self.version = version
        self.originatorInfo = originatorInfo
        self.recipientInfos = recipientInfos
        self.macAlgorithm = macAlgorithm
        self.digestAlgorithm = digestAlgorithm
        self.encapContentInfo = encapContentInfo
        self.authAttrs = authAttrs
        self.mac = mac
        self.unauthAttrs = unauthAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos = try CryptographicMessageSyntax_2010_RecipientInfos(derEncoded: &nodes)
            let macAlgorithm: CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm = try CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo = try CryptographicMessageSyntax_2010_EncapsulatedContentInfo(derEncoded: &nodes)
            let authAttrs: CryptographicMessageSyntax_2010_AuthAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let mac: CryptographicMessageSyntax_2010_MessageAuthenticationCode = try CryptographicMessageSyntax_2010_MessageAuthenticationCode(derEncoded: &nodes)
            let unauthAttrs: CryptographicMessageSyntax_2010_UnauthAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_AuthenticatedData(version: version, originatorInfo: originatorInfo, recipientInfos: recipientInfos, macAlgorithm: macAlgorithm, digestAlgorithm: digestAlgorithm, encapContentInfo: encapContentInfo, authAttrs: authAttrs, mac: mac, unauthAttrs: unauthAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let originatorInfo = self.originatorInfo { try coder.serializeOptionalImplicitlyTagged(originatorInfo, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(recipientInfos)
            try coder.serialize(macAlgorithm)
            if let digestAlgorithm = self.digestAlgorithm { try coder.serializeOptionalImplicitlyTagged(digestAlgorithm, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            try coder.serialize(encapContentInfo)
            if let authAttrs = self.authAttrs { try coder.serializeOptionalImplicitlyTagged(authAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            try coder.serialize(mac)
            if let unauthAttrs = self.unauthAttrs { try coder.serializeOptionalImplicitlyTagged(unauthAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_CMSVersion.swift
public struct CryptographicMessageSyntax_2010_CMSVersion : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: CryptographicMessageSyntax_2010_CMSVersion, rhs: CryptographicMessageSyntax_2010_CMSVersion) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v0 = Self(rawValue: 0)
    public static let v1 = Self(rawValue: 1)
    public static let v2 = Self(rawValue: 2)
    public static let v3 = Self(rawValue: 3)
    public static let v4 = Self(rawValue: 4)
    public static let v5 = Self(rawValue: 5)
}

// MARK: - CryptographicMessageSyntax_2010_CONTENT_TYPE.swift
@usableFromInline struct CryptographicMessageSyntax_2010_CONTENT_TYPE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return CryptographicMessageSyntax_2010_CONTENT_TYPE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_Certificate.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_Certificate = AuthenticationFramework_Certificate

// MARK: - CryptographicMessageSyntax_2010_CertificateChoices.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_CertificateChoices: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certificate(AuthenticationFramework_Certificate)
    case extendedCertificate(CryptographicMessageSyntax_2010_ExtendedCertificate)
    case v1AttrCert(AttributeCertificateVersion1_2009_AttributeCertificateV1)
    case v2AttrCert(CryptographicMessageSyntax_2010_AttributeCertificateV2)
    case other(CryptographicMessageSyntax_2010_OtherCertificateFormat)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_Certificate.defaultIdentifier:
            self = .certificate(try AuthenticationFramework_Certificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .extendedCertificate(try CryptographicMessageSyntax_2010_ExtendedCertificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .v1AttrCert(try AttributeCertificateVersion1_2009_AttributeCertificateV1(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .v2AttrCert(try CryptographicMessageSyntax_2010_AttributeCertificateV2(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .other(try CryptographicMessageSyntax_2010_OtherCertificateFormat(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certificate(let certificate):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(certificate)
                            }
                        } else {
                            try coder.serialize(certificate)
                        }
        case .extendedCertificate(let extendedCertificate): try extendedCertificate.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .v1AttrCert(let v1AttrCert): try v1AttrCert.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .v2AttrCert(let v2AttrCert): try v2AttrCert.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .other(let other): try other.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_CertificateList.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_CertificateList = AuthenticationFramework_CertificateList

// MARK: - CryptographicMessageSyntax_2010_CertificateSerialNumber.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - CryptographicMessageSyntax_2010_CertificateSet.swift
@usableFromInline struct CryptographicMessageSyntax_2010_CertificateSet: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_CertificateChoices]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_CertificateChoices]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_CertificateChoices.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_ContentEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_ContentEncryptionAlgorithmIdentifier = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_ContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_ContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: ASN1ObjectIdentifier
    @usableFromInline var content: ASN1Any
    @inlinable init(contentType: ASN1ObjectIdentifier, content: ASN1Any) {
        self.contentType = contentType
        self.content = content

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let content: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return CryptographicMessageSyntax_2010_ContentInfo(contentType: contentType, content: content)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(content) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_ContentType.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_ContentType = ASN1ObjectIdentifier

// MARK: - CryptographicMessageSyntax_2010_Countersignature.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_Countersignature = CryptographicMessageSyntax_2010_SignerInfo

// MARK: - CryptographicMessageSyntax_2010_Digest.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_Digest = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_DigestedData.swift
@usableFromInline struct CryptographicMessageSyntax_2010_DigestedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo
    @usableFromInline var digest: CryptographicMessageSyntax_2010_Digest
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier, encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo, digest: CryptographicMessageSyntax_2010_Digest) {
        self.version = version
        self.digestAlgorithm = digestAlgorithm
        self.encapContentInfo = encapContentInfo
        self.digest = digest

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier = try CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo = try CryptographicMessageSyntax_2010_EncapsulatedContentInfo(derEncoded: &nodes)
            let digest: CryptographicMessageSyntax_2010_Digest = try CryptographicMessageSyntax_2010_Digest(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_DigestedData(version: version, digestAlgorithm: digestAlgorithm, encapContentInfo: encapContentInfo, digest: digest)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(digestAlgorithm)
            try coder.serialize(encapContentInfo)
            try coder.serialize(digest)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_EncapsulatedContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_EncapsulatedContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var eContentType: ASN1ObjectIdentifier
    @usableFromInline var eContent: ASN1OctetString?
    @inlinable init(eContentType: ASN1ObjectIdentifier, eContent: ASN1OctetString?) {
        self.eContentType = eContentType
        self.eContent = eContent

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let eContentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let eContent: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }

            return CryptographicMessageSyntax_2010_EncapsulatedContentInfo(eContentType: eContentType, eContent: eContent)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(eContentType)
            if let eContent = self.eContent { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(eContent) } }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_EncryptedContentInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_EncryptedContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: ASN1ObjectIdentifier
    @usableFromInline var contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedContent: ASN1OctetString?
    @inlinable init(contentType: ASN1ObjectIdentifier, contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedContent: ASN1OctetString?) {
        self.contentType = contentType
        self.contentEncryptionAlgorithm = contentEncryptionAlgorithm
        self.encryptedContent = encryptedContent

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedContent: ASN1OctetString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_EncryptedContentInfo(contentType: contentType, contentEncryptionAlgorithm: contentEncryptionAlgorithm, encryptedContent: encryptedContent)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            try coder.serialize(contentEncryptionAlgorithm)
            if let encryptedContent = self.encryptedContent { try coder.serializeOptionalImplicitlyTagged(encryptedContent, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_EncryptedData.swift
@usableFromInline struct CryptographicMessageSyntax_2010_EncryptedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo
    @usableFromInline var unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo, unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes?) {
        self.version = version
        self.encryptedContentInfo = encryptedContentInfo
        self.unprotectedAttrs = unprotectedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo = try CryptographicMessageSyntax_2010_EncryptedContentInfo(derEncoded: &nodes)
            let unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_EncryptedData(version: version, encryptedContentInfo: encryptedContentInfo, unprotectedAttrs: unprotectedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(encryptedContentInfo)
            if let unprotectedAttrs = self.unprotectedAttrs { try coder.serializeOptionalImplicitlyTagged(unprotectedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_EncryptedKey.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_EncryptedKey = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_EnvelopedData.swift
@usableFromInline struct CryptographicMessageSyntax_2010_EnvelopedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo?
    @usableFromInline var recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos
    @usableFromInline var encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo
    @usableFromInline var unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo?, recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos, encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo, unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes?) {
        self.version = version
        self.originatorInfo = originatorInfo
        self.recipientInfos = recipientInfos
        self.encryptedContentInfo = encryptedContentInfo
        self.unprotectedAttrs = unprotectedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let originatorInfo: CryptographicMessageSyntax_2010_OriginatorInfo? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let recipientInfos: CryptographicMessageSyntax_2010_RecipientInfos = try CryptographicMessageSyntax_2010_RecipientInfos(derEncoded: &nodes)
            let encryptedContentInfo: CryptographicMessageSyntax_2010_EncryptedContentInfo = try CryptographicMessageSyntax_2010_EncryptedContentInfo(derEncoded: &nodes)
            let unprotectedAttrs: CryptographicMessageSyntax_2010_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_EnvelopedData(version: version, originatorInfo: originatorInfo, recipientInfos: recipientInfos, encryptedContentInfo: encryptedContentInfo, unprotectedAttrs: unprotectedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let originatorInfo = self.originatorInfo { try coder.serializeOptionalImplicitlyTagged(originatorInfo, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(recipientInfos)
            try coder.serialize(encryptedContentInfo)
            if let unprotectedAttrs = self.unprotectedAttrs { try coder.serializeOptionalImplicitlyTagged(unprotectedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_ExtendedCertificate.swift
@usableFromInline struct CryptographicMessageSyntax_2010_ExtendedCertificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extendedCertificateInfo: CryptographicMessageSyntax_2010_ExtendedCertificateInfo
    @usableFromInline var signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier
    @usableFromInline var signature: CryptographicMessageSyntax_2010_Signature
    @inlinable init(extendedCertificateInfo: CryptographicMessageSyntax_2010_ExtendedCertificateInfo, signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier, signature: CryptographicMessageSyntax_2010_Signature) {
        self.extendedCertificateInfo = extendedCertificateInfo
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extendedCertificateInfo: CryptographicMessageSyntax_2010_ExtendedCertificateInfo = try CryptographicMessageSyntax_2010_ExtendedCertificateInfo(derEncoded: &nodes)
            let signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier = try CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier(derEncoded: &nodes)
            let signature: CryptographicMessageSyntax_2010_Signature = try CryptographicMessageSyntax_2010_Signature(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_ExtendedCertificate(extendedCertificateInfo: extendedCertificateInfo, signatureAlgorithm: signatureAlgorithm, signature: signature)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(extendedCertificateInfo)
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_ExtendedCertificateInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_ExtendedCertificateInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var certificate: AuthenticationFramework_Certificate
    @usableFromInline var attributes: CryptographicMessageSyntax_2010_UnauthAttributes
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, certificate: AuthenticationFramework_Certificate, attributes: CryptographicMessageSyntax_2010_UnauthAttributes) {
        self.version = version
        self.certificate = certificate
        self.attributes = attributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let certificate: AuthenticationFramework_Certificate = try AuthenticationFramework_Certificate(derEncoded: &nodes)
            let attributes: CryptographicMessageSyntax_2010_UnauthAttributes = try CryptographicMessageSyntax_2010_UnauthAttributes(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_ExtendedCertificateInfo(version: version, certificate: certificate, attributes: attributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(certificate)
            try coder.serialize(attributes)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_ExtendedCertificateOrCertificate.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_ExtendedCertificateOrCertificate: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certificate(AuthenticationFramework_Certificate)
    case extendedCertificate(CryptographicMessageSyntax_2010_ExtendedCertificate)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_Certificate.defaultIdentifier:
            self = .certificate(try AuthenticationFramework_Certificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .extendedCertificate(try CryptographicMessageSyntax_2010_ExtendedCertificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certificate(let certificate):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(certificate)
                            }
                        } else {
                            try coder.serialize(certificate)
                        }
        case .extendedCertificate(let extendedCertificate): try extendedCertificate.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_IssuerAndSerialNumber.swift
@usableFromInline struct CryptographicMessageSyntax_2010_IssuerAndSerialNumber: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @inlinable init(issuer: InformationFramework_Name, serialNumber: ArraySlice<UInt8>) {
        self.issuer = issuer
        self.serialNumber = serialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_IssuerAndSerialNumber(issuer: issuer, serialNumber: serialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuer)
            try coder.serialize(serialNumber)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_KEKIdentifier.swift
@usableFromInline struct CryptographicMessageSyntax_2010_KEKIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyIdentifier: ASN1OctetString
    @usableFromInline var date: GeneralizedTime?
    @usableFromInline var other: CryptographicMessageSyntax_2010_OtherKeyAttribute?
    @inlinable init(keyIdentifier: ASN1OctetString, date: GeneralizedTime?, other: CryptographicMessageSyntax_2010_OtherKeyAttribute?) {
        self.keyIdentifier = keyIdentifier
        self.date = date
        self.other = other

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyIdentifier: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            var date: GeneralizedTime? = nil
var peek_date = nodes
if let next = peek_date.next(), next.identifier == GeneralizedTime.defaultIdentifier {
    date = try GeneralizedTime(derEncoded: &nodes)
}
            var other: CryptographicMessageSyntax_2010_OtherKeyAttribute? = nil
var peek_other = nodes
if let next = peek_other.next(), next.identifier == CryptographicMessageSyntax_2010_OtherKeyAttribute.defaultIdentifier {
    other = try CryptographicMessageSyntax_2010_OtherKeyAttribute(derEncoded: &nodes)
}

            return CryptographicMessageSyntax_2010_KEKIdentifier(keyIdentifier: keyIdentifier, date: date, other: other)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(keyIdentifier)
            if let date = self.date { try coder.serialize(date) }
            if let other = self.other { try coder.serialize(other) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_KEKRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_KEKRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var kekid: CryptographicMessageSyntax_2010_KEKIdentifier
    @usableFromInline var keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, kekid: CryptographicMessageSyntax_2010_KEKIdentifier, keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey) {
        self.version = version
        self.kekid = kekid
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let kekid: CryptographicMessageSyntax_2010_KEKIdentifier = try CryptographicMessageSyntax_2010_KEKIdentifier(derEncoded: &nodes)
            let keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier = try CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey = try CryptographicMessageSyntax_2010_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_KEKRecipientInfo(version: version, kekid: kekid, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(kekid)
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_KEY_ATTRIBUTE.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_KEY_ATTRIBUTE = ASN1Any

// MARK: - CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2010_IssuerAndSerialNumber)
    case rKeyId(CryptographicMessageSyntax_2010_RecipientKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2010_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2010_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .rKeyId(try CryptographicMessageSyntax_2010_RecipientKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .rKeyId(let rKeyId): try rKeyId.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_KeyAgreeRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_KeyAgreeRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var originator: CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey
    @usableFromInline var ukm: CryptographicMessageSyntax_2010_UserKeyingMaterial?
    @usableFromInline var keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var recipientEncryptedKeys: CryptographicMessageSyntax_2010_RecipientEncryptedKeys
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, originator: CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey, ukm: CryptographicMessageSyntax_2010_UserKeyingMaterial?, keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, recipientEncryptedKeys: CryptographicMessageSyntax_2010_RecipientEncryptedKeys) {
        self.version = version
        self.originator = originator
        self.ukm = ukm
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.recipientEncryptedKeys = recipientEncryptedKeys

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let originator: CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey(derEncoded: node) }
            let ukm: CryptographicMessageSyntax_2010_UserKeyingMaterial? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try CryptographicMessageSyntax_2010_UserKeyingMaterial(derEncoded: node) }
            let keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let recipientEncryptedKeys: CryptographicMessageSyntax_2010_RecipientEncryptedKeys = try CryptographicMessageSyntax_2010_RecipientEncryptedKeys(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_KeyAgreeRecipientInfo(version: version, originator: originator, ukm: ukm, keyEncryptionAlgorithm: keyEncryptionAlgorithm, recipientEncryptedKeys: recipientEncryptedKeys)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(originator) }
            if let ukm = self.ukm { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(ukm) } }
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(recipientEncryptedKeys)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_KeyDerivationAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_KeyDerivationAlgorithmIdentifier = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_KeyTransRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_KeyTransRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var rid: CryptographicMessageSyntax_2010_RecipientIdentifier
    @usableFromInline var keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, rid: CryptographicMessageSyntax_2010_RecipientIdentifier, keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey) {
        self.version = version
        self.rid = rid
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let rid: CryptographicMessageSyntax_2010_RecipientIdentifier = try CryptographicMessageSyntax_2010_RecipientIdentifier(derEncoded: &nodes)
            let keyEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey = try CryptographicMessageSyntax_2010_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_KeyTransRecipientInfo(version: version, rid: rid, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(rid)
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_MessageAuthenticationCode.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_MessageAuthenticationCode = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_MessageAuthenticationCodeAlgorithm = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_MessageDigest.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_MessageDigest = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_Name.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_Name = InformationFramework_Name

// MARK: - CryptographicMessageSyntax_2010_OTHER_CERT_FMT.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_OTHER_CERT_FMT = ASN1Any

// MARK: - CryptographicMessageSyntax_2010_OTHER_RECIPIENT.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_OTHER_RECIPIENT = ASN1Any

// MARK: - CryptographicMessageSyntax_2010_OTHER_REVOK_INFO.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_OTHER_REVOK_INFO = ASN1Any

// MARK: - CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_OriginatorIdentifierOrKey: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2010_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2010_SubjectKeyIdentifier)
    case originatorKey(CryptographicMessageSyntax_2010_OriginatorPublicKey)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2010_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2010_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2010_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .originatorKey(try CryptographicMessageSyntax_2010_OriginatorPublicKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .originatorKey(let originatorKey): try originatorKey.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_OriginatorInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OriginatorInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certs: CryptographicMessageSyntax_2010_CertificateSet?
    @usableFromInline var crls: CryptographicMessageSyntax_2010_RevocationInfoChoices?
    @inlinable init(certs: CryptographicMessageSyntax_2010_CertificateSet?, crls: CryptographicMessageSyntax_2010_RevocationInfoChoices?) {
        self.certs = certs
        self.crls = crls

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certs: CryptographicMessageSyntax_2010_CertificateSet? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let crls: CryptographicMessageSyntax_2010_RevocationInfoChoices? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_OriginatorInfo(certs: certs, crls: crls)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let certs = self.certs { try coder.serializeOptionalImplicitlyTagged(certs, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let crls = self.crls { try coder.serializeOptionalImplicitlyTagged(crls, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_OriginatorPublicKey.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OriginatorPublicKey: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var publicKey: ASN1BitString
    @inlinable init(algorithm: AuthenticationFramework_AlgorithmIdentifier, publicKey: ASN1BitString) {
        self.algorithm = algorithm
        self.publicKey = publicKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let publicKey: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_OriginatorPublicKey(algorithm: algorithm, publicKey: publicKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            try coder.serialize(publicKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_OtherCertificateFormat.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OtherCertificateFormat: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var otherCertFormat: ASN1ObjectIdentifier
    @usableFromInline var otherCert: ASN1Any
    @inlinable init(otherCertFormat: ASN1ObjectIdentifier, otherCert: ASN1Any) {
        self.otherCertFormat = otherCertFormat
        self.otherCert = otherCert

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let otherCertFormat: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let otherCert: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_OtherCertificateFormat(otherCertFormat: otherCertFormat, otherCert: otherCert)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(otherCertFormat)
            try coder.serialize(otherCert)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_OtherKeyAttribute.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OtherKeyAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyAttrId: ASN1ObjectIdentifier
    @usableFromInline var keyAttr: ASN1Any
    @inlinable init(keyAttrId: ASN1ObjectIdentifier, keyAttr: ASN1Any) {
        self.keyAttrId = keyAttrId
        self.keyAttr = keyAttr

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyAttrId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let keyAttr: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_OtherKeyAttribute(keyAttrId: keyAttrId, keyAttr: keyAttr)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(keyAttrId)
            try coder.serialize(keyAttr)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_OtherRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OtherRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var oriType: ASN1ObjectIdentifier
    @usableFromInline var oriValue: ASN1Any
    @inlinable init(oriType: ASN1ObjectIdentifier, oriValue: ASN1Any) {
        self.oriType = oriType
        self.oriValue = oriValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let oriType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let oriValue: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_OtherRecipientInfo(oriType: oriType, oriValue: oriValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(oriType)
            try coder.serialize(oriValue)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_OtherRevocationInfoFormat.swift
@usableFromInline struct CryptographicMessageSyntax_2010_OtherRevocationInfoFormat: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var otherRevInfoFormat: ASN1ObjectIdentifier
    @usableFromInline var otherRevInfo: ASN1Any
    @inlinable init(otherRevInfoFormat: ASN1ObjectIdentifier, otherRevInfo: ASN1Any) {
        self.otherRevInfoFormat = otherRevInfoFormat
        self.otherRevInfo = otherRevInfo

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let otherRevInfoFormat: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let otherRevInfo: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_OtherRevocationInfoFormat(otherRevInfoFormat: otherRevInfoFormat, otherRevInfo: otherRevInfo)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(otherRevInfoFormat)
            try coder.serialize(otherRevInfo)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_PasswordRecipientInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_PasswordRecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var keyDerivationAlgorithm: CryptographicMessageSyntax_2010_KeyDerivationAlgorithmIdentifier?
    @usableFromInline var keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, keyDerivationAlgorithm: CryptographicMessageSyntax_2010_KeyDerivationAlgorithmIdentifier?, keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier, encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey) {
        self.version = version
        self.keyDerivationAlgorithm = keyDerivationAlgorithm
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let keyDerivationAlgorithm: CryptographicMessageSyntax_2010_KeyDerivationAlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let keyEncryptionAlgorithm: CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier = try CryptographicMessageSyntax_2010_KeyEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey = try CryptographicMessageSyntax_2010_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_PasswordRecipientInfo(version: version, keyDerivationAlgorithm: keyDerivationAlgorithm, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            if let keyDerivationAlgorithm = self.keyDerivationAlgorithm { try coder.serializeOptionalImplicitlyTagged(keyDerivationAlgorithm, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_RecipientEncryptedKey.swift
@usableFromInline struct CryptographicMessageSyntax_2010_RecipientEncryptedKey: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var rid: CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier
    @usableFromInline var encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey
    @inlinable init(rid: CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier, encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey) {
        self.rid = rid
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let rid: CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier = try CryptographicMessageSyntax_2010_KeyAgreeRecipientIdentifier(derEncoded: &nodes)
            let encryptedKey: CryptographicMessageSyntax_2010_EncryptedKey = try CryptographicMessageSyntax_2010_EncryptedKey(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_RecipientEncryptedKey(rid: rid, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(rid)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_RecipientEncryptedKeys.swift
@usableFromInline struct CryptographicMessageSyntax_2010_RecipientEncryptedKeys: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_RecipientEncryptedKey]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_RecipientEncryptedKey]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: CryptographicMessageSyntax_2010_RecipientEncryptedKey.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_RecipientIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_RecipientIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2010_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2010_SubjectKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2010_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2010_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2010_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_RecipientInfo.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_RecipientInfo: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case ktri(CryptographicMessageSyntax_2010_KeyTransRecipientInfo)
    case kari(CryptographicMessageSyntax_2010_KeyAgreeRecipientInfo)
    case kekri(CryptographicMessageSyntax_2010_KEKRecipientInfo)
    case pwri(CryptographicMessageSyntax_2010_PasswordRecipientInfo)
    case ori(CryptographicMessageSyntax_2010_OtherRecipientInfo)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2010_KeyTransRecipientInfo.defaultIdentifier:
            self = .ktri(try CryptographicMessageSyntax_2010_KeyTransRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .kari(try CryptographicMessageSyntax_2010_KeyAgreeRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .kekri(try CryptographicMessageSyntax_2010_KEKRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .pwri(try CryptographicMessageSyntax_2010_PasswordRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            self = .ori(try CryptographicMessageSyntax_2010_OtherRecipientInfo(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .ktri(let ktri):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(ktri)
                            }
                        } else {
                            try coder.serialize(ktri)
                        }
        case .kari(let kari): try kari.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .kekri(let kekri): try kekri.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .pwri(let pwri): try pwri.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
        case .ori(let ori): try ori.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_RecipientInfos.swift
@usableFromInline struct CryptographicMessageSyntax_2010_RecipientInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_RecipientInfo]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_RecipientInfo]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_RecipientInfo.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_RecipientKeyIdentifier.swift
@usableFromInline struct CryptographicMessageSyntax_2010_RecipientKeyIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var subjectKeyIdentifier: CryptographicMessageSyntax_2010_SubjectKeyIdentifier
    @usableFromInline var date: GeneralizedTime?
    @usableFromInline var other: CryptographicMessageSyntax_2010_OtherKeyAttribute?
    @inlinable init(subjectKeyIdentifier: CryptographicMessageSyntax_2010_SubjectKeyIdentifier, date: GeneralizedTime?, other: CryptographicMessageSyntax_2010_OtherKeyAttribute?) {
        self.subjectKeyIdentifier = subjectKeyIdentifier
        self.date = date
        self.other = other

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let subjectKeyIdentifier: CryptographicMessageSyntax_2010_SubjectKeyIdentifier = try CryptographicMessageSyntax_2010_SubjectKeyIdentifier(derEncoded: &nodes)
            var date: GeneralizedTime? = nil
var peek_date = nodes
if let next = peek_date.next(), next.identifier == GeneralizedTime.defaultIdentifier {
    date = try GeneralizedTime(derEncoded: &nodes)
}
            var other: CryptographicMessageSyntax_2010_OtherKeyAttribute? = nil
var peek_other = nodes
if let next = peek_other.next(), next.identifier == CryptographicMessageSyntax_2010_OtherKeyAttribute.defaultIdentifier {
    other = try CryptographicMessageSyntax_2010_OtherKeyAttribute(derEncoded: &nodes)
}

            return CryptographicMessageSyntax_2010_RecipientKeyIdentifier(subjectKeyIdentifier: subjectKeyIdentifier, date: date, other: other)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(subjectKeyIdentifier)
            if let date = self.date { try coder.serialize(date) }
            if let other = self.other { try coder.serialize(other) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_RevocationInfoChoice.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_RevocationInfoChoice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case crl(AuthenticationFramework_CertificateList)
    case other(CryptographicMessageSyntax_2010_OtherRevocationInfoFormat)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_CertificateList.defaultIdentifier:
            self = .crl(try AuthenticationFramework_CertificateList(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .other(try CryptographicMessageSyntax_2010_OtherRevocationInfoFormat(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .crl(let crl):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(crl)
                            }
                        } else {
                            try coder.serialize(crl)
                        }
        case .other(let other): try other.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_RevocationInfoChoices.swift
@usableFromInline struct CryptographicMessageSyntax_2010_RevocationInfoChoices: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_RevocationInfoChoice]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_RevocationInfoChoice]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_RevocationInfoChoice.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_Signature.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_Signature = ASN1BitString

// MARK: - CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier = CryptographicMessageSyntax_2010_AlgorithmIdentifier

// MARK: - CryptographicMessageSyntax_2010_SignatureValue.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_SignatureValue = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_SignedAttributes.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_SignedAttributes = CryptographicMessageSyntax_2010_Attributes

// MARK: - CryptographicMessageSyntax_2010_SignedData.swift
@usableFromInline struct CryptographicMessageSyntax_2010_SignedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var digestAlgorithms: [CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier]
    @usableFromInline var encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo
    @usableFromInline var certificates: CryptographicMessageSyntax_2010_CertificateSet?
    @usableFromInline var crls: CryptographicMessageSyntax_2010_RevocationInfoChoices?
    @usableFromInline var signerInfos: CryptographicMessageSyntax_2010_SignerInfos
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, digestAlgorithms: [CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier], encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo, certificates: CryptographicMessageSyntax_2010_CertificateSet?, crls: CryptographicMessageSyntax_2010_RevocationInfoChoices?, signerInfos: CryptographicMessageSyntax_2010_SignerInfos) {
        self.version = version
        self.digestAlgorithms = digestAlgorithms
        self.encapContentInfo = encapContentInfo
        self.certificates = certificates
        self.crls = crls
        self.signerInfos = signerInfos

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let digestAlgorithms: [CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier] = try DER.set(of: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier.self, identifier: .set, nodes: &nodes)
            let encapContentInfo: CryptographicMessageSyntax_2010_EncapsulatedContentInfo = try CryptographicMessageSyntax_2010_EncapsulatedContentInfo(derEncoded: &nodes)
            let certificates: CryptographicMessageSyntax_2010_CertificateSet? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let crls: CryptographicMessageSyntax_2010_RevocationInfoChoices? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let signerInfos: CryptographicMessageSyntax_2010_SignerInfos = try CryptographicMessageSyntax_2010_SignerInfos(derEncoded: &nodes)

            return CryptographicMessageSyntax_2010_SignedData(version: version, digestAlgorithms: digestAlgorithms, encapContentInfo: encapContentInfo, certificates: certificates, crls: crls, signerInfos: signerInfos)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serializeSetOf(digestAlgorithms)
            try coder.serialize(encapContentInfo)
            if let certificates = self.certificates { try coder.serializeOptionalImplicitlyTagged(certificates, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let crls = self.crls { try coder.serializeOptionalImplicitlyTagged(crls, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            try coder.serialize(signerInfos)

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_SignerIdentifier.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_SignerIdentifier: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case issuerAndSerialNumber(CryptographicMessageSyntax_2010_IssuerAndSerialNumber)
    case subjectKeyIdentifier(CryptographicMessageSyntax_2010_SubjectKeyIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case CryptographicMessageSyntax_2010_IssuerAndSerialNumber.defaultIdentifier:
            self = .issuerAndSerialNumber(try CryptographicMessageSyntax_2010_IssuerAndSerialNumber(derEncoded: rootNode, withIdentifier: rootNode.identifier))

        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .subjectKeyIdentifier(try CryptographicMessageSyntax_2010_SubjectKeyIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .issuerAndSerialNumber(let issuerAndSerialNumber):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(issuerAndSerialNumber)
                            }
                        } else {
                            try coder.serialize(issuerAndSerialNumber)
                        }
        case .subjectKeyIdentifier(let subjectKeyIdentifier): try subjectKeyIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_SignerInfo.swift
@usableFromInline struct CryptographicMessageSyntax_2010_SignerInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: CryptographicMessageSyntax_2010_CMSVersion
    @usableFromInline var sid: CryptographicMessageSyntax_2010_SignerIdentifier
    @usableFromInline var digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier
    @usableFromInline var signedAttrs: CryptographicMessageSyntax_2010_SignedAttributes?
    @usableFromInline var signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier
    @usableFromInline var signature: CryptographicMessageSyntax_2010_SignatureValue
    @usableFromInline var unsignedAttrs: CryptographicMessageSyntax_2010_Attributes?
    @inlinable init(version: CryptographicMessageSyntax_2010_CMSVersion, sid: CryptographicMessageSyntax_2010_SignerIdentifier, digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier, signedAttrs: CryptographicMessageSyntax_2010_SignedAttributes?, signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier, signature: CryptographicMessageSyntax_2010_SignatureValue, unsignedAttrs: CryptographicMessageSyntax_2010_Attributes?) {
        self.version = version
        self.sid = sid
        self.digestAlgorithm = digestAlgorithm
        self.signedAttrs = signedAttrs
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature
        self.unsignedAttrs = unsignedAttrs

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: CryptographicMessageSyntax_2010_CMSVersion = try CryptographicMessageSyntax_2010_CMSVersion(derEncoded: &nodes)
            let sid: CryptographicMessageSyntax_2010_SignerIdentifier = try CryptographicMessageSyntax_2010_SignerIdentifier(derEncoded: &nodes)
            let digestAlgorithm: CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier = try CryptographicMessageSyntax_2010_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let signedAttrs: CryptographicMessageSyntax_2010_SignedAttributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let signatureAlgorithm: CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier = try CryptographicMessageSyntax_2010_SignatureAlgorithmIdentifier(derEncoded: &nodes)
            let signature: CryptographicMessageSyntax_2010_SignatureValue = try CryptographicMessageSyntax_2010_SignatureValue(derEncoded: &nodes)
            let unsignedAttrs: CryptographicMessageSyntax_2010_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return CryptographicMessageSyntax_2010_SignerInfo(version: version, sid: sid, digestAlgorithm: digestAlgorithm, signedAttrs: signedAttrs, signatureAlgorithm: signatureAlgorithm, signature: signature, unsignedAttrs: unsignedAttrs)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(sid)
            try coder.serialize(digestAlgorithm)
            if let signedAttrs = self.signedAttrs { try coder.serializeOptionalImplicitlyTagged(signedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)
            if let unsignedAttrs = self.unsignedAttrs { try coder.serializeOptionalImplicitlyTagged(unsignedAttrs, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - CryptographicMessageSyntax_2010_SignerInfos.swift
@usableFromInline struct CryptographicMessageSyntax_2010_SignerInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_SignerInfo]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_SignerInfo]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_SignerInfo.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_SigningTime.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_SigningTime = CryptographicMessageSyntax_2010_Time

// MARK: - CryptographicMessageSyntax_2010_SubjectKeyIdentifier.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_SubjectKeyIdentifier = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_Time.swift
@usableFromInline indirect enum CryptographicMessageSyntax_2010_Time: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case utcTime(UTCTime)
    case generalTime(GeneralizedTime)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case UTCTime.defaultIdentifier:
            self = .utcTime(try UTCTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case GeneralizedTime.defaultIdentifier:
            self = .generalTime(try GeneralizedTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .utcTime(let utcTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utcTime)
                            }
                        } else {
                            try coder.serialize(utcTime)
                        }
        case .generalTime(let generalTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(generalTime)
                            }
                        } else {
                            try coder.serialize(generalTime)
                        }

        }
    }

}

// MARK: - CryptographicMessageSyntax_2010_UnauthAttributes.swift
@usableFromInline struct CryptographicMessageSyntax_2010_UnauthAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_Attribute]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - CryptographicMessageSyntax_2010_UserKeyingMaterial.swift
@usableFromInline typealias CryptographicMessageSyntax_2010_UserKeyingMaterial = ASN1OctetString

// MARK: - CryptographicMessageSyntax_2010_id_contentType_oid.swift
public let CryptographicMessageSyntax_2010_id_contentType: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 3]

// MARK: - CryptographicMessageSyntax_2010_id_countersignature_oid.swift
public let CryptographicMessageSyntax_2010_id_countersignature: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 6]

// MARK: - CryptographicMessageSyntax_2010_id_ct_authData_oid.swift
public let CryptographicMessageSyntax_2010_id_ct_authData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 16, 1, 2]

// MARK: - CryptographicMessageSyntax_2010_id_ct_contentInfo_oid.swift
public let CryptographicMessageSyntax_2010_id_ct_contentInfo: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 16, 1, 6]

// MARK: - CryptographicMessageSyntax_2010_id_data_oid.swift
public let CryptographicMessageSyntax_2010_id_data: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 1]

// MARK: - CryptographicMessageSyntax_2010_id_digestedData_oid.swift
public let CryptographicMessageSyntax_2010_id_digestedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 5]

// MARK: - CryptographicMessageSyntax_2010_id_encryptedData_oid.swift
public let CryptographicMessageSyntax_2010_id_encryptedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 6]

// MARK: - CryptographicMessageSyntax_2010_id_envelopedData_oid.swift
public let CryptographicMessageSyntax_2010_id_envelopedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 3]

// MARK: - CryptographicMessageSyntax_2010_id_messageDigest_oid.swift
public let CryptographicMessageSyntax_2010_id_messageDigest: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 4]

// MARK: - CryptographicMessageSyntax_2010_id_signedData_oid.swift
public let CryptographicMessageSyntax_2010_id_signedData: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7, 2]

// MARK: - CryptographicMessageSyntax_2010_id_signingTime_oid.swift
public let CryptographicMessageSyntax_2010_id_signingTime: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 5]

// MARK: - InformationFramework_AllowedSubset.swift
@usableFromInline typealias InformationFramework_AllowedSubset = ASN1BitString

// MARK: - InformationFramework_Attribute.swift
@usableFromInline struct InformationFramework_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_Attribute(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_AttributeCombination.swift
@usableFromInline indirect enum InformationFramework_AttributeCombination: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case attribute(InformationFramework_AttributeType)
    case and([InformationFramework_AttributeCombination])
    case or([InformationFramework_AttributeCombination])
    case not(InformationFramework_AttributeCombination)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .attribute(try InformationFramework_AttributeType(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .and(try DER.sequence(of: InformationFramework_AttributeCombination.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .or(try DER.sequence(of: InformationFramework_AttributeCombination.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .not(try InformationFramework_AttributeCombination(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .attribute(let attribute): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try attribute.serialize(into: &coder) }
        case .and(let and): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try coder.serializeSequenceOf(and) }
        case .or(let or): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try coder.serializeSequenceOf(or) }
        case .not(let not): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try not.serialize(into: &coder) }

        }
    }

}

// MARK: - InformationFramework_AttributeType.swift
@usableFromInline typealias InformationFramework_AttributeType = ASN1ObjectIdentifier

// MARK: - InformationFramework_AttributeTypeAndDistinguishedValue.swift
@usableFromInline struct InformationFramework_AttributeTypeAndDistinguishedValue: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var value: ASN1Any
    @usableFromInline var primaryDistinguished: Bool?
    @usableFromInline var valuesWithContext: [InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence]?
    @inlinable init(type: ASN1ObjectIdentifier, value: ASN1Any, primaryDistinguished: Bool?, valuesWithContext: [InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence]?) {
        self.type = type
        self.value = value
        self.primaryDistinguished = primaryDistinguished
        self.valuesWithContext = valuesWithContext

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let value: ASN1Any = try ASN1Any(derEncoded: &nodes)
            let primaryDistinguished: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            let valuesWithContext: [InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence]? = try DER.set(of: InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence.self, identifier: .set, nodes: &nodes)

            return InformationFramework_AttributeTypeAndDistinguishedValue(type: type, value: value, primaryDistinguished: primaryDistinguished, valuesWithContext: valuesWithContext)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)
            if let primaryDistinguished = self.primaryDistinguished { try coder.serialize(primaryDistinguished) }
            if let valuesWithContext = self.valuesWithContext { try coder.serializeSetOf(valuesWithContext) }

        }
    }
}

// MARK: - InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence.swift
@usableFromInline struct InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var distingAttrValue: ASN1Any?
    @usableFromInline var contextList: [InformationFramework_Context]
    @inlinable init(distingAttrValue: ASN1Any?, contextList: [InformationFramework_Context]) {
        self.distingAttrValue = distingAttrValue
        self.contextList = contextList

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let distingAttrValue: ASN1Any? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }
            let contextList: [InformationFramework_Context] = try DER.set(of: InformationFramework_Context.self, identifier: .set, nodes: &nodes)

            return InformationFramework_AttributeTypeAndDistinguishedValue_valuesWithContext_Sequence(distingAttrValue: distingAttrValue, contextList: contextList)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let distingAttrValue = self.distingAttrValue { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(distingAttrValue) } }
            try coder.serializeSetOf(contextList)

        }
    }
}

// MARK: - InformationFramework_AttributeTypeAndValue.swift
@usableFromInline struct InformationFramework_AttributeTypeAndValue: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: InformationFramework_AttributeTypeX
    @usableFromInline var value: InformationFramework_AttributeValueX
    @inlinable init(type: InformationFramework_AttributeTypeX, value: InformationFramework_AttributeValueX) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: InformationFramework_AttributeTypeX = try InformationFramework_AttributeTypeX(derEncoded: &nodes)
            let value: InformationFramework_AttributeValueX = try InformationFramework_AttributeValueX(derEncoded: &nodes)

            return InformationFramework_AttributeTypeAndValue(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)

        }
    }
}

// MARK: - InformationFramework_AttributeTypeAssertion.swift
@usableFromInline struct InformationFramework_AttributeTypeAssertion: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var assertedContexts: [InformationFramework_ContextAssertion]?
    @inlinable init(type: ASN1ObjectIdentifier, assertedContexts: [InformationFramework_ContextAssertion]?) {
        self.type = type
        self.assertedContexts = assertedContexts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let assertedContexts: [InformationFramework_ContextAssertion]? = try DER.sequence(of: InformationFramework_ContextAssertion.self, identifier: .sequence, nodes: &nodes)

            return InformationFramework_AttributeTypeAssertion(type: type, assertedContexts: assertedContexts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            if let assertedContexts = self.assertedContexts { try coder.serializeSequenceOf(assertedContexts) }

        }
    }
}

// MARK: - InformationFramework_AttributeTypeX.swift
@usableFromInline typealias InformationFramework_AttributeTypeX = ASN1ObjectIdentifier

// MARK: - InformationFramework_AttributeUsage.swift
public struct InformationFramework_AttributeUsage: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let userApplications = Self(rawValue: 0)
    static let directoryOperation = Self(rawValue: 1)
    static let distributedOperation = Self(rawValue: 2)
    static let dSAOperation = Self(rawValue: 3)
}

// MARK: - InformationFramework_AttributeValue.swift
@usableFromInline typealias InformationFramework_AttributeValue = ASN1Any

// MARK: - InformationFramework_AttributeValueAssertion.swift
@usableFromInline struct InformationFramework_AttributeValueAssertion: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var assertion: ASN1Any
    @usableFromInline var assertedContexts: InformationFramework_AttributeValueAssertion_assertedContexts_Choice?
    @inlinable init(type: ASN1ObjectIdentifier, assertion: ASN1Any, assertedContexts: InformationFramework_AttributeValueAssertion_assertedContexts_Choice?) {
        self.type = type
        self.assertion = assertion
        self.assertedContexts = assertedContexts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let assertion: ASN1Any = try ASN1Any(derEncoded: &nodes)
            var assertedContexts: InformationFramework_AttributeValueAssertion_assertedContexts_Choice? = nil
var peek_assertedContexts = nodes
if let next = peek_assertedContexts.next(), next.identifier == InformationFramework_AttributeValueAssertion_assertedContexts_Choice.defaultIdentifier {
    assertedContexts = try InformationFramework_AttributeValueAssertion_assertedContexts_Choice(derEncoded: &nodes)
}

            return InformationFramework_AttributeValueAssertion(type: type, assertion: assertion, assertedContexts: assertedContexts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(assertion)
            if let assertedContexts = self.assertedContexts { try coder.serialize(assertedContexts) }

        }
    }
}

// MARK: - InformationFramework_AttributeValueAssertion_assertedContexts_Choice.swift
@usableFromInline indirect enum InformationFramework_AttributeValueAssertion_assertedContexts_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case allContexts(ASN1Null)
    case selectedContexts([InformationFramework_ContextAssertion])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .allContexts(try ASN1Null(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .selectedContexts(try DER.set(of: InformationFramework_ContextAssertion.self, identifier: rootNode.identifier, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .allContexts(let allContexts): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try allContexts.serialize(into: &coder) }
        case .selectedContexts(let selectedContexts): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try coder.serializeSetOf(selectedContexts) }

        }
    }

}

// MARK: - InformationFramework_AttributeValueX.swift
@usableFromInline indirect enum InformationFramework_AttributeValueX: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case utf8(ASN1UTF8String)
    case printable(ASN1PrintableString)
    case `else`(ASN1Any)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printable(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 9, tagClass: .universal):
            self = .`else`(ASN1Any(derEncoded: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .utf8(let utf8):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8)
                            }
                        } else {
                            try coder.serialize(utf8)
                        }
        case .printable(let printable):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printable)
                            }
                        } else {
                            try coder.serialize(printable)
                        }
        case .`else`(let `else`):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(`else`)
                            }
                        } else {
                            try coder.serialize(`else`)
                        }

        }
    }

}

// MARK: - InformationFramework_BaseDistance.swift
@usableFromInline typealias InformationFramework_BaseDistance = Int

// MARK: - InformationFramework_CONTENT_RULE.swift
@usableFromInline struct InformationFramework_CONTENT_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_CONTENT_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_ChopSpecification.swift
@usableFromInline struct InformationFramework_ChopSpecification: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var specificExclusions: [InformationFramework_ChopSpecification_specificExclusions_Choice]?
    @usableFromInline var minimum: InformationFramework_BaseDistance?
    @usableFromInline var maximum: InformationFramework_BaseDistance?
    @inlinable init(specificExclusions: [InformationFramework_ChopSpecification_specificExclusions_Choice]?, minimum: InformationFramework_BaseDistance?, maximum: InformationFramework_BaseDistance?) {
        self.specificExclusions = specificExclusions
        self.minimum = minimum
        self.maximum = maximum

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let specificExclusions: [InformationFramework_ChopSpecification_specificExclusions_Choice]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.set(of: InformationFramework_ChopSpecification_specificExclusions_Choice.self, identifier: .set, rootNode: node) }
            let minimum: InformationFramework_BaseDistance? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try InformationFramework_BaseDistance(derEncoded: node) }
            let maximum: InformationFramework_BaseDistance? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in return try InformationFramework_BaseDistance(derEncoded: node) }

            return InformationFramework_ChopSpecification(specificExclusions: specificExclusions, minimum: minimum, maximum: maximum)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let specificExclusions = self.specificExclusions { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(specificExclusions) } }
            if let minimum = self.minimum { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(minimum) } }
            if let maximum = self.maximum { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serialize(maximum) } }

        }
    }
}

// MARK: - InformationFramework_ChopSpecification_specificExclusions_Choice.swift
@usableFromInline indirect enum InformationFramework_ChopSpecification_specificExclusions_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case chopBefore(InformationFramework_LocalName)
    case chopAfter(InformationFramework_LocalName)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .chopBefore(try InformationFramework_LocalName(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .chopAfter(try InformationFramework_LocalName(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .chopBefore(let chopBefore): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try chopBefore.serialize(into: &coder) }
        case .chopAfter(let chopAfter): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try chopAfter.serialize(into: &coder) }

        }
    }

}

// MARK: - InformationFramework_Context.swift
@usableFromInline struct InformationFramework_Context: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_Context(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_ContextAssertion.swift
@usableFromInline struct InformationFramework_ContextAssertion: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contextType: ASN1ObjectIdentifier
    @usableFromInline var contextValues: [ASN1Any]
    @inlinable init(contextType: ASN1ObjectIdentifier, contextValues: [ASN1Any]) {
        self.contextType = contextType
        self.contextValues = contextValues

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contextType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let contextValues: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return InformationFramework_ContextAssertion(contextType: contextType, contextValues: contextValues)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contextType)
            try coder.serializeSetOf(contextValues)

        }
    }
}

// MARK: - InformationFramework_ContextCombination.swift
@usableFromInline indirect enum InformationFramework_ContextCombination: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case context(ASN1ObjectIdentifier)
    case and([InformationFramework_ContextCombination])
    case or([InformationFramework_ContextCombination])
    case not(InformationFramework_ContextCombination)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .context(try ASN1ObjectIdentifier(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .and(try DER.sequence(of: InformationFramework_ContextCombination.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .or(try DER.sequence(of: InformationFramework_ContextCombination.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .not(try InformationFramework_ContextCombination(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .context(let context): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try context.serialize(into: &coder) }
        case .and(let and): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try coder.serializeSequenceOf(and) }
        case .or(let or): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try coder.serializeSequenceOf(or) }
        case .not(let not): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try not.serialize(into: &coder) }

        }
    }

}

// MARK: - InformationFramework_ContextProfile.swift
@usableFromInline struct InformationFramework_ContextProfile: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contextType: ASN1ObjectIdentifier
    @usableFromInline var contextValue: [ASN1Any]?
    @inlinable init(contextType: ASN1ObjectIdentifier, contextValue: [ASN1Any]?) {
        self.contextType = contextType
        self.contextValue = contextValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contextType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let contextValue: [ASN1Any]? = try DER.sequence(of: ASN1Any.self, identifier: .sequence, nodes: &nodes)

            return InformationFramework_ContextProfile(contextType: contextType, contextValue: contextValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contextType)
            if let contextValue = self.contextValue { try coder.serializeSequenceOf(contextValue) }

        }
    }
}

// MARK: - InformationFramework_DITContentRule.swift
@usableFromInline struct InformationFramework_DITContentRule: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var structuralObjectClass: ASN1ObjectIdentifier
    @usableFromInline var auxiliaries: [ASN1ObjectIdentifier]?
    @usableFromInline var mandatory: [ASN1ObjectIdentifier]?
    @usableFromInline var `optional`: [ASN1ObjectIdentifier]?
    @usableFromInline var precluded: [ASN1ObjectIdentifier]?
    @inlinable init(structuralObjectClass: ASN1ObjectIdentifier, auxiliaries: [ASN1ObjectIdentifier]?, mandatory: [ASN1ObjectIdentifier]?, `optional`: [ASN1ObjectIdentifier]?, precluded: [ASN1ObjectIdentifier]?) {
        self.structuralObjectClass = structuralObjectClass
        self.auxiliaries = auxiliaries
        self.mandatory = mandatory
        self.`optional` = `optional`
        self.precluded = precluded

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let structuralObjectClass: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let auxiliaries: [ASN1ObjectIdentifier]? = try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, nodes: &nodes)
            let mandatory: [ASN1ObjectIdentifier]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, rootNode: node) }
            let `optional`: [ASN1ObjectIdentifier]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, rootNode: node) }
            let precluded: [ASN1ObjectIdentifier]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, rootNode: node) }

            return InformationFramework_DITContentRule(structuralObjectClass: structuralObjectClass, auxiliaries: auxiliaries, mandatory: mandatory, `optional`: `optional`, precluded: precluded)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(structuralObjectClass)
            if let auxiliaries = self.auxiliaries { try coder.serializeSetOf(auxiliaries) }
            if let mandatory = self.mandatory { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(mandatory) } }
            if let `optional` = self.`optional` { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(`optional`) } }
            if let precluded = self.precluded { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(precluded) } }

        }
    }
}

// MARK: - InformationFramework_DITContextUse.swift
@usableFromInline struct InformationFramework_DITContextUse: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attributeType: ASN1ObjectIdentifier
    @usableFromInline var mandatoryContexts: [ASN1ObjectIdentifier]?
    @usableFromInline var optionalContexts: [ASN1ObjectIdentifier]?
    @inlinable init(attributeType: ASN1ObjectIdentifier, mandatoryContexts: [ASN1ObjectIdentifier]?, optionalContexts: [ASN1ObjectIdentifier]?) {
        self.attributeType = attributeType
        self.mandatoryContexts = mandatoryContexts
        self.optionalContexts = optionalContexts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attributeType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let mandatoryContexts: [ASN1ObjectIdentifier]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, rootNode: node) }
            let optionalContexts: [ASN1ObjectIdentifier]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, rootNode: node) }

            return InformationFramework_DITContextUse(attributeType: attributeType, mandatoryContexts: mandatoryContexts, optionalContexts: optionalContexts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attributeType)
            if let mandatoryContexts = self.mandatoryContexts { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(mandatoryContexts) } }
            if let optionalContexts = self.optionalContexts { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(optionalContexts) } }

        }
    }
}

// MARK: - InformationFramework_DITStructureRule.swift
@usableFromInline struct InformationFramework_DITStructureRule: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var ruleIdentifier: InformationFramework_RuleIdentifier
    @usableFromInline var nameForm: ASN1ObjectIdentifier
    @usableFromInline var superiorStructureRules: [InformationFramework_RuleIdentifier]?
    @inlinable init(ruleIdentifier: InformationFramework_RuleIdentifier, nameForm: ASN1ObjectIdentifier, superiorStructureRules: [InformationFramework_RuleIdentifier]?) {
        self.ruleIdentifier = ruleIdentifier
        self.nameForm = nameForm
        self.superiorStructureRules = superiorStructureRules

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let ruleIdentifier: InformationFramework_RuleIdentifier = try InformationFramework_RuleIdentifier(derEncoded: &nodes)
            let nameForm: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let superiorStructureRules: [InformationFramework_RuleIdentifier]? = try DER.set(of: InformationFramework_RuleIdentifier.self, identifier: .set, nodes: &nodes)

            return InformationFramework_DITStructureRule(ruleIdentifier: ruleIdentifier, nameForm: nameForm, superiorStructureRules: superiorStructureRules)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(ruleIdentifier)
            try coder.serialize(nameForm)
            if let superiorStructureRules = self.superiorStructureRules { try coder.serializeSetOf(superiorStructureRules) }

        }
    }
}

// MARK: - InformationFramework_DIT_CONTEXT_USE_RULE.swift
@usableFromInline struct InformationFramework_DIT_CONTEXT_USE_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_DIT_CONTEXT_USE_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_DistinguishedName.swift
@usableFromInline typealias InformationFramework_DistinguishedName = InformationFramework_RDNSequence

// MARK: - InformationFramework_EntryLimit.swift
@usableFromInline struct InformationFramework_EntryLimit: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var `default`: ArraySlice<UInt8>
    @usableFromInline var max: ArraySlice<UInt8>
    @inlinable init(`default`: ArraySlice<UInt8>, max: ArraySlice<UInt8>) {
        self.`default` = `default`
        self.max = max

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let `default`: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let max: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)

            return InformationFramework_EntryLimit(`default`: `default`, max: max)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(`default`)
            try coder.serialize(max)

        }
    }
}

// MARK: - InformationFramework_ImposedSubset.swift
public struct InformationFramework_ImposedSubset: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let baseObject = Self(rawValue: 0)
    static let oneLevel = Self(rawValue: 1)
    static let wholeSubtree = Self(rawValue: 2)
}

// MARK: - InformationFramework_LocalName.swift
@usableFromInline typealias InformationFramework_LocalName = InformationFramework_RDNSequence

// MARK: - InformationFramework_MAPPING_BASED_MATCHING.swift
@usableFromInline struct InformationFramework_MAPPING_BASED_MATCHING: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_MAPPING_BASED_MATCHING(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_MATCHING_RESTRICTION.swift
@usableFromInline struct InformationFramework_MATCHING_RESTRICTION: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_MATCHING_RESTRICTION(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_MATCHING_RULE.swift
@usableFromInline struct InformationFramework_MATCHING_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_MATCHING_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_MRMapping.swift
@usableFromInline struct InformationFramework_MRMapping: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var mapping: [InformationFramework_Mapping]?
    @usableFromInline var substitution: [InformationFramework_MRSubstitution]?
    @inlinable init(mapping: [InformationFramework_Mapping]?, substitution: [InformationFramework_MRSubstitution]?) {
        self.mapping = mapping
        self.substitution = substitution

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let mapping: [InformationFramework_Mapping]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_Mapping.self, identifier: .sequence, rootNode: node) }
            let substitution: [InformationFramework_MRSubstitution]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_MRSubstitution.self, identifier: .sequence, rootNode: node) }

            return InformationFramework_MRMapping(mapping: mapping, substitution: substitution)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let mapping = self.mapping { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(mapping) } }
            if let substitution = self.substitution { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(substitution) } }

        }
    }
}

// MARK: - InformationFramework_MRSubstitution.swift
@usableFromInline struct InformationFramework_MRSubstitution: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attribute: InformationFramework_AttributeType
    @usableFromInline var oldMatchingRule: ASN1ObjectIdentifier?
    @usableFromInline var newMatchingRule: ASN1ObjectIdentifier?
    @inlinable init(attribute: InformationFramework_AttributeType, oldMatchingRule: ASN1ObjectIdentifier?, newMatchingRule: ASN1ObjectIdentifier?) {
        self.attribute = attribute
        self.oldMatchingRule = oldMatchingRule
        self.newMatchingRule = newMatchingRule

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attribute: InformationFramework_AttributeType = try InformationFramework_AttributeType(derEncoded: &nodes)
            let oldMatchingRule: ASN1ObjectIdentifier? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1ObjectIdentifier(derEncoded: node) }
            let newMatchingRule: ASN1ObjectIdentifier? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ASN1ObjectIdentifier(derEncoded: node) }

            return InformationFramework_MRSubstitution(attribute: attribute, oldMatchingRule: oldMatchingRule, newMatchingRule: newMatchingRule)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attribute)
            if let oldMatchingRule = self.oldMatchingRule { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(oldMatchingRule) } }
            if let newMatchingRule = self.newMatchingRule { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(newMatchingRule) } }

        }
    }
}

// MARK: - InformationFramework_Mapping.swift
@usableFromInline struct InformationFramework_Mapping: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var mappingFunction: ASN1ObjectIdentifier
    @usableFromInline var level: ArraySlice<UInt8>?
    @inlinable init(mappingFunction: ASN1ObjectIdentifier, level: ArraySlice<UInt8>?) {
        self.mappingFunction = mappingFunction
        self.level = level

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let mappingFunction: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var level: ArraySlice<UInt8>? = nil
var peek_level = nodes
if let next = peek_level.next(), next.identifier == ArraySlice<UInt8>.defaultIdentifier {
    level = try ArraySlice<UInt8>(derEncoded: &nodes)
}

            return InformationFramework_Mapping(mappingFunction: mappingFunction, level: level)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(mappingFunction)
            if let level = self.level { try coder.serialize(level) }

        }
    }
}

// MARK: - InformationFramework_MatchingUse.swift
@usableFromInline struct InformationFramework_MatchingUse: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var restrictionType: ASN1ObjectIdentifier
    @usableFromInline var restrictionValue: ASN1Any
    @inlinable init(restrictionType: ASN1ObjectIdentifier, restrictionValue: ASN1Any) {
        self.restrictionType = restrictionType
        self.restrictionValue = restrictionValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let restrictionType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let restrictionValue: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return InformationFramework_MatchingUse(restrictionType: restrictionType, restrictionValue: restrictionValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(restrictionType)
            try coder.serialize(restrictionValue)

        }
    }
}

// MARK: - InformationFramework_NAME_FORM.swift
@usableFromInline struct InformationFramework_NAME_FORM: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_NAME_FORM(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_Name.swift
@usableFromInline indirect enum InformationFramework_Name: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { InformationFramework_RDNSequence.defaultIdentifier }
        case rdnSequence(InformationFramework_RDNSequence)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case InformationFramework_RDNSequence.defaultIdentifier:
            self = .rdnSequence(try InformationFramework_RDNSequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
default:
    if identifier == rootNode.identifier {
        if case .constructed(let nodes) = rootNode.content {
            var iterator = nodes.makeIterator()
            if let first = iterator.next(), iterator.next() == nil {
                if first.identifier == InformationFramework_RDNSequence.defaultIdentifier {
                    self = .rdnSequence(try InformationFramework_RDNSequence(derEncoded: first, withIdentifier: InformationFramework_RDNSequence.defaultIdentifier))
                    return
                }
            }
        }
        self = .rdnSequence(try InformationFramework_RDNSequence(derEncoded: rootNode, withIdentifier: identifier))
    } else {
        throw ASN1Error.unexpectedFieldType(rootNode.identifier)
    }

        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .rdnSequence(let rdnSequence):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(rdnSequence)
                            }
                        } else {
                            try coder.serialize(rdnSequence)
                        }

        }
    }

}

// MARK: - InformationFramework_OBJECT_CLASS.swift
@usableFromInline struct InformationFramework_OBJECT_CLASS: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_OBJECT_CLASS(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_ObjectClassKind.swift
public struct InformationFramework_ObjectClassKind: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let abstract = Self(rawValue: 0)
    static let structural = Self(rawValue: 1)
    static let auxiliary = Self(rawValue: 2)
}

// MARK: - InformationFramework_OutputValues.swift
@usableFromInline indirect enum InformationFramework_OutputValues: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case selectedValues([ASN1Any])
    case matchedValuesOnly(ASN1Null)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.sequence:
            self = .selectedValues(try DER.sequence(of: ASN1Any.self, identifier: .sequence, rootNode: rootNode))
        case ASN1Null.defaultIdentifier:
            self = .matchedValuesOnly(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .selectedValues(let selectedValues): try coder.serializeSequenceOf(selectedValues)
        case .matchedValuesOnly(let matchedValuesOnly):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(matchedValuesOnly)
                            }
                        } else {
                            try coder.serialize(matchedValuesOnly)
                        }

        }
    }

}

// MARK: - InformationFramework_RDNSequence.swift
@usableFromInline struct InformationFramework_RDNSequence: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [InformationFramework_RelativeDistinguishedName]
    @inlinable public init(_ value: [InformationFramework_RelativeDistinguishedName]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: InformationFramework_RelativeDistinguishedName.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - InformationFramework_REQUEST_ATTRIBUTE.swift
@usableFromInline struct InformationFramework_REQUEST_ATTRIBUTE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_REQUEST_ATTRIBUTE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_RESULT_ATTRIBUTE.swift
@usableFromInline struct InformationFramework_RESULT_ATTRIBUTE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_RESULT_ATTRIBUTE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_Refinement.swift
@usableFromInline indirect enum InformationFramework_Refinement: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case item(ASN1ObjectIdentifier)
    case and([InformationFramework_Refinement])
    case or([InformationFramework_Refinement])
    case not(InformationFramework_Refinement)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .item(try ASN1ObjectIdentifier(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .and(try DER.set(of: InformationFramework_Refinement.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .or(try DER.set(of: InformationFramework_Refinement.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .not(try InformationFramework_Refinement(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .item(let item): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try item.serialize(into: &coder) }
        case .and(let and): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try coder.serializeSetOf(and) }
        case .or(let or): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try coder.serializeSetOf(or) }
        case .not(let not): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try not.serialize(into: &coder) }

        }
    }

}

// MARK: - InformationFramework_RelativeDistinguishedName.swift
@usableFromInline struct InformationFramework_RelativeDistinguishedName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [InformationFramework_AttributeTypeAndValue]
    @inlinable public init(_ value: [InformationFramework_AttributeTypeAndValue]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: InformationFramework_AttributeTypeAndValue.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - InformationFramework_RelaxationPolicy.swift
@usableFromInline struct InformationFramework_RelaxationPolicy: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var basic: InformationFramework_MRMapping?
    @usableFromInline var tightenings: [InformationFramework_MRMapping]?
    @usableFromInline var relaxations: [InformationFramework_MRMapping]?
    @usableFromInline var maximum: ArraySlice<UInt8>?
    @usableFromInline var minimum: ArraySlice<UInt8>?
    @inlinable init(basic: InformationFramework_MRMapping?, tightenings: [InformationFramework_MRMapping]?, relaxations: [InformationFramework_MRMapping]?, maximum: ArraySlice<UInt8>?, minimum: ArraySlice<UInt8>?) {
        self.basic = basic
        self.tightenings = tightenings
        self.relaxations = relaxations
        self.maximum = maximum
        self.minimum = minimum

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let basic: InformationFramework_MRMapping? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try InformationFramework_MRMapping(derEncoded: node) }
            let tightenings: [InformationFramework_MRMapping]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_MRMapping.self, identifier: .sequence, rootNode: node) }
            let relaxations: [InformationFramework_MRMapping]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_MRMapping.self, identifier: .sequence, rootNode: node) }
            let maximum: ArraySlice<UInt8>? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in return try ArraySlice<UInt8>(derEncoded: node) }
            let minimum: ArraySlice<UInt8>? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 4, tagClass: .contextSpecific) { node in return try ArraySlice<UInt8>(derEncoded: node) }

            return InformationFramework_RelaxationPolicy(basic: basic, tightenings: tightenings, relaxations: relaxations, maximum: maximum, minimum: minimum)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let basic = self.basic { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(basic) } }
            if let tightenings = self.tightenings { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(tightenings) } }
            if let relaxations = self.relaxations { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(relaxations) } }
            if let maximum = self.maximum { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serialize(maximum) } }
            if let minimum = self.minimum { try coder.serialize(explicitlyTaggedWithTagNumber: 4, tagClass: .contextSpecific) { codec in try codec.serialize(minimum) } }

        }
    }
}

// MARK: - InformationFramework_RequestAttribute.swift
@usableFromInline struct InformationFramework_RequestAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attributeType: ASN1ObjectIdentifier
    @usableFromInline var includeSubtypes: Bool?
    @usableFromInline var selectedValues: [ASN1Any]?
    @usableFromInline var defaultValues: [InformationFramework_RequestAttribute_defaultValues_Sequence]?
    @usableFromInline var contexts: [InformationFramework_ContextProfile]?
    @usableFromInline var contextCombination: InformationFramework_ContextCombination?
    @usableFromInline var matchingUse: [InformationFramework_MatchingUse]?
    @inlinable init(attributeType: ASN1ObjectIdentifier, includeSubtypes: Bool?, selectedValues: [ASN1Any]?, defaultValues: [InformationFramework_RequestAttribute_defaultValues_Sequence]?, contexts: [InformationFramework_ContextProfile]?, contextCombination: InformationFramework_ContextCombination?, matchingUse: [InformationFramework_MatchingUse]?) {
        self.attributeType = attributeType
        self.includeSubtypes = includeSubtypes
        self.selectedValues = selectedValues
        self.defaultValues = defaultValues
        self.contexts = contexts
        self.contextCombination = contextCombination
        self.matchingUse = matchingUse

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attributeType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let includeSubtypes: Bool? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try Bool(derEncoded: node) }
            let selectedValues: [ASN1Any]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in try DER.sequence(of: ASN1Any.self, identifier: .sequence, rootNode: node) }
            let defaultValues: [InformationFramework_RequestAttribute_defaultValues_Sequence]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_RequestAttribute_defaultValues_Sequence.self, identifier: .sequence, rootNode: node) }
            let contexts: [InformationFramework_ContextProfile]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_ContextProfile.self, identifier: .sequence, rootNode: node) }
            let contextCombination: InformationFramework_ContextCombination? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 4, tagClass: .contextSpecific) { node in return try InformationFramework_ContextCombination(derEncoded: node) }
            let matchingUse: [InformationFramework_MatchingUse]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 5, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_MatchingUse.self, identifier: .sequence, rootNode: node) }

            return InformationFramework_RequestAttribute(attributeType: attributeType, includeSubtypes: includeSubtypes, selectedValues: selectedValues, defaultValues: defaultValues, contexts: contexts, contextCombination: contextCombination, matchingUse: matchingUse)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attributeType)
            if let includeSubtypes = self.includeSubtypes { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(includeSubtypes) } }
            if let selectedValues = self.selectedValues { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(selectedValues) } }
            if let defaultValues = self.defaultValues { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(defaultValues) } }
            if let contexts = self.contexts { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(contexts) } }
            if let contextCombination = self.contextCombination { try coder.serialize(explicitlyTaggedWithTagNumber: 4, tagClass: .contextSpecific) { codec in try codec.serialize(contextCombination) } }
            if let matchingUse = self.matchingUse { try coder.serialize(explicitlyTaggedWithTagNumber: 5, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(matchingUse) } }

        }
    }
}

// MARK: - InformationFramework_RequestAttribute_defaultValues_Sequence.swift
@usableFromInline struct InformationFramework_RequestAttribute_defaultValues_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var entryType: ASN1ObjectIdentifier?
    @usableFromInline var values: [ASN1Any]
    @inlinable init(entryType: ASN1ObjectIdentifier?, values: [ASN1Any]) {
        self.entryType = entryType
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var entryType: ASN1ObjectIdentifier? = nil
var peek_entryType = nodes
if let next = peek_entryType.next(), next.identifier == ASN1ObjectIdentifier.defaultIdentifier {
    entryType = try ASN1ObjectIdentifier(derEncoded: &nodes)
}
            let values: [ASN1Any] = try DER.sequence(of: ASN1Any.self, identifier: .sequence, nodes: &nodes)

            return InformationFramework_RequestAttribute_defaultValues_Sequence(entryType: entryType, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let entryType = self.entryType { try coder.serialize(entryType) }
            try coder.serializeSequenceOf(values)

        }
    }
}

// MARK: - InformationFramework_ResultAttribute.swift
@usableFromInline struct InformationFramework_ResultAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attributeType: ASN1ObjectIdentifier
    @usableFromInline var outputValues: InformationFramework_ResultAttribute_outputValues_Choice?
    @usableFromInline var contexts: [InformationFramework_ContextProfile]?
    @inlinable init(attributeType: ASN1ObjectIdentifier, outputValues: InformationFramework_ResultAttribute_outputValues_Choice?, contexts: [InformationFramework_ContextProfile]?) {
        self.attributeType = attributeType
        self.outputValues = outputValues
        self.contexts = contexts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attributeType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var outputValues: InformationFramework_ResultAttribute_outputValues_Choice? = nil
var peek_outputValues = nodes
if let next = peek_outputValues.next(), next.identifier == InformationFramework_ResultAttribute_outputValues_Choice.defaultIdentifier {
    outputValues = try InformationFramework_ResultAttribute_outputValues_Choice(derEncoded: &nodes)
}
            let contexts: [InformationFramework_ContextProfile]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in try DER.sequence(of: InformationFramework_ContextProfile.self, identifier: .sequence, rootNode: node) }

            return InformationFramework_ResultAttribute(attributeType: attributeType, outputValues: outputValues, contexts: contexts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attributeType)
            if let outputValues = self.outputValues { try coder.serialize(outputValues) }
            if let contexts = self.contexts { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serializeSequenceOf(contexts) } }

        }
    }
}

// MARK: - InformationFramework_ResultAttribute_outputValues_Choice.swift
@usableFromInline indirect enum InformationFramework_ResultAttribute_outputValues_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case selectedValues([ASN1Any])
    case matchedValuesOnly(ASN1Null)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.sequence:
            self = .selectedValues(try DER.sequence(of: ASN1Any.self, identifier: .sequence, rootNode: rootNode))
        case ASN1Null.defaultIdentifier:
            self = .matchedValuesOnly(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .selectedValues(let selectedValues): try coder.serializeSequenceOf(selectedValues)
        case .matchedValuesOnly(let matchedValuesOnly):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(matchedValuesOnly)
                            }
                        } else {
                            try coder.serialize(matchedValuesOnly)
                        }

        }
    }

}

// MARK: - InformationFramework_RuleIdentifier.swift
@usableFromInline typealias InformationFramework_RuleIdentifier = Int

// MARK: - InformationFramework_SEARCH_RULE.swift
@usableFromInline struct InformationFramework_SEARCH_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_SEARCH_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_STRUCTURE_RULE.swift
@usableFromInline struct InformationFramework_STRUCTURE_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return InformationFramework_STRUCTURE_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - InformationFramework_SubtreeSpecification.swift
@usableFromInline struct InformationFramework_SubtreeSpecification: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var base: InformationFramework_LocalName?
    @usableFromInline var specificationFilter: InformationFramework_Refinement?
    @inlinable init(base: InformationFramework_LocalName?, specificationFilter: InformationFramework_Refinement?) {
        self.base = base
        self.specificationFilter = specificationFilter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let base: InformationFramework_LocalName? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try InformationFramework_LocalName(derEncoded: node) }
            let specificationFilter: InformationFramework_Refinement? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 4, tagClass: .contextSpecific) { node in return try InformationFramework_Refinement(derEncoded: node) }

            return InformationFramework_SubtreeSpecification(base: base, specificationFilter: specificationFilter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let base = self.base { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(base) } }
            if let specificationFilter = self.specificationFilter { try coder.serialize(explicitlyTaggedWithTagNumber: 4, tagClass: .contextSpecific) { codec in try codec.serialize(specificationFilter) } }

        }
    }
}

// MARK: - InformationFramework_id_ar_accessControlInnerArea_oid.swift
public let InformationFramework_id_ar_accessControlInnerArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [3]

// MARK: - InformationFramework_id_ar_accessControlSpecificArea_oid.swift
public let InformationFramework_id_ar_accessControlSpecificArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [2]

// MARK: - InformationFramework_id_ar_autonomousArea_oid.swift
public let InformationFramework_id_ar_autonomousArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [1]

// MARK: - InformationFramework_id_ar_collectiveAttributeInnerArea_oid.swift
public let InformationFramework_id_ar_collectiveAttributeInnerArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [6]

// MARK: - InformationFramework_id_ar_collectiveAttributeSpecificArea_oid.swift
public let InformationFramework_id_ar_collectiveAttributeSpecificArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [5]

// MARK: - InformationFramework_id_ar_contextDefaultSpecificArea_oid.swift
public let InformationFramework_id_ar_contextDefaultSpecificArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [7]

// MARK: - InformationFramework_id_ar_serviceSpecificArea_oid.swift
public let InformationFramework_id_ar_serviceSpecificArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [8]

// MARK: - InformationFramework_id_ar_subschemaAdminSpecificArea_oid.swift
public let InformationFramework_id_ar_subschemaAdminSpecificArea: ASN1ObjectIdentifier = UsefulDefinitions_id_ar + [4]

// MARK: - InformationFramework_id_at_aliasedEntryName_oid.swift
public let InformationFramework_id_at_aliasedEntryName: ASN1ObjectIdentifier = InformationFramework_id_at + [1]

// MARK: - InformationFramework_id_at_commonName_oid.swift
public let InformationFramework_id_at_commonName: ASN1ObjectIdentifier = InformationFramework_id_at + [3]

// MARK: - InformationFramework_id_at_countryName_oid.swift
public let InformationFramework_id_at_countryName: ASN1ObjectIdentifier = InformationFramework_id_at + [6]

// MARK: - InformationFramework_id_at_localityName_oid.swift
public let InformationFramework_id_at_localityName: ASN1ObjectIdentifier = InformationFramework_id_at + [7]

// MARK: - InformationFramework_id_at_objectClass_oid.swift
public let InformationFramework_id_at_objectClass: ASN1ObjectIdentifier = InformationFramework_id_at + [0]

// MARK: - InformationFramework_id_at_oid.swift
public let InformationFramework_id_at: ASN1ObjectIdentifier = [2, 5, 4]

// MARK: - InformationFramework_id_at_organizationName_oid.swift
public let InformationFramework_id_at_organizationName: ASN1ObjectIdentifier = InformationFramework_id_at + [10]

// MARK: - InformationFramework_id_at_organizationalUnitName_oid.swift
public let InformationFramework_id_at_organizationalUnitName: ASN1ObjectIdentifier = InformationFramework_id_at + [11]

// MARK: - InformationFramework_id_at_serialNumber_oid.swift
public let InformationFramework_id_at_serialNumber: ASN1ObjectIdentifier = InformationFramework_id_at + [5]

// MARK: - InformationFramework_id_at_stateOrProvinceName_oid.swift
public let InformationFramework_id_at_stateOrProvinceName: ASN1ObjectIdentifier = InformationFramework_id_at + [8]

// MARK: - InformationFramework_id_mr_distinguishedNameMatch_oid.swift
public let InformationFramework_id_mr_distinguishedNameMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [1]

// MARK: - InformationFramework_id_mr_objectIdentifierMatch_oid.swift
public let InformationFramework_id_mr_objectIdentifierMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [0]

// MARK: - InformationFramework_id_nf_subentryNameForm_oid.swift
public let InformationFramework_id_nf_subentryNameForm: ASN1ObjectIdentifier = UsefulDefinitions_id_nf + [16]

// MARK: - InformationFramework_id_oa_accessControlSubentryList_oid.swift
public let InformationFramework_id_oa_accessControlSubentryList: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [11]

// MARK: - InformationFramework_id_oa_administrativeRole_oid.swift
public let InformationFramework_id_oa_administrativeRole: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [5]

// MARK: - InformationFramework_id_oa_collectiveAttributeSubentryList_oid.swift
public let InformationFramework_id_oa_collectiveAttributeSubentryList: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [12]

// MARK: - InformationFramework_id_oa_collectiveExclusions_oid.swift
public let InformationFramework_id_oa_collectiveExclusions: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [7]

// MARK: - InformationFramework_id_oa_contextAssertionDefault_oid.swift
public let InformationFramework_id_oa_contextAssertionDefault: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [14]

// MARK: - InformationFramework_id_oa_contextDefaultSubentryList_oid.swift
public let InformationFramework_id_oa_contextDefaultSubentryList: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [13]

// MARK: - InformationFramework_id_oa_createTimestamp_oid.swift
public let InformationFramework_id_oa_createTimestamp: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [1]

// MARK: - InformationFramework_id_oa_creatorsName_oid.swift
public let InformationFramework_id_oa_creatorsName: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [3]

// MARK: - InformationFramework_id_oa_excludeAllCollectiveAttributes_oid.swift
public let InformationFramework_id_oa_excludeAllCollectiveAttributes: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [0]

// MARK: - InformationFramework_id_oa_hasSubordinates_oid.swift
public let InformationFramework_id_oa_hasSubordinates: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [9]

// MARK: - InformationFramework_id_oa_hierarchyBelow_oid.swift
public let InformationFramework_id_oa_hierarchyBelow: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [18]

// MARK: - InformationFramework_id_oa_hierarchyLevel_oid.swift
public let InformationFramework_id_oa_hierarchyLevel: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [17]

// MARK: - InformationFramework_id_oa_hierarchyParent_oid.swift
public let InformationFramework_id_oa_hierarchyParent: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [19]

// MARK: - InformationFramework_id_oa_modifiersName_oid.swift
public let InformationFramework_id_oa_modifiersName: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [4]

// MARK: - InformationFramework_id_oa_modifyTimestamp_oid.swift
public let InformationFramework_id_oa_modifyTimestamp: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [2]

// MARK: - InformationFramework_id_oa_searchRules_oid.swift
public let InformationFramework_id_oa_searchRules: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [16]

// MARK: - InformationFramework_id_oa_serviceAdminSubentryList_oid.swift
public let InformationFramework_id_oa_serviceAdminSubentryList: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [15]

// MARK: - InformationFramework_id_oa_subschemaSubentryList_oid.swift
public let InformationFramework_id_oa_subschemaSubentryList: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [10]

// MARK: - InformationFramework_id_oa_subschemaTimestamp_oid.swift
public let InformationFramework_id_oa_subschemaTimestamp: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [8]

// MARK: - InformationFramework_id_oa_subtreeSpecification_oid.swift
public let InformationFramework_id_oa_subtreeSpecification: ASN1ObjectIdentifier = UsefulDefinitions_id_oa + [6]

// MARK: - InformationFramework_id_oc_alias_oid.swift
public let InformationFramework_id_oc_alias: ASN1ObjectIdentifier = UsefulDefinitions_id_oc + [1]

// MARK: - InformationFramework_id_oc_child_oid.swift
public let InformationFramework_id_oc_child: ASN1ObjectIdentifier = UsefulDefinitions_id_oc + [29]

// MARK: - InformationFramework_id_oc_parent_oid.swift
public let InformationFramework_id_oc_parent: ASN1ObjectIdentifier = UsefulDefinitions_id_oc + [28]

// MARK: - InformationFramework_id_oc_top_oid.swift
public let InformationFramework_id_oc_top: ASN1ObjectIdentifier = UsefulDefinitions_id_oc + [0]

// MARK: - InformationFramework_id_sc_accessControlSubentry_oid.swift
public let InformationFramework_id_sc_accessControlSubentry: ASN1ObjectIdentifier = UsefulDefinitions_id_sc + [1]

// MARK: - InformationFramework_id_sc_collectiveAttributeSubentry_oid.swift
public let InformationFramework_id_sc_collectiveAttributeSubentry: ASN1ObjectIdentifier = UsefulDefinitions_id_sc + [2]

// MARK: - InformationFramework_id_sc_contextAssertionSubentry_oid.swift
public let InformationFramework_id_sc_contextAssertionSubentry: ASN1ObjectIdentifier = UsefulDefinitions_id_sc + [3]

// MARK: - InformationFramework_id_sc_serviceAdminSubentry_oid.swift
public let InformationFramework_id_sc_serviceAdminSubentry: ASN1ObjectIdentifier = UsefulDefinitions_id_sc + [4]

// MARK: - InformationFramework_id_sc_subentry_oid.swift
public let InformationFramework_id_sc_subentry: ASN1ObjectIdentifier = UsefulDefinitions_id_sc + [0]

// MARK: - PKCS_12_AuthenticatedSafe.swift
@usableFromInline struct PKCS_12_AuthenticatedSafe: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_ContentInfo]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_ContentInfo]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: CryptographicMessageSyntax_2010_ContentInfo.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_12_BAG_TYPE.swift
@usableFromInline typealias PKCS_12_BAG_TYPE = ASN1Any

// MARK: - PKCS_12_CRLBag.swift
@usableFromInline struct PKCS_12_CRLBag: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var crlId: ASN1ObjectIdentifier
    @usableFromInline var crlValue: ASN1Any
    @inlinable init(crlId: ASN1ObjectIdentifier, crlValue: ASN1Any) {
        self.crlId = crlId
        self.crlValue = crlValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let crlId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let crlValue: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKCS_12_CRLBag(crlId: crlId, crlValue: crlValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(crlId)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(crlValue) }

        }
    }
}

// MARK: - PKCS_12_CertBag.swift
@usableFromInline struct PKCS_12_CertBag: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certId: ASN1ObjectIdentifier
    @usableFromInline var certValue: ASN1Any
    @inlinable init(certId: ASN1ObjectIdentifier, certValue: ASN1Any) {
        self.certId = certId
        self.certValue = certValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let certValue: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKCS_12_CertBag(certId: certId, certValue: certValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(certId)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(certValue) }

        }
    }
}

// MARK: - PKCS_12_KeyBag.swift
@usableFromInline typealias PKCS_12_KeyBag = PKIXCRMF_2009_PrivateKeyInfo

// MARK: - PKCS_12_MacData.swift
@usableFromInline struct PKCS_12_MacData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var mac: PKCS_7_DigestInfo
    @usableFromInline var macSalt: ASN1OctetString
    @usableFromInline var iterations: ArraySlice<UInt8>?
    @inlinable init(mac: PKCS_7_DigestInfo, macSalt: ASN1OctetString, iterations: ArraySlice<UInt8>?) {
        self.mac = mac
        self.macSalt = macSalt
        self.iterations = iterations

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let mac: PKCS_7_DigestInfo = try PKCS_7_DigestInfo(derEncoded: &nodes)
            let macSalt: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            var iterations: ArraySlice<UInt8>? = nil
var peek_iterations = nodes
if let next = peek_iterations.next(), next.identifier == ArraySlice<UInt8>.defaultIdentifier {
    iterations = try ArraySlice<UInt8>(derEncoded: &nodes)
}

            return PKCS_12_MacData(mac: mac, macSalt: macSalt, iterations: iterations)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(mac)
            try coder.serialize(macSalt)
            if let iterations = self.iterations { try coder.serialize(iterations) }

        }
    }
}

// MARK: - PKCS_12_PFX.swift
@usableFromInline struct PKCS_12_PFX: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_12_PFX_version_IntEnum
    @usableFromInline var authSafe: CryptographicMessageSyntax_2010_ContentInfo
    @usableFromInline var macData: PKCS_12_MacData?
    @inlinable init(version: PKCS_12_PFX_version_IntEnum, authSafe: CryptographicMessageSyntax_2010_ContentInfo, macData: PKCS_12_MacData?) {
        self.version = version
        self.authSafe = authSafe
        self.macData = macData

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_12_PFX_version_IntEnum(rawValue: versionVal)
            let authSafe: CryptographicMessageSyntax_2010_ContentInfo = try CryptographicMessageSyntax_2010_ContentInfo(derEncoded: &nodes)
            var macData: PKCS_12_MacData? = nil
var peek_macData = nodes
if let next = peek_macData.next(), next.identifier == PKCS_12_MacData.defaultIdentifier {
    macData = try PKCS_12_MacData(derEncoded: &nodes)
}

            return PKCS_12_PFX(version: version, authSafe: authSafe, macData: macData)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(authSafe)
            if let macData = self.macData { try coder.serialize(macData) }

        }
    }
}

// MARK: - PKCS_12_PFX_version_IntEnum.swift
public struct PKCS_12_PFX_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_12_PFX_version_IntEnum, rhs: PKCS_12_PFX_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v3 = Self(rawValue: 3)
}

// MARK: - PKCS_12_PKCS12Attribute.swift
@usableFromInline struct PKCS_12_PKCS12Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var attrId: ASN1ObjectIdentifier
    @usableFromInline var attrValues: [ASN1Any]
    @inlinable init(attrId: ASN1ObjectIdentifier, attrValues: [ASN1Any]) {
        self.attrId = attrId
        self.attrValues = attrValues

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let attrId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let attrValues: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return PKCS_12_PKCS12Attribute(attrId: attrId, attrValues: attrValues)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(attrId)
            try coder.serializeSetOf(attrValues)

        }
    }
}

// MARK: - PKCS_12_PKCS8ShroudedKeyBag.swift
@usableFromInline typealias PKCS_12_PKCS8ShroudedKeyBag = PKCS_8_EncryptedPrivateKeyInfo

// MARK: - PKCS_12_SafeBag.swift
@usableFromInline struct PKCS_12_SafeBag: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var bagId: ASN1ObjectIdentifier
    @usableFromInline var bagValue: ASN1Any
    @usableFromInline var bagAttributes: [PKCS_12_PKCS12Attribute]?
    @inlinable init(bagId: ASN1ObjectIdentifier, bagValue: ASN1Any, bagAttributes: [PKCS_12_PKCS12Attribute]?) {
        self.bagId = bagId
        self.bagValue = bagValue
        self.bagAttributes = bagAttributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let bagId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let bagValue: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }
            let bagAttributes: [PKCS_12_PKCS12Attribute]? = try DER.set(of: PKCS_12_PKCS12Attribute.self, identifier: .set, nodes: &nodes)

            return PKCS_12_SafeBag(bagId: bagId, bagValue: bagValue, bagAttributes: bagAttributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(bagId)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(bagValue) }
            if let bagAttributes = self.bagAttributes { try coder.serializeSetOf(bagAttributes) }

        }
    }
}

// MARK: - PKCS_12_SafeContents.swift
@usableFromInline struct PKCS_12_SafeContents: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKCS_12_SafeBag]
    @inlinable public init(_ value: [PKCS_12_SafeBag]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKCS_12_SafeBag.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_12_SecretBag.swift
@usableFromInline struct PKCS_12_SecretBag: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var secretTypeId: ASN1ObjectIdentifier
    @usableFromInline var secretValue: ASN1Any
    @inlinable init(secretTypeId: ASN1ObjectIdentifier, secretValue: ASN1Any) {
        self.secretTypeId = secretTypeId
        self.secretValue = secretValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let secretTypeId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let secretValue: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKCS_12_SecretBag(secretTypeId: secretTypeId, secretValue: secretValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(secretTypeId)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(secretValue) }

        }
    }
}

// MARK: - PKCS_12_bagtypes_oid.swift
public let PKCS_12_bagtypes: ASN1ObjectIdentifier = PKCS_12_pkcs_12 + [10, 1]

// MARK: - PKCS_12_pbeWithSHAAnd128BitRC2_CBC_oid.swift
public let PKCS_12_pbeWithSHAAnd128BitRC2_CBC: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [5]

// MARK: - PKCS_12_pbeWithSHAAnd128BitRC4_oid.swift
public let PKCS_12_pbeWithSHAAnd128BitRC4: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [1]

// MARK: - PKCS_12_pbeWithSHAAnd2_KeyTripleDES_CBC_oid.swift
public let PKCS_12_pbeWithSHAAnd2_KeyTripleDES_CBC: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [4]

// MARK: - PKCS_12_pbeWithSHAAnd3_KeyTripleDES_CBC_oid.swift
public let PKCS_12_pbeWithSHAAnd3_KeyTripleDES_CBC: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [3]

// MARK: - PKCS_12_pbeWithSHAAnd40BitRC4_oid.swift
public let PKCS_12_pbeWithSHAAnd40BitRC4: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [2]

// MARK: - PKCS_12_pbewithSHAAnd40BitRC2_CBC_oid.swift
public let PKCS_12_pbewithSHAAnd40BitRC2_CBC: ASN1ObjectIdentifier = PKCS_12_pkcs_12PbeIds + [6]

// MARK: - PKCS_12_pkcs_12PbeIds_oid.swift
public let PKCS_12_pkcs_12PbeIds: ASN1ObjectIdentifier = PKCS_12_pkcs_12 + [1]

// MARK: - PKCS_12_pkcs_12_oid.swift
public let PKCS_12_pkcs_12: ASN1ObjectIdentifier = PKCS_12_pkcs + [12]

// MARK: - PKCS_12_pkcs_oid.swift
public let PKCS_12_pkcs: ASN1ObjectIdentifier = PKCS_12_rsadsi + [1]

// MARK: - PKCS_12_rsadsi_oid.swift
public let PKCS_12_rsadsi: ASN1ObjectIdentifier = [1, 2, 840, 113549]

// MARK: - PKCS_7_AlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_AlgorithmInformation_2009_AlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_AlgorithmInformation_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_Attribute.swift
@usableFromInline struct PKCS_7_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var values: [ASN1Any]
    @inlinable init(type: ASN1ObjectIdentifier, values: [ASN1Any]) {
        self.type = type
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let values: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return PKCS_7_Attribute(type: type, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serializeSetOf(values)

        }
    }
}

// MARK: - PKCS_7_CONTENTS.swift
@usableFromInline typealias PKCS_7_CONTENTS = ASN1Any

// MARK: - PKCS_7_CRLSequence.swift
@usableFromInline struct PKCS_7_CRLSequence: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_CertificateList]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_CertificateList]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: CryptographicMessageSyntax_2010_CertificateList.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_7_Certificate.swift
@usableFromInline typealias PKCS_7_Certificate = AuthenticationFramework_Certificate

// MARK: - PKCS_7_CertificateRevocationLists.swift
@usableFromInline struct PKCS_7_CertificateRevocationLists: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [CryptographicMessageSyntax_2010_CertificateList]
    @inlinable public init(_ value: [CryptographicMessageSyntax_2010_CertificateList]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: CryptographicMessageSyntax_2010_CertificateList.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_7_CertificateSerialNumber.swift
@usableFromInline typealias PKCS_7_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - PKCS_7_Certificates.swift
@usableFromInline struct PKCS_7_Certificates: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKCS_7_Certificate]
    @inlinable public init(_ value: [PKCS_7_Certificate]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKCS_7_Certificate.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_7_ContentEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_ContentEncryptionAlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_ContentInfo.swift
@usableFromInline struct PKCS_7_ContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: PKCS_7_ContentType
    @usableFromInline var content: ASN1Any?
    @inlinable init(contentType: PKCS_7_ContentType, content: ASN1Any?) {
        self.contentType = contentType
        self.content = content

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: PKCS_7_ContentType = try PKCS_7_ContentType(derEncoded: &nodes)
            let content: ASN1Any? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKCS_7_ContentInfo(contentType: contentType, content: content)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            if let content = self.content { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(content) } }

        }
    }
}

// MARK: - PKCS_7_ContentType.swift
@usableFromInline typealias PKCS_7_ContentType = ASN1ObjectIdentifier

// MARK: - PKCS_7_Data.swift
@usableFromInline typealias PKCS_7_Data = ASN1OctetString

// MARK: - PKCS_7_Digest.swift
@usableFromInline typealias PKCS_7_Digest = ASN1OctetString

// MARK: - PKCS_7_DigestAlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_DigestAlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_DigestAlgorithmIdentifiers.swift
@usableFromInline indirect enum PKCS_7_DigestAlgorithmIdentifiers: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case daSet([PKCS_7_DigestAlgorithmIdentifier])
    case daSequence([PKCS_7_DigestAlgorithmIdentifier])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.set:
            self = .daSet(try DER.set(of: PKCS_7_DigestAlgorithmIdentifier.self, identifier: .set, rootNode: rootNode))
        case ASN1Identifier.sequence:
            self = .daSequence(try DER.sequence(of: PKCS_7_DigestAlgorithmIdentifier.self, identifier: .sequence, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .daSet(let daSet): try coder.serializeSetOf(daSet)
        case .daSequence(let daSequence): try coder.serializeSequenceOf(daSequence)

        }
    }

}

// MARK: - PKCS_7_DigestEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_DigestEncryptionAlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_DigestInfo.swift
@usableFromInline struct PKCS_7_DigestInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier
    @usableFromInline var digest: PKCS_7_Digest
    @inlinable init(digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier, digest: PKCS_7_Digest) {
        self.digestAlgorithm = digestAlgorithm
        self.digest = digest

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier = try PKCS_7_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let digest: PKCS_7_Digest = try PKCS_7_Digest(derEncoded: &nodes)

            return PKCS_7_DigestInfo(digestAlgorithm: digestAlgorithm, digest: digest)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(digestAlgorithm)
            try coder.serialize(digest)

        }
    }
}

// MARK: - PKCS_7_DigestedData.swift
@usableFromInline struct PKCS_7_DigestedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_DigestedData_version_IntEnum
    @usableFromInline var digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier
    @usableFromInline var contentInfo: PKCS_7_ContentInfo
    @usableFromInline var digest: PKCS_7_Digest
    @inlinable init(version: PKCS_7_DigestedData_version_IntEnum, digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier, contentInfo: PKCS_7_ContentInfo, digest: PKCS_7_Digest) {
        self.version = version
        self.digestAlgorithm = digestAlgorithm
        self.contentInfo = contentInfo
        self.digest = digest

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_DigestedData_version_IntEnum(rawValue: versionVal)
            let digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier = try PKCS_7_DigestAlgorithmIdentifier(derEncoded: &nodes)
            let contentInfo: PKCS_7_ContentInfo = try PKCS_7_ContentInfo(derEncoded: &nodes)
            let digest: PKCS_7_Digest = try PKCS_7_Digest(derEncoded: &nodes)

            return PKCS_7_DigestedData(version: version, digestAlgorithm: digestAlgorithm, contentInfo: contentInfo, digest: digest)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(digestAlgorithm)
            try coder.serialize(contentInfo)
            try coder.serialize(digest)

        }
    }
}

// MARK: - PKCS_7_DigestedData_version_IntEnum.swift
public struct PKCS_7_DigestedData_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_DigestedData_version_IntEnum, rhs: PKCS_7_DigestedData_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let ddVer0 = Self(rawValue: 0)
}

// MARK: - PKCS_7_EncryptedContent.swift
@usableFromInline typealias PKCS_7_EncryptedContent = ASN1OctetString

// MARK: - PKCS_7_EncryptedContentInfo.swift
@usableFromInline struct PKCS_7_EncryptedContentInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var contentType: ASN1ObjectIdentifier
    @usableFromInline var contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedContent: ASN1OctetString?
    @inlinable init(contentType: ASN1ObjectIdentifier, contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedContent: ASN1OctetString?) {
        self.contentType = contentType
        self.contentEncryptionAlgorithm = contentEncryptionAlgorithm
        self.encryptedContent = encryptedContent

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let contentType: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let contentEncryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedContent: ASN1OctetString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

            return PKCS_7_EncryptedContentInfo(contentType: contentType, contentEncryptionAlgorithm: contentEncryptionAlgorithm, encryptedContent: encryptedContent)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(contentType)
            try coder.serialize(contentEncryptionAlgorithm)
            if let encryptedContent = self.encryptedContent { try coder.serializeOptionalImplicitlyTagged(encryptedContent, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKCS_7_EncryptedData.swift
@usableFromInline struct PKCS_7_EncryptedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_EncryptedData_version_IntEnum
    @usableFromInline var encryptedContentInfo: PKCS_7_EncryptedContentInfo
    @inlinable init(version: PKCS_7_EncryptedData_version_IntEnum, encryptedContentInfo: PKCS_7_EncryptedContentInfo) {
        self.version = version
        self.encryptedContentInfo = encryptedContentInfo

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_EncryptedData_version_IntEnum(rawValue: versionVal)
            let encryptedContentInfo: PKCS_7_EncryptedContentInfo = try PKCS_7_EncryptedContentInfo(derEncoded: &nodes)

            return PKCS_7_EncryptedData(version: version, encryptedContentInfo: encryptedContentInfo)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(encryptedContentInfo)

        }
    }
}

// MARK: - PKCS_7_EncryptedData_version_IntEnum.swift
public struct PKCS_7_EncryptedData_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_EncryptedData_version_IntEnum, rhs: PKCS_7_EncryptedData_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let edVer0 = Self(rawValue: 0)
}

// MARK: - PKCS_7_EncryptedDigest.swift
@usableFromInline typealias PKCS_7_EncryptedDigest = ASN1OctetString

// MARK: - PKCS_7_EncryptedKey.swift
@usableFromInline typealias PKCS_7_EncryptedKey = ASN1OctetString

// MARK: - PKCS_7_EnvelopedData.swift
@usableFromInline struct PKCS_7_EnvelopedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_EnvelopedData_version_IntEnum
    @usableFromInline var recipientInfos: PKCS_7_RecipientInfos
    @usableFromInline var encryptedContentInfo: PKCS_7_EncryptedContentInfo
    @inlinable init(version: PKCS_7_EnvelopedData_version_IntEnum, recipientInfos: PKCS_7_RecipientInfos, encryptedContentInfo: PKCS_7_EncryptedContentInfo) {
        self.version = version
        self.recipientInfos = recipientInfos
        self.encryptedContentInfo = encryptedContentInfo

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_EnvelopedData_version_IntEnum(rawValue: versionVal)
            let recipientInfos: PKCS_7_RecipientInfos = try PKCS_7_RecipientInfos(derEncoded: &nodes)
            let encryptedContentInfo: PKCS_7_EncryptedContentInfo = try PKCS_7_EncryptedContentInfo(derEncoded: &nodes)

            return PKCS_7_EnvelopedData(version: version, recipientInfos: recipientInfos, encryptedContentInfo: encryptedContentInfo)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(recipientInfos)
            try coder.serialize(encryptedContentInfo)

        }
    }
}

// MARK: - PKCS_7_EnvelopedData_version_IntEnum.swift
public struct PKCS_7_EnvelopedData_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_EnvelopedData_version_IntEnum, rhs: PKCS_7_EnvelopedData_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let edVer0 = Self(rawValue: 0)
    public static let edVer1 = Self(rawValue: 1)
}

// MARK: - PKCS_7_ExtendedCertificate.swift
@usableFromInline typealias PKCS_7_ExtendedCertificate = PKCS_7_Certificate

// MARK: - PKCS_7_ExtendedCertificateOrCertificate.swift
@usableFromInline indirect enum PKCS_7_ExtendedCertificateOrCertificate: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certificate(AuthenticationFramework_Certificate)
    case extendedCertificate(PKCS_7_ExtendedCertificate)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case AuthenticationFramework_Certificate.defaultIdentifier:
            self = .certificate(try AuthenticationFramework_Certificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .extendedCertificate(try PKCS_7_ExtendedCertificate(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certificate(let certificate):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(certificate)
                            }
                        } else {
                            try coder.serialize(certificate)
                        }
        case .extendedCertificate(let extendedCertificate): try extendedCertificate.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_ExtendedCertificatesAndCertificates.swift
@usableFromInline struct PKCS_7_ExtendedCertificatesAndCertificates: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [PKCS_7_ExtendedCertificateOrCertificate]
    @inlinable public init(_ value: [PKCS_7_ExtendedCertificateOrCertificate]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: PKCS_7_ExtendedCertificateOrCertificate.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_7_IssuerAndSerialNumber.swift
@usableFromInline struct PKCS_7_IssuerAndSerialNumber: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @inlinable init(issuer: InformationFramework_Name, serialNumber: ArraySlice<UInt8>) {
        self.issuer = issuer
        self.serialNumber = serialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)

            return PKCS_7_IssuerAndSerialNumber(issuer: issuer, serialNumber: serialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuer)
            try coder.serialize(serialNumber)

        }
    }
}

// MARK: - PKCS_7_KeyEncryptionAlgorithmIdentifier.swift
@usableFromInline typealias PKCS_7_KeyEncryptionAlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_7_Name.swift
@usableFromInline typealias PKCS_7_Name = InformationFramework_Name

// MARK: - PKCS_7_RecipientInfo.swift
@usableFromInline struct PKCS_7_RecipientInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_RecipientInfo_version_IntEnum
    @usableFromInline var issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber
    @usableFromInline var keyEncryptionAlgorithm: PKCS_7_KeyEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedKey: PKCS_7_EncryptedKey
    @inlinable init(version: PKCS_7_RecipientInfo_version_IntEnum, issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber, keyEncryptionAlgorithm: PKCS_7_KeyEncryptionAlgorithmIdentifier, encryptedKey: PKCS_7_EncryptedKey) {
        self.version = version
        self.issuerAndSerialNumber = issuerAndSerialNumber
        self.keyEncryptionAlgorithm = keyEncryptionAlgorithm
        self.encryptedKey = encryptedKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_RecipientInfo_version_IntEnum(rawValue: versionVal)
            let issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber = try PKCS_7_IssuerAndSerialNumber(derEncoded: &nodes)
            let keyEncryptionAlgorithm: PKCS_7_KeyEncryptionAlgorithmIdentifier = try PKCS_7_KeyEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedKey: PKCS_7_EncryptedKey = try PKCS_7_EncryptedKey(derEncoded: &nodes)

            return PKCS_7_RecipientInfo(version: version, issuerAndSerialNumber: issuerAndSerialNumber, keyEncryptionAlgorithm: keyEncryptionAlgorithm, encryptedKey: encryptedKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(issuerAndSerialNumber)
            try coder.serialize(keyEncryptionAlgorithm)
            try coder.serialize(encryptedKey)

        }
    }
}

// MARK: - PKCS_7_RecipientInfo_version_IntEnum.swift
public struct PKCS_7_RecipientInfo_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_RecipientInfo_version_IntEnum, rhs: PKCS_7_RecipientInfo_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let riVer0 = Self(rawValue: 0)
}

// MARK: - PKCS_7_RecipientInfos.swift
@usableFromInline indirect enum PKCS_7_RecipientInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case riSet([PKCS_7_RecipientInfo])
    case riSequence([PKCS_7_RecipientInfo])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.set:
            self = .riSet(try DER.set(of: PKCS_7_RecipientInfo.self, identifier: .set, rootNode: rootNode))
        case ASN1Identifier.sequence:
            self = .riSequence(try DER.sequence(of: PKCS_7_RecipientInfo.self, identifier: .sequence, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .riSet(let riSet): try coder.serializeSetOf(riSet)
        case .riSequence(let riSequence): try coder.serializeSequenceOf(riSequence)

        }
    }

}

// MARK: - PKCS_7_SignedAndEnvelopedData.swift
@usableFromInline struct PKCS_7_SignedAndEnvelopedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_SignedAndEnvelopedData_version_IntEnum
    @usableFromInline var recipientInfos: PKCS_7_RecipientInfos
    @usableFromInline var digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers
    @usableFromInline var encryptedContentInfo: PKCS_7_EncryptedContentInfo
    @usableFromInline var certificates: PKCS_7_SignedAndEnvelopedData_certificates_Choice?
    @usableFromInline var crls: PKCS_7_SignedAndEnvelopedData_crls_Choice?
    @usableFromInline var signerInfos: PKCS_7_SignerInfos
    @inlinable init(version: PKCS_7_SignedAndEnvelopedData_version_IntEnum, recipientInfos: PKCS_7_RecipientInfos, digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers, encryptedContentInfo: PKCS_7_EncryptedContentInfo, certificates: PKCS_7_SignedAndEnvelopedData_certificates_Choice?, crls: PKCS_7_SignedAndEnvelopedData_crls_Choice?, signerInfos: PKCS_7_SignerInfos) {
        self.version = version
        self.recipientInfos = recipientInfos
        self.digestAlgorithms = digestAlgorithms
        self.encryptedContentInfo = encryptedContentInfo
        self.certificates = certificates
        self.crls = crls
        self.signerInfos = signerInfos

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_SignedAndEnvelopedData_version_IntEnum(rawValue: versionVal)
            let recipientInfos: PKCS_7_RecipientInfos = try PKCS_7_RecipientInfos(derEncoded: &nodes)
            let digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers = try PKCS_7_DigestAlgorithmIdentifiers(derEncoded: &nodes)
            let encryptedContentInfo: PKCS_7_EncryptedContentInfo = try PKCS_7_EncryptedContentInfo(derEncoded: &nodes)
            var certificates: PKCS_7_SignedAndEnvelopedData_certificates_Choice? = nil
var peek_certificates = nodes
if let next = peek_certificates.next(), next.identifier == PKCS_7_SignedAndEnvelopedData_certificates_Choice.defaultIdentifier {
    certificates = try PKCS_7_SignedAndEnvelopedData_certificates_Choice(derEncoded: &nodes)
}
            var crls: PKCS_7_SignedAndEnvelopedData_crls_Choice? = nil
var peek_crls = nodes
if let next = peek_crls.next(), next.identifier == PKCS_7_SignedAndEnvelopedData_crls_Choice.defaultIdentifier {
    crls = try PKCS_7_SignedAndEnvelopedData_crls_Choice(derEncoded: &nodes)
}
            let signerInfos: PKCS_7_SignerInfos = try PKCS_7_SignerInfos(derEncoded: &nodes)

            return PKCS_7_SignedAndEnvelopedData(version: version, recipientInfos: recipientInfos, digestAlgorithms: digestAlgorithms, encryptedContentInfo: encryptedContentInfo, certificates: certificates, crls: crls, signerInfos: signerInfos)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(recipientInfos)
            try coder.serialize(digestAlgorithms)
            try coder.serialize(encryptedContentInfo)
            if let certificates = self.certificates { try coder.serialize(certificates) }
            if let crls = self.crls { try coder.serialize(crls) }
            try coder.serialize(signerInfos)

        }
    }
}

// MARK: - PKCS_7_SignedAndEnvelopedData_certificates_Choice.swift
@usableFromInline indirect enum PKCS_7_SignedAndEnvelopedData_certificates_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certSet(PKCS_7_ExtendedCertificatesAndCertificates)
    case certSequence(PKCS_7_Certificates)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .certSet(try PKCS_7_ExtendedCertificatesAndCertificates(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .certSequence(try PKCS_7_Certificates(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certSet(let certSet): try certSet.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .certSequence(let certSequence): try certSequence.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_SignedAndEnvelopedData_crls_Choice.swift
@usableFromInline indirect enum PKCS_7_SignedAndEnvelopedData_crls_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case crlSet(PKCS_7_CertificateRevocationLists)
    case crlSequence(PKCS_7_CRLSequence)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .crlSet(try PKCS_7_CertificateRevocationLists(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .crlSequence(try PKCS_7_CRLSequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .crlSet(let crlSet): try crlSet.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .crlSequence(let crlSequence): try crlSequence.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_SignedAndEnvelopedData_version_IntEnum.swift
public struct PKCS_7_SignedAndEnvelopedData_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_SignedAndEnvelopedData_version_IntEnum, rhs: PKCS_7_SignedAndEnvelopedData_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let seVer1 = Self(rawValue: 1)
    public static let seVer2 = Self(rawValue: 2)
}

// MARK: - PKCS_7_SignedData.swift
@usableFromInline struct PKCS_7_SignedData: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_SignedData_version_IntEnum
    @usableFromInline var digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers
    @usableFromInline var contentInfo: PKCS_7_ContentInfo
    @usableFromInline var certificates: PKCS_7_SignedData_certificates_Choice?
    @usableFromInline var crls: PKCS_7_SignedData_crls_Choice?
    @usableFromInline var signerInfos: PKCS_7_SignerInfos
    @inlinable init(version: PKCS_7_SignedData_version_IntEnum, digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers, contentInfo: PKCS_7_ContentInfo, certificates: PKCS_7_SignedData_certificates_Choice?, crls: PKCS_7_SignedData_crls_Choice?, signerInfos: PKCS_7_SignerInfos) {
        self.version = version
        self.digestAlgorithms = digestAlgorithms
        self.contentInfo = contentInfo
        self.certificates = certificates
        self.crls = crls
        self.signerInfos = signerInfos

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_SignedData_version_IntEnum(rawValue: versionVal)
            let digestAlgorithms: PKCS_7_DigestAlgorithmIdentifiers = try PKCS_7_DigestAlgorithmIdentifiers(derEncoded: &nodes)
            let contentInfo: PKCS_7_ContentInfo = try PKCS_7_ContentInfo(derEncoded: &nodes)
            var certificates: PKCS_7_SignedData_certificates_Choice? = nil
var peek_certificates = nodes
if let next = peek_certificates.next(), next.identifier == PKCS_7_SignedData_certificates_Choice.defaultIdentifier {
    certificates = try PKCS_7_SignedData_certificates_Choice(derEncoded: &nodes)
}
            var crls: PKCS_7_SignedData_crls_Choice? = nil
var peek_crls = nodes
if let next = peek_crls.next(), next.identifier == PKCS_7_SignedData_crls_Choice.defaultIdentifier {
    crls = try PKCS_7_SignedData_crls_Choice(derEncoded: &nodes)
}
            let signerInfos: PKCS_7_SignerInfos = try PKCS_7_SignerInfos(derEncoded: &nodes)

            return PKCS_7_SignedData(version: version, digestAlgorithms: digestAlgorithms, contentInfo: contentInfo, certificates: certificates, crls: crls, signerInfos: signerInfos)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(digestAlgorithms)
            try coder.serialize(contentInfo)
            if let certificates = self.certificates { try coder.serialize(certificates) }
            if let crls = self.crls { try coder.serialize(crls) }
            try coder.serialize(signerInfos)

        }
    }
}

// MARK: - PKCS_7_SignedData_certificates_Choice.swift
@usableFromInline indirect enum PKCS_7_SignedData_certificates_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case certSet(PKCS_7_ExtendedCertificatesAndCertificates)
    case certSequence(PKCS_7_Certificates)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .certSet(try PKCS_7_ExtendedCertificatesAndCertificates(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .certSequence(try PKCS_7_Certificates(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .certSet(let certSet): try certSet.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .certSequence(let certSequence): try certSequence.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_SignedData_crls_Choice.swift
@usableFromInline indirect enum PKCS_7_SignedData_crls_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case crlSet(PKCS_7_CertificateRevocationLists)
    case crlSequence(PKCS_7_CRLSequence)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .crlSet(try PKCS_7_CertificateRevocationLists(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .crlSequence(try PKCS_7_CRLSequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .crlSet(let crlSet): try crlSet.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .crlSequence(let crlSequence): try crlSequence.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_SignedData_version_IntEnum.swift
public struct PKCS_7_SignedData_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_SignedData_version_IntEnum, rhs: PKCS_7_SignedData_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let sdVer1 = Self(rawValue: 1)
    public static let sdVer2 = Self(rawValue: 2)
}

// MARK: - PKCS_7_SignerInfo.swift
@usableFromInline struct PKCS_7_SignerInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_7_SignerInfo_version_IntEnum
    @usableFromInline var issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber
    @usableFromInline var digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier
    @usableFromInline var authenticatedAttributes: PKCS_7_SignerInfo_authenticatedAttributes_Choice?
    @usableFromInline var digestEncryptionAlgorithm: PKCS_7_DigestEncryptionAlgorithmIdentifier
    @usableFromInline var encryptedDigest: PKCS_7_EncryptedDigest
    @usableFromInline var unauthenticatedAttributes: PKCS_7_SignerInfo_unauthenticatedAttributes_Choice?
    @inlinable init(version: PKCS_7_SignerInfo_version_IntEnum, issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber, digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier, authenticatedAttributes: PKCS_7_SignerInfo_authenticatedAttributes_Choice?, digestEncryptionAlgorithm: PKCS_7_DigestEncryptionAlgorithmIdentifier, encryptedDigest: PKCS_7_EncryptedDigest, unauthenticatedAttributes: PKCS_7_SignerInfo_unauthenticatedAttributes_Choice?) {
        self.version = version
        self.issuerAndSerialNumber = issuerAndSerialNumber
        self.digestAlgorithm = digestAlgorithm
        self.authenticatedAttributes = authenticatedAttributes
        self.digestEncryptionAlgorithm = digestEncryptionAlgorithm
        self.encryptedDigest = encryptedDigest
        self.unauthenticatedAttributes = unauthenticatedAttributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let versionVal = try Int(derEncoded: &nodes)
            let version = PKCS_7_SignerInfo_version_IntEnum(rawValue: versionVal)
            let issuerAndSerialNumber: PKCS_7_IssuerAndSerialNumber = try PKCS_7_IssuerAndSerialNumber(derEncoded: &nodes)
            let digestAlgorithm: PKCS_7_DigestAlgorithmIdentifier = try PKCS_7_DigestAlgorithmIdentifier(derEncoded: &nodes)
            var authenticatedAttributes: PKCS_7_SignerInfo_authenticatedAttributes_Choice? = nil
var peek_authenticatedAttributes = nodes
if let next = peek_authenticatedAttributes.next(), next.identifier == PKCS_7_SignerInfo_authenticatedAttributes_Choice.defaultIdentifier {
    authenticatedAttributes = try PKCS_7_SignerInfo_authenticatedAttributes_Choice(derEncoded: &nodes)
}
            let digestEncryptionAlgorithm: PKCS_7_DigestEncryptionAlgorithmIdentifier = try PKCS_7_DigestEncryptionAlgorithmIdentifier(derEncoded: &nodes)
            let encryptedDigest: PKCS_7_EncryptedDigest = try PKCS_7_EncryptedDigest(derEncoded: &nodes)
            var unauthenticatedAttributes: PKCS_7_SignerInfo_unauthenticatedAttributes_Choice? = nil
var peek_unauthenticatedAttributes = nodes
if let next = peek_unauthenticatedAttributes.next(), next.identifier == PKCS_7_SignerInfo_unauthenticatedAttributes_Choice.defaultIdentifier {
    unauthenticatedAttributes = try PKCS_7_SignerInfo_unauthenticatedAttributes_Choice(derEncoded: &nodes)
}

            return PKCS_7_SignerInfo(version: version, issuerAndSerialNumber: issuerAndSerialNumber, digestAlgorithm: digestAlgorithm, authenticatedAttributes: authenticatedAttributes, digestEncryptionAlgorithm: digestEncryptionAlgorithm, encryptedDigest: encryptedDigest, unauthenticatedAttributes: unauthenticatedAttributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try version.serialize(into: &coder, withIdentifier: .integer)
            try coder.serialize(issuerAndSerialNumber)
            try coder.serialize(digestAlgorithm)
            if let authenticatedAttributes = self.authenticatedAttributes { try coder.serialize(authenticatedAttributes) }
            try coder.serialize(digestEncryptionAlgorithm)
            try coder.serialize(encryptedDigest)
            if let unauthenticatedAttributes = self.unauthenticatedAttributes { try coder.serialize(unauthenticatedAttributes) }

        }
    }
}

// MARK: - PKCS_7_SignerInfo_authenticatedAttributes_Choice.swift
@usableFromInline indirect enum PKCS_7_SignerInfo_authenticatedAttributes_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case aaSet([PKCS_7_Attribute])
    case aaSequence([PKCS_7_Attribute])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .aaSet(try DER.set(of: PKCS_7_Attribute.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .aaSequence(try DER.sequence(of: PKCS_7_Attribute.self, identifier: rootNode.identifier, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .aaSet(let aaSet): try coder.serializeSetOf(aaSet, identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .aaSequence(let aaSequence): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try coder.serializeSequenceOf(aaSequence) }

        }
    }

}

// MARK: - PKCS_7_SignerInfo_unauthenticatedAttributes_Choice.swift
@usableFromInline indirect enum PKCS_7_SignerInfo_unauthenticatedAttributes_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case uaSet([PKCS_7_Attribute])
    case uaSequence([PKCS_7_Attribute])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .uaSet(try DER.set(of: PKCS_7_Attribute.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .uaSequence(try DER.sequence(of: PKCS_7_Attribute.self, identifier: rootNode.identifier, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .uaSet(let uaSet): try coder.serializeSetOf(uaSet, identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .uaSequence(let uaSequence): try coder.serializeSequenceOf(uaSequence, identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKCS_7_SignerInfo_version_IntEnum.swift
public struct PKCS_7_SignerInfo_version_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_7_SignerInfo_version_IntEnum, rhs: PKCS_7_SignerInfo_version_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let siVer1 = Self(rawValue: 1)
    public static let siVer2 = Self(rawValue: 2)
}

// MARK: - PKCS_7_SignerInfos.swift
@usableFromInline indirect enum PKCS_7_SignerInfos: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case siSet([PKCS_7_SignerInfo])
    case siSequence([PKCS_7_SignerInfo])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.set:
            self = .siSet(try DER.set(of: PKCS_7_SignerInfo.self, identifier: .set, rootNode: rootNode))
        case ASN1Identifier.sequence:
            self = .siSequence(try DER.sequence(of: PKCS_7_SignerInfo.self, identifier: .sequence, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .siSet(let siSet): try coder.serializeSetOf(siSet)
        case .siSequence(let siSequence): try coder.serializeSequenceOf(siSequence)

        }
    }

}

// MARK: - PKCS_7_data_oid.swift
public let PKCS_7_data: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [1]

// MARK: - PKCS_7_digestedData_oid.swift
public let PKCS_7_digestedData: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [5]

// MARK: - PKCS_7_encryptedData_oid.swift
public let PKCS_7_encryptedData: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [6]

// MARK: - PKCS_7_envelopedData_oid.swift
public let PKCS_7_envelopedData: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [3]

// MARK: - PKCS_7_pkcs_7_oid.swift
public let PKCS_7_pkcs_7: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 7]

// MARK: - PKCS_7_signedAndEnvelopedData_oid.swift
public let PKCS_7_signedAndEnvelopedData: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [4]

// MARK: - PKCS_7_signedData_oid.swift
public let PKCS_7_signedData: ASN1ObjectIdentifier = PKCS_7_pkcs_7 + [2]

// MARK: - PKCS_8_AlgorithmIdentifier.swift
@usableFromInline typealias PKCS_8_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKCS_8_Attributes.swift
@usableFromInline struct PKCS_8_Attributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [PKCS_7_Attribute]
    @inlinable public init(_ value: [PKCS_7_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: PKCS_7_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKCS_8_EncryptedData.swift
@usableFromInline typealias PKCS_8_EncryptedData = ASN1OctetString

// MARK: - PKCS_8_EncryptedPrivateKeyInfo.swift
@usableFromInline struct PKCS_8_EncryptedPrivateKeyInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var encryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var encryptedData: PKCS_8_EncryptedData
    @inlinable init(encryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier, encryptedData: PKCS_8_EncryptedData) {
        self.encryptionAlgorithm = encryptionAlgorithm
        self.encryptedData = encryptedData

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let encryptionAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let encryptedData: PKCS_8_EncryptedData = try PKCS_8_EncryptedData(derEncoded: &nodes)

            return PKCS_8_EncryptedPrivateKeyInfo(encryptionAlgorithm: encryptionAlgorithm, encryptedData: encryptedData)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(encryptionAlgorithm)
            try coder.serialize(encryptedData)

        }
    }
}

// MARK: - PKCS_8_PrivateKey.swift
@usableFromInline typealias PKCS_8_PrivateKey = ASN1OctetString

// MARK: - PKCS_8_PrivateKeyInfo.swift
@usableFromInline struct PKCS_8_PrivateKeyInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKCS_8_Version
    @usableFromInline var privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var privateKey: PKCS_8_PrivateKey
    @usableFromInline var attributes: PKCS_8_Attributes?
    @inlinable init(version: PKCS_8_Version, privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier, privateKey: PKCS_8_PrivateKey, attributes: PKCS_8_Attributes?) {
        self.version = version
        self.privateKeyAlgorithm = privateKeyAlgorithm
        self.privateKey = privateKey
        self.attributes = attributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: PKCS_8_Version = try PKCS_8_Version(derEncoded: &nodes)
            let privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let privateKey: PKCS_8_PrivateKey = try PKCS_8_PrivateKey(derEncoded: &nodes)
            let attributes: PKCS_8_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

            return PKCS_8_PrivateKeyInfo(version: version, privateKeyAlgorithm: privateKeyAlgorithm, privateKey: privateKey, attributes: attributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(privateKeyAlgorithm)
            try coder.serialize(privateKey)
            if let attributes = self.attributes { try coder.serializeOptionalImplicitlyTagged(attributes, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKCS_8_Version.swift
public struct PKCS_8_Version : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKCS_8_Version, rhs: PKCS_8_Version) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v1 = Self(rawValue: 0)
}

// MARK: - PKIX1Explicit88_AdministrationDomainName.swift
@usableFromInline indirect enum PKIX1Explicit88_AdministrationDomainName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case numeric(ASN1PrintableString)
    case printable(ASN1PrintableString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1PrintableString.defaultIdentifier:
            self = .numeric(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printable(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .numeric(let numeric):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(numeric)
                            }
                        } else {
                            try coder.serialize(numeric)
                        }
        case .printable(let printable):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printable)
                            }
                        } else {
                            try coder.serialize(printable)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_AlgorithmIdentifier.swift
@usableFromInline struct PKIX1Explicit88_AlgorithmIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any?) {
        self.algorithm = algorithm
        self.parameters = parameters

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let parameters: ASN1Any? = nodes.next().map { ASN1Any(derEncoded: $0) }

            return PKIX1Explicit88_AlgorithmIdentifier(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = self.parameters { try coder.serialize(parameters) }

        }
    }
}

// MARK: - PKIX1Explicit88_Attribute.swift
@usableFromInline struct PKIX1Explicit88_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var values: [ASN1Any]
    @inlinable init(type: ASN1ObjectIdentifier, values: [ASN1Any]) {
        self.type = type
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let values: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return PKIX1Explicit88_Attribute(type: type, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serializeSetOf(values)

        }
    }
}

// MARK: - PKIX1Explicit88_AttributeType.swift
@usableFromInline typealias PKIX1Explicit88_AttributeType = ASN1ObjectIdentifier

// MARK: - PKIX1Explicit88_AttributeTypeAndValue.swift
@usableFromInline struct PKIX1Explicit88_AttributeTypeAndValue: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: PKIX1Explicit88_AttributeType
    @usableFromInline var value: PKIX1Explicit88_AttributeValue
    @inlinable init(type: PKIX1Explicit88_AttributeType, value: PKIX1Explicit88_AttributeValue) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: PKIX1Explicit88_AttributeType = try PKIX1Explicit88_AttributeType(derEncoded: &nodes)
            let value: PKIX1Explicit88_AttributeValue = try PKIX1Explicit88_AttributeValue(derEncoded: &nodes)

            return PKIX1Explicit88_AttributeTypeAndValue(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)

        }
    }
}

// MARK: - PKIX1Explicit88_AttributeValue.swift
@usableFromInline typealias PKIX1Explicit88_AttributeValue = ASN1Any

// MARK: - PKIX1Explicit88_BuiltInDomainDefinedAttribute.swift
@usableFromInline struct PKIX1Explicit88_BuiltInDomainDefinedAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1PrintableString
    @usableFromInline var value: ASN1PrintableString
    @inlinable init(type: ASN1PrintableString, value: ASN1PrintableString) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1PrintableString = try ASN1PrintableString(derEncoded: &nodes)
            let value: ASN1PrintableString = try ASN1PrintableString(derEncoded: &nodes)

            return PKIX1Explicit88_BuiltInDomainDefinedAttribute(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)

        }
    }
}

// MARK: - PKIX1Explicit88_BuiltInDomainDefinedAttributes.swift
@usableFromInline struct PKIX1Explicit88_BuiltInDomainDefinedAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_BuiltInDomainDefinedAttribute]
    @inlinable public init(_ value: [PKIX1Explicit88_BuiltInDomainDefinedAttribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_BuiltInDomainDefinedAttribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_BuiltInStandardAttributes.swift
@usableFromInline struct PKIX1Explicit88_BuiltInStandardAttributes: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var country_name: PKIX1Explicit88_CountryName?
    @usableFromInline var administration_domain_name: PKIX1Explicit88_AdministrationDomainName?
    @usableFromInline var network_address: PKIX1Explicit88_NetworkAddress?
    @usableFromInline var terminal_identifier: PKIX1Explicit88_TerminalIdentifier?
    @usableFromInline var private_domain_name: PKIX1Explicit88_PrivateDomainName?
    @usableFromInline var organization_name: PKIX1Explicit88_OrganizationName?
    @usableFromInline var numeric_user_identifier: PKIX1Explicit88_NumericUserIdentifier?
    @usableFromInline var personal_name: PKIX1Explicit88_PersonalName?
    @usableFromInline var organizational_unit_names: PKIX1Explicit88_OrganizationalUnitNames?
    @inlinable init(country_name: PKIX1Explicit88_CountryName?, administration_domain_name: PKIX1Explicit88_AdministrationDomainName?, network_address: PKIX1Explicit88_NetworkAddress?, terminal_identifier: PKIX1Explicit88_TerminalIdentifier?, private_domain_name: PKIX1Explicit88_PrivateDomainName?, organization_name: PKIX1Explicit88_OrganizationName?, numeric_user_identifier: PKIX1Explicit88_NumericUserIdentifier?, personal_name: PKIX1Explicit88_PersonalName?, organizational_unit_names: PKIX1Explicit88_OrganizationalUnitNames?) {
        self.country_name = country_name
        self.administration_domain_name = administration_domain_name
        self.network_address = network_address
        self.terminal_identifier = terminal_identifier
        self.private_domain_name = private_domain_name
        self.organization_name = organization_name
        self.numeric_user_identifier = numeric_user_identifier
        self.personal_name = personal_name
        self.organizational_unit_names = organizational_unit_names

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var country_name: PKIX1Explicit88_CountryName? = nil
var peek_country_name = nodes
if let next = peek_country_name.next(), next.identifier == PKIX1Explicit88_CountryName.defaultIdentifier {
    country_name = try PKIX1Explicit88_CountryName(derEncoded: &nodes)
}
            var administration_domain_name: PKIX1Explicit88_AdministrationDomainName? = nil
var peek_administration_domain_name = nodes
if let next = peek_administration_domain_name.next(), next.identifier == PKIX1Explicit88_AdministrationDomainName.defaultIdentifier {
    administration_domain_name = try PKIX1Explicit88_AdministrationDomainName(derEncoded: &nodes)
}
            let network_address: PKIX1Explicit88_NetworkAddress? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let terminal_identifier: PKIX1Explicit88_TerminalIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let private_domain_name: PKIX1Explicit88_PrivateDomainName? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try PKIX1Explicit88_PrivateDomainName(derEncoded: node) }
            let organization_name: PKIX1Explicit88_OrganizationName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
            let numeric_user_identifier: PKIX1Explicit88_NumericUserIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
            let personal_name: PKIX1Explicit88_PersonalName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific))
            let organizational_unit_names: PKIX1Explicit88_OrganizationalUnitNames? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific))

            return PKIX1Explicit88_BuiltInStandardAttributes(country_name: country_name, administration_domain_name: administration_domain_name, network_address: network_address, terminal_identifier: terminal_identifier, private_domain_name: private_domain_name, organization_name: organization_name, numeric_user_identifier: numeric_user_identifier, personal_name: personal_name, organizational_unit_names: organizational_unit_names)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let country_name = self.country_name { try coder.serialize(country_name) }
            if let administration_domain_name = self.administration_domain_name { try coder.serialize(administration_domain_name) }
            if let network_address = self.network_address { try coder.serializeOptionalImplicitlyTagged(network_address, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let terminal_identifier = self.terminal_identifier { try coder.serializeOptionalImplicitlyTagged(terminal_identifier, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let private_domain_name = self.private_domain_name { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(private_domain_name) } }
            if let organization_name = self.organization_name { try coder.serializeOptionalImplicitlyTagged(organization_name, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }
            if let numeric_user_identifier = self.numeric_user_identifier { try coder.serializeOptionalImplicitlyTagged(numeric_user_identifier, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) }
            if let personal_name = self.personal_name { try coder.serializeOptionalImplicitlyTagged(personal_name, withIdentifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific)) }
            if let organizational_unit_names = self.organizational_unit_names { try coder.serializeOptionalImplicitlyTagged(organizational_unit_names, withIdentifier: ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Explicit88_Certificate.swift
@usableFromInline struct PKIX1Explicit88_Certificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var tbsCertificate: PKIX1Explicit88_TBSCertificate
    @usableFromInline var signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var signature: ASN1BitString
    @inlinable init(tbsCertificate: PKIX1Explicit88_TBSCertificate, signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier, signature: ASN1BitString) {
        self.tbsCertificate = tbsCertificate
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let tbsCertificate: PKIX1Explicit88_TBSCertificate = try PKIX1Explicit88_TBSCertificate(derEncoded: &nodes)
            let signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let signature: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIX1Explicit88_Certificate(tbsCertificate: tbsCertificate, signatureAlgorithm: signatureAlgorithm, signature: signature)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(tbsCertificate)
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)

        }
    }
}

// MARK: - PKIX1Explicit88_CertificateList.swift
@usableFromInline struct PKIX1Explicit88_CertificateList: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var tbsCertList: PKIX1Explicit88_TBSCertList
    @usableFromInline var signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var signature: ASN1BitString
    @inlinable init(tbsCertList: PKIX1Explicit88_TBSCertList, signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier, signature: ASN1BitString) {
        self.tbsCertList = tbsCertList
        self.signatureAlgorithm = signatureAlgorithm
        self.signature = signature

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let tbsCertList: PKIX1Explicit88_TBSCertList = try PKIX1Explicit88_TBSCertList(derEncoded: &nodes)
            let signatureAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let signature: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIX1Explicit88_CertificateList(tbsCertList: tbsCertList, signatureAlgorithm: signatureAlgorithm, signature: signature)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(tbsCertList)
            try coder.serialize(signatureAlgorithm)
            try coder.serialize(signature)

        }
    }
}

// MARK: - PKIX1Explicit88_CertificateSerialNumber.swift
@usableFromInline typealias PKIX1Explicit88_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - PKIX1Explicit88_CommonName.swift
@usableFromInline typealias PKIX1Explicit88_CommonName = ASN1PrintableString

// MARK: - PKIX1Explicit88_CountryName.swift
@usableFromInline indirect enum PKIX1Explicit88_CountryName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case x121_dcc_code(ASN1PrintableString)
    case iso_3166_alpha2_code(ASN1PrintableString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1PrintableString.defaultIdentifier:
            self = .x121_dcc_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .iso_3166_alpha2_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .x121_dcc_code(let x121_dcc_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(x121_dcc_code)
                            }
                        } else {
                            try coder.serialize(x121_dcc_code)
                        }
        case .iso_3166_alpha2_code(let iso_3166_alpha2_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(iso_3166_alpha2_code)
                            }
                        } else {
                            try coder.serialize(iso_3166_alpha2_code)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_DirectoryString.swift
@usableFromInline indirect enum PKIX1Explicit88_DirectoryString: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case bmpString(ASN1BMPString)
    case universalString(ASN1UniversalString)
    case uTF8String(ASN1UTF8String)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .uTF8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .uTF8String(let uTF8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(uTF8String)
                            }
                        } else {
                            try coder.serialize(uTF8String)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_DistinguishedName.swift
@usableFromInline typealias PKIX1Explicit88_DistinguishedName = PKIX1Explicit88_RDNSequence

// MARK: - PKIX1Explicit88_DomainComponent.swift
@usableFromInline typealias PKIX1Explicit88_DomainComponent = ASN1IA5String

// MARK: - PKIX1Explicit88_EmailAddress.swift
@usableFromInline typealias PKIX1Explicit88_EmailAddress = ASN1IA5String

// MARK: - PKIX1Explicit88_ExtendedNetworkAddress.swift
@usableFromInline indirect enum PKIX1Explicit88_ExtendedNetworkAddress: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case e163_4_address(PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence)
    case psap_address(PKIX1Explicit88_PresentationAddress)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence.defaultIdentifier:
            self = .e163_4_address(try PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .psap_address(try PKIX1Explicit88_PresentationAddress(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .e163_4_address(let e163_4_address):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(e163_4_address)
                            }
                        } else {
                            try coder.serialize(e163_4_address)
                        }
        case .psap_address(let psap_address): try psap_address.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence.swift
@usableFromInline struct PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var number: ASN1PrintableString
    @usableFromInline var sub_address: ASN1PrintableString?
    @inlinable init(number: ASN1PrintableString, sub_address: ASN1PrintableString?) {
        self.number = number
        self.sub_address = sub_address

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let number: ASN1PrintableString = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)))!
            let sub_address: ASN1PrintableString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Explicit88_ExtendedNetworkAddress_e163_4_address_Sequence(number: number, sub_address: sub_address)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serializeOptionalImplicitlyTagged(number, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            if let sub_address = self.sub_address { try coder.serializeOptionalImplicitlyTagged(sub_address, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Explicit88_Extension.swift
@usableFromInline struct PKIX1Explicit88_Extension: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extnID: ASN1ObjectIdentifier
    @usableFromInline var critical: Bool?
    @usableFromInline var extnValue: ASN1OctetString
    @inlinable init(extnID: ASN1ObjectIdentifier, critical: Bool?, extnValue: ASN1OctetString) {
        self.extnID = extnID
        self.critical = critical
        self.extnValue = extnValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extnID: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let critical: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            let extnValue: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)

            return PKIX1Explicit88_Extension(extnID: extnID, critical: critical, extnValue: extnValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(extnID)
            if let critical = self.critical { try coder.serialize(critical) }
            try coder.serialize(extnValue)

        }
    }
}

// MARK: - PKIX1Explicit88_ExtensionAttribute.swift
@usableFromInline struct PKIX1Explicit88_ExtensionAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extension_attribute_type: ArraySlice<UInt8>
    @usableFromInline var extension_attribute_value: ASN1Any
    @inlinable init(extension_attribute_type: ArraySlice<UInt8>, extension_attribute_value: ASN1Any) {
        self.extension_attribute_type = extension_attribute_type
        self.extension_attribute_value = extension_attribute_value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extension_attribute_type: ArraySlice<UInt8> = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)))!
            let extension_attribute_value: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKIX1Explicit88_ExtensionAttribute(extension_attribute_type: extension_attribute_type, extension_attribute_value: extension_attribute_value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serializeOptionalImplicitlyTagged(extension_attribute_type, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(extension_attribute_value) }

        }
    }
}

// MARK: - PKIX1Explicit88_ExtensionAttributes.swift
@usableFromInline struct PKIX1Explicit88_ExtensionAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [PKIX1Explicit88_ExtensionAttribute]
    @inlinable public init(_ value: [PKIX1Explicit88_ExtensionAttribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: PKIX1Explicit88_ExtensionAttribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_ExtensionORAddressComponents.swift
@usableFromInline typealias PKIX1Explicit88_ExtensionORAddressComponents = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_ExtensionPhysicalDeliveryAddressComponents.swift
@usableFromInline typealias PKIX1Explicit88_ExtensionPhysicalDeliveryAddressComponents = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_Extensions.swift
@usableFromInline typealias PKIX1Explicit88_Extensions = AuthenticationFramework_Extensions

// MARK: - PKIX1Explicit88_LocalPostalAttributes.swift
@usableFromInline typealias PKIX1Explicit88_LocalPostalAttributes = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_Name.swift
@usableFromInline typealias PKIX1Explicit88_Name = InformationFramework_Name

// MARK: - PKIX1Explicit88_NetworkAddress.swift
@usableFromInline typealias PKIX1Explicit88_NetworkAddress = PKIX1Explicit88_X121Address

// MARK: - PKIX1Explicit88_NumericUserIdentifier.swift
@usableFromInline typealias PKIX1Explicit88_NumericUserIdentifier = ASN1PrintableString

// MARK: - PKIX1Explicit88_ORAddress.swift
@usableFromInline struct PKIX1Explicit88_ORAddress: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var built_in_standard_attributes: PKIX1Explicit88_BuiltInStandardAttributes
    @usableFromInline var built_in_domain_defined_attributes: PKIX1Explicit88_BuiltInDomainDefinedAttributes?
    @usableFromInline var extension_attributes: PKIX1Explicit88_ExtensionAttributes?
    @inlinable init(built_in_standard_attributes: PKIX1Explicit88_BuiltInStandardAttributes, built_in_domain_defined_attributes: PKIX1Explicit88_BuiltInDomainDefinedAttributes?, extension_attributes: PKIX1Explicit88_ExtensionAttributes?) {
        self.built_in_standard_attributes = built_in_standard_attributes
        self.built_in_domain_defined_attributes = built_in_domain_defined_attributes
        self.extension_attributes = extension_attributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let built_in_standard_attributes: PKIX1Explicit88_BuiltInStandardAttributes = try PKIX1Explicit88_BuiltInStandardAttributes(derEncoded: &nodes)
            var built_in_domain_defined_attributes: PKIX1Explicit88_BuiltInDomainDefinedAttributes? = nil
var peek_built_in_domain_defined_attributes = nodes
if let next = peek_built_in_domain_defined_attributes.next(), next.identifier == PKIX1Explicit88_BuiltInDomainDefinedAttributes.defaultIdentifier {
    built_in_domain_defined_attributes = try PKIX1Explicit88_BuiltInDomainDefinedAttributes(derEncoded: &nodes)
}
            var extension_attributes: PKIX1Explicit88_ExtensionAttributes? = nil
var peek_extension_attributes = nodes
if let next = peek_extension_attributes.next(), next.identifier == PKIX1Explicit88_ExtensionAttributes.defaultIdentifier {
    extension_attributes = try PKIX1Explicit88_ExtensionAttributes(derEncoded: &nodes)
}

            return PKIX1Explicit88_ORAddress(built_in_standard_attributes: built_in_standard_attributes, built_in_domain_defined_attributes: built_in_domain_defined_attributes, extension_attributes: extension_attributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(built_in_standard_attributes)
            if let built_in_domain_defined_attributes = self.built_in_domain_defined_attributes { try coder.serialize(built_in_domain_defined_attributes) }
            if let extension_attributes = self.extension_attributes { try coder.serialize(extension_attributes) }

        }
    }
}

// MARK: - PKIX1Explicit88_OrganizationName.swift
@usableFromInline typealias PKIX1Explicit88_OrganizationName = ASN1PrintableString

// MARK: - PKIX1Explicit88_OrganizationalUnitName.swift
@usableFromInline typealias PKIX1Explicit88_OrganizationalUnitName = ASN1PrintableString

// MARK: - PKIX1Explicit88_OrganizationalUnitNames.swift
@usableFromInline struct PKIX1Explicit88_OrganizationalUnitNames: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_OrganizationalUnitName]
    @inlinable public init(_ value: [PKIX1Explicit88_OrganizationalUnitName]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_OrganizationalUnitName.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_PDSName.swift
@usableFromInline typealias PKIX1Explicit88_PDSName = ASN1PrintableString

// MARK: - PKIX1Explicit88_PDSParameter.swift
@usableFromInline struct PKIX1Explicit88_PDSParameter: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var printable_string: ASN1PrintableString?
    @usableFromInline var teletex_string: ASN1TeletexString?
    @inlinable init(printable_string: ASN1PrintableString?, teletex_string: ASN1TeletexString?) {
        self.printable_string = printable_string
        self.teletex_string = teletex_string

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.set(root, identifier: identifier) { nodes in
            var printable_string: ASN1PrintableString? = nil
var peek_printable_string = nodes
if let next = peek_printable_string.next(), next.identifier == ASN1PrintableString.defaultIdentifier {
    printable_string = try ASN1PrintableString(derEncoded: &nodes)
}
            var teletex_string: ASN1TeletexString? = nil
var peek_teletex_string = nodes
if let next = peek_teletex_string.next(), next.identifier == ASN1TeletexString.defaultIdentifier {
    teletex_string = try ASN1TeletexString(derEncoded: &nodes)
}

            return PKIX1Explicit88_PDSParameter(printable_string: printable_string, teletex_string: teletex_string)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let printable_string = self.printable_string { try coder.serialize(printable_string) }
            if let teletex_string = self.teletex_string { try coder.serialize(teletex_string) }

        }
    }
}

// MARK: - PKIX1Explicit88_PersonalName.swift
@usableFromInline struct PKIX1Explicit88_PersonalName: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var surname: ASN1PrintableString
    @usableFromInline var given_name: ASN1PrintableString?
    @usableFromInline var initials: ASN1PrintableString?
    @usableFromInline var generation_qualifier: ASN1PrintableString?
    @inlinable init(surname: ASN1PrintableString, given_name: ASN1PrintableString?, initials: ASN1PrintableString?, generation_qualifier: ASN1PrintableString?) {
        self.surname = surname
        self.given_name = given_name
        self.initials = initials
        self.generation_qualifier = generation_qualifier

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.set(root, identifier: identifier) { nodes in
            let surname: ASN1PrintableString = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)))!
            let given_name: ASN1PrintableString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let initials: ASN1PrintableString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let generation_qualifier: ASN1PrintableString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

            return PKIX1Explicit88_PersonalName(surname: surname, given_name: given_name, initials: initials, generation_qualifier: generation_qualifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serializeOptionalImplicitlyTagged(surname, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            if let given_name = self.given_name { try coder.serializeOptionalImplicitlyTagged(given_name, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let initials = self.initials { try coder.serializeOptionalImplicitlyTagged(initials, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let generation_qualifier = self.generation_qualifier { try coder.serializeOptionalImplicitlyTagged(generation_qualifier, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Explicit88_PhysicalDeliveryCountryName.swift
@usableFromInline indirect enum PKIX1Explicit88_PhysicalDeliveryCountryName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case x121_dcc_code(ASN1PrintableString)
    case iso_3166_alpha2_code(ASN1PrintableString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1PrintableString.defaultIdentifier:
            self = .x121_dcc_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .iso_3166_alpha2_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .x121_dcc_code(let x121_dcc_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(x121_dcc_code)
                            }
                        } else {
                            try coder.serialize(x121_dcc_code)
                        }
        case .iso_3166_alpha2_code(let iso_3166_alpha2_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(iso_3166_alpha2_code)
                            }
                        } else {
                            try coder.serialize(iso_3166_alpha2_code)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_PhysicalDeliveryOfficeName.swift
@usableFromInline typealias PKIX1Explicit88_PhysicalDeliveryOfficeName = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PhysicalDeliveryOfficeNumber.swift
@usableFromInline typealias PKIX1Explicit88_PhysicalDeliveryOfficeNumber = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PhysicalDeliveryOrganizationName.swift
@usableFromInline typealias PKIX1Explicit88_PhysicalDeliveryOrganizationName = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PhysicalDeliveryPersonalName.swift
@usableFromInline typealias PKIX1Explicit88_PhysicalDeliveryPersonalName = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PostOfficeBoxAddress.swift
@usableFromInline typealias PKIX1Explicit88_PostOfficeBoxAddress = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PostalCode.swift
@usableFromInline indirect enum PKIX1Explicit88_PostalCode: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case numeric_code(ASN1PrintableString)
    case printable_code(ASN1PrintableString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1PrintableString.defaultIdentifier:
            self = .numeric_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printable_code(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .numeric_code(let numeric_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(numeric_code)
                            }
                        } else {
                            try coder.serialize(numeric_code)
                        }
        case .printable_code(let printable_code):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printable_code)
                            }
                        } else {
                            try coder.serialize(printable_code)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_PosteRestanteAddress.swift
@usableFromInline typealias PKIX1Explicit88_PosteRestanteAddress = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_PresentationAddress.swift
@usableFromInline struct PKIX1Explicit88_PresentationAddress: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var pSelector: ASN1OctetString?
    @usableFromInline var sSelector: ASN1OctetString?
    @usableFromInline var tSelector: ASN1OctetString?
    @usableFromInline var nAddresses: [ASN1OctetString]
    @inlinable init(pSelector: ASN1OctetString?, sSelector: ASN1OctetString?, tSelector: ASN1OctetString?, nAddresses: [ASN1OctetString]) {
        self.pSelector = pSelector
        self.sSelector = sSelector
        self.tSelector = tSelector
        self.nAddresses = nAddresses

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let pSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let sSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let tSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let nAddresses: [ASN1OctetString] = try DER.explicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in try DER.set(of: ASN1OctetString.self, identifier: .set, rootNode: node) }

            return PKIX1Explicit88_PresentationAddress(pSelector: pSelector, sSelector: sSelector, tSelector: tSelector, nAddresses: nAddresses)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let pSelector = self.pSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(pSelector) } }
            if let sSelector = self.sSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(sSelector) } }
            if let tSelector = self.tSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(tSelector) } }
            try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(nAddresses) }

        }
    }
}

// MARK: - PKIX1Explicit88_PrivateDomainName.swift
@usableFromInline indirect enum PKIX1Explicit88_PrivateDomainName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case numeric(ASN1PrintableString)
    case printable(ASN1PrintableString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1PrintableString.defaultIdentifier:
            self = .numeric(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printable(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .numeric(let numeric):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(numeric)
                            }
                        } else {
                            try coder.serialize(numeric)
                        }
        case .printable(let printable):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printable)
                            }
                        } else {
                            try coder.serialize(printable)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_RDNSequence.swift
@usableFromInline struct PKIX1Explicit88_RDNSequence: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_RelativeDistinguishedName]
    @inlinable public init(_ value: [PKIX1Explicit88_RelativeDistinguishedName]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_RelativeDistinguishedName.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_RelativeDistinguishedName.swift
@usableFromInline struct PKIX1Explicit88_RelativeDistinguishedName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [PKIX1Explicit88_AttributeTypeAndValue]
    @inlinable public init(_ value: [PKIX1Explicit88_AttributeTypeAndValue]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: PKIX1Explicit88_AttributeTypeAndValue.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_StreetAddress.swift
@usableFromInline typealias PKIX1Explicit88_StreetAddress = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_SubjectPublicKeyInfo.swift
@usableFromInline struct PKIX1Explicit88_SubjectPublicKeyInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var subjectPublicKey: ASN1BitString
    @inlinable init(algorithm: AuthenticationFramework_AlgorithmIdentifier, subjectPublicKey: ASN1BitString) {
        self.algorithm = algorithm
        self.subjectPublicKey = subjectPublicKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let subjectPublicKey: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIX1Explicit88_SubjectPublicKeyInfo(algorithm: algorithm, subjectPublicKey: subjectPublicKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            try coder.serialize(subjectPublicKey)

        }
    }
}

// MARK: - PKIX1Explicit88_TBSCertList.swift
@usableFromInline struct PKIX1Explicit88_TBSCertList: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKIX1Explicit88_Version?
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var thisUpdate: PKIX1Explicit88_Time
    @usableFromInline var nextUpdate: PKIX1Explicit88_Time?
    @usableFromInline var revokedCertificates: [PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence]?
    @usableFromInline var crlExtensions: AuthenticationFramework_Extensions?
    @inlinable init(version: PKIX1Explicit88_Version?, signature: AuthenticationFramework_AlgorithmIdentifier, issuer: InformationFramework_Name, thisUpdate: PKIX1Explicit88_Time, nextUpdate: PKIX1Explicit88_Time?, revokedCertificates: [PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence]?, crlExtensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.signature = signature
        self.issuer = issuer
        self.thisUpdate = thisUpdate
        self.nextUpdate = nextUpdate
        self.revokedCertificates = revokedCertificates
        self.crlExtensions = crlExtensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var version: PKIX1Explicit88_Version? = nil
var peek_version = nodes
if let next = peek_version.next(), next.identifier == PKIX1Explicit88_Version.defaultIdentifier {
    version = try PKIX1Explicit88_Version(derEncoded: &nodes)
}
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let thisUpdate: PKIX1Explicit88_Time = try PKIX1Explicit88_Time(derEncoded: &nodes)
            var nextUpdate: PKIX1Explicit88_Time? = nil
var peek_nextUpdate = nodes
if let next = peek_nextUpdate.next(), next.identifier == PKIX1Explicit88_Time.defaultIdentifier {
    nextUpdate = try PKIX1Explicit88_Time(derEncoded: &nodes)
}
            let revokedCertificates: [PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence]? = try DER.sequence(of: PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence.self, identifier: .sequence, nodes: &nodes)
            let crlExtensions: AuthenticationFramework_Extensions? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Extensions(derEncoded: node) }

            return PKIX1Explicit88_TBSCertList(version: version, signature: signature, issuer: issuer, thisUpdate: thisUpdate, nextUpdate: nextUpdate, revokedCertificates: revokedCertificates, crlExtensions: crlExtensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(version) }
            try coder.serialize(signature)
            try coder.serialize(issuer)
            try coder.serialize(thisUpdate)
            if let nextUpdate = self.nextUpdate { try coder.serialize(nextUpdate) }
            if let revokedCertificates = self.revokedCertificates { try coder.serializeSequenceOf(revokedCertificates) }
            if let crlExtensions = self.crlExtensions { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(crlExtensions) } }

        }
    }
}

// MARK: - PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence.swift
@usableFromInline struct PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var userCertificate: ArraySlice<UInt8>
    @usableFromInline var revocationDate: PKIX1Explicit88_Time
    @usableFromInline var crlEntryExtensions: AuthenticationFramework_Extensions?
    @inlinable init(userCertificate: ArraySlice<UInt8>, revocationDate: PKIX1Explicit88_Time, crlEntryExtensions: AuthenticationFramework_Extensions?) {
        self.userCertificate = userCertificate
        self.revocationDate = revocationDate
        self.crlEntryExtensions = crlEntryExtensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let userCertificate: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let revocationDate: PKIX1Explicit88_Time = try PKIX1Explicit88_Time(derEncoded: &nodes)
            var crlEntryExtensions: AuthenticationFramework_Extensions? = nil
var peek_crlEntryExtensions = nodes
if let next = peek_crlEntryExtensions.next(), next.identifier == AuthenticationFramework_Extensions.defaultIdentifier {
    crlEntryExtensions = try AuthenticationFramework_Extensions(derEncoded: &nodes)
}

            return PKIX1Explicit88_TBSCertList_revokedCertificates_Sequence(userCertificate: userCertificate, revocationDate: revocationDate, crlEntryExtensions: crlEntryExtensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(userCertificate)
            try coder.serialize(revocationDate)
            if let crlEntryExtensions = self.crlEntryExtensions { try coder.serialize(crlEntryExtensions) }

        }
    }
}

// MARK: - PKIX1Explicit88_TBSCertificate.swift
@usableFromInline struct PKIX1Explicit88_TBSCertificate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKIX1Explicit88_Version?
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @usableFromInline var signature: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var issuer: InformationFramework_Name
    @usableFromInline var validity: PKIX1Explicit88_Validity
    @usableFromInline var subject: InformationFramework_Name
    @usableFromInline var subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo
    @usableFromInline var issuerUniqueID: PKIX1Explicit88_UniqueIdentifier?
    @usableFromInline var subjectUniqueID: PKIX1Explicit88_UniqueIdentifier?
    @usableFromInline var extensions: AuthenticationFramework_Extensions?
    @inlinable init(version: PKIX1Explicit88_Version?, serialNumber: ArraySlice<UInt8>, signature: AuthenticationFramework_AlgorithmIdentifier, issuer: InformationFramework_Name, validity: PKIX1Explicit88_Validity, subject: InformationFramework_Name, subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo, issuerUniqueID: PKIX1Explicit88_UniqueIdentifier?, subjectUniqueID: PKIX1Explicit88_UniqueIdentifier?, extensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.serialNumber = serialNumber
        self.signature = signature
        self.issuer = issuer
        self.validity = validity
        self.subject = subject
        self.subjectPublicKeyInfo = subjectPublicKeyInfo
        self.issuerUniqueID = issuerUniqueID
        self.subjectUniqueID = subjectUniqueID
        self.extensions = extensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: PKIX1Explicit88_Version? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try PKIX1Explicit88_Version(derEncoded: node) }
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let signature: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let issuer: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let validity: PKIX1Explicit88_Validity = try PKIX1Explicit88_Validity(derEncoded: &nodes)
            let subject: InformationFramework_Name = try InformationFramework_Name(derEncoded: &nodes)
            let subjectPublicKeyInfo: AuthenticationFramework_SubjectPublicKeyInfo = try AuthenticationFramework_SubjectPublicKeyInfo(derEncoded: &nodes)
            let issuerUniqueID: PKIX1Explicit88_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let subjectUniqueID: PKIX1Explicit88_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let extensions: AuthenticationFramework_Extensions? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in return try AuthenticationFramework_Extensions(derEncoded: node) }

            return PKIX1Explicit88_TBSCertificate(version: version, serialNumber: serialNumber, signature: signature, issuer: issuer, validity: validity, subject: subject, subjectPublicKeyInfo: subjectPublicKeyInfo, issuerUniqueID: issuerUniqueID, subjectUniqueID: subjectUniqueID, extensions: extensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(version) } }
            try coder.serialize(serialNumber)
            try coder.serialize(signature)
            try coder.serialize(issuer)
            try coder.serialize(validity)
            try coder.serialize(subject)
            try coder.serialize(subjectPublicKeyInfo)
            if let issuerUniqueID = self.issuerUniqueID { try coder.serializeOptionalImplicitlyTagged(issuerUniqueID, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let subjectUniqueID = self.subjectUniqueID { try coder.serializeOptionalImplicitlyTagged(subjectUniqueID, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let extensions = self.extensions { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serialize(extensions) } }

        }
    }
}

// MARK: - PKIX1Explicit88_TeletexCommonName.swift
@usableFromInline typealias PKIX1Explicit88_TeletexCommonName = ASN1TeletexString

// MARK: - PKIX1Explicit88_TeletexDomainDefinedAttribute.swift
@usableFromInline struct PKIX1Explicit88_TeletexDomainDefinedAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1TeletexString
    @usableFromInline var value: ASN1TeletexString
    @inlinable init(type: ASN1TeletexString, value: ASN1TeletexString) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1TeletexString = try ASN1TeletexString(derEncoded: &nodes)
            let value: ASN1TeletexString = try ASN1TeletexString(derEncoded: &nodes)

            return PKIX1Explicit88_TeletexDomainDefinedAttribute(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)

        }
    }
}

// MARK: - PKIX1Explicit88_TeletexDomainDefinedAttributes.swift
@usableFromInline struct PKIX1Explicit88_TeletexDomainDefinedAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_TeletexDomainDefinedAttribute]
    @inlinable public init(_ value: [PKIX1Explicit88_TeletexDomainDefinedAttribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_TeletexDomainDefinedAttribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_TeletexOrganizationName.swift
@usableFromInline typealias PKIX1Explicit88_TeletexOrganizationName = ASN1TeletexString

// MARK: - PKIX1Explicit88_TeletexOrganizationalUnitName.swift
@usableFromInline typealias PKIX1Explicit88_TeletexOrganizationalUnitName = ASN1TeletexString

// MARK: - PKIX1Explicit88_TeletexOrganizationalUnitNames.swift
@usableFromInline struct PKIX1Explicit88_TeletexOrganizationalUnitNames: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_TeletexOrganizationalUnitName]
    @inlinable public init(_ value: [PKIX1Explicit88_TeletexOrganizationalUnitName]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_TeletexOrganizationalUnitName.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Explicit88_TeletexPersonalName.swift
@usableFromInline struct PKIX1Explicit88_TeletexPersonalName: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var surname: ASN1TeletexString
    @usableFromInline var given_name: ASN1TeletexString?
    @usableFromInline var initials: ASN1TeletexString?
    @usableFromInline var generation_qualifier: ASN1TeletexString?
    @inlinable init(surname: ASN1TeletexString, given_name: ASN1TeletexString?, initials: ASN1TeletexString?, generation_qualifier: ASN1TeletexString?) {
        self.surname = surname
        self.given_name = given_name
        self.initials = initials
        self.generation_qualifier = generation_qualifier

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.set(root, identifier: identifier) { nodes in
            let surname: ASN1TeletexString = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)))!
            let given_name: ASN1TeletexString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let initials: ASN1TeletexString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let generation_qualifier: ASN1TeletexString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

            return PKIX1Explicit88_TeletexPersonalName(surname: surname, given_name: given_name, initials: initials, generation_qualifier: generation_qualifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serializeOptionalImplicitlyTagged(surname, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            if let given_name = self.given_name { try coder.serializeOptionalImplicitlyTagged(given_name, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let initials = self.initials { try coder.serializeOptionalImplicitlyTagged(initials, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let generation_qualifier = self.generation_qualifier { try coder.serializeOptionalImplicitlyTagged(generation_qualifier, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Explicit88_TerminalIdentifier.swift
@usableFromInline typealias PKIX1Explicit88_TerminalIdentifier = ASN1PrintableString

// MARK: - PKIX1Explicit88_TerminalType.swift
public struct PKIX1Explicit88_TerminalType : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKIX1Explicit88_TerminalType, rhs: PKIX1Explicit88_TerminalType) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let telex = Self(rawValue: 3)
    public static let teletex = Self(rawValue: 4)
    public static let g3_facsimile = Self(rawValue: 5)
    public static let g4_facsimile = Self(rawValue: 6)
    public static let ia5_terminal = Self(rawValue: 7)
    public static let videotex = Self(rawValue: 8)
}

// MARK: - PKIX1Explicit88_Time.swift
@usableFromInline indirect enum PKIX1Explicit88_Time: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case utcTime(UTCTime)
    case generalTime(GeneralizedTime)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case UTCTime.defaultIdentifier:
            self = .utcTime(try UTCTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case GeneralizedTime.defaultIdentifier:
            self = .generalTime(try GeneralizedTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .utcTime(let utcTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utcTime)
                            }
                        } else {
                            try coder.serialize(utcTime)
                        }
        case .generalTime(let generalTime):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(generalTime)
                            }
                        } else {
                            try coder.serialize(generalTime)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_UnformattedPostalAddress.swift
@usableFromInline struct PKIX1Explicit88_UnformattedPostalAddress: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var printable_address: [ASN1PrintableString]?
    @usableFromInline var teletex_string: ASN1TeletexString?
    @inlinable init(printable_address: [ASN1PrintableString]?, teletex_string: ASN1TeletexString?) {
        self.printable_address = printable_address
        self.teletex_string = teletex_string

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.set(root, identifier: identifier) { nodes in
            let printable_address: [ASN1PrintableString]? = try DER.sequence(of: ASN1PrintableString.self, identifier: .sequence, nodes: &nodes)
            var teletex_string: ASN1TeletexString? = nil
var peek_teletex_string = nodes
if let next = peek_teletex_string.next(), next.identifier == ASN1TeletexString.defaultIdentifier {
    teletex_string = try ASN1TeletexString(derEncoded: &nodes)
}

            return PKIX1Explicit88_UnformattedPostalAddress(printable_address: printable_address, teletex_string: teletex_string)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let printable_address = self.printable_address { try coder.serializeSequenceOf(printable_address) }
            if let teletex_string = self.teletex_string { try coder.serialize(teletex_string) }

        }
    }
}

// MARK: - PKIX1Explicit88_UniqueIdentifier.swift
@usableFromInline typealias PKIX1Explicit88_UniqueIdentifier = ASN1BitString

// MARK: - PKIX1Explicit88_UniquePostalName.swift
@usableFromInline typealias PKIX1Explicit88_UniquePostalName = PKIX1Explicit88_PDSParameter

// MARK: - PKIX1Explicit88_Validity.swift
@usableFromInline struct PKIX1Explicit88_Validity: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBefore: PKIX1Explicit88_Time
    @usableFromInline var notAfter: PKIX1Explicit88_Time
    @inlinable init(notBefore: PKIX1Explicit88_Time, notAfter: PKIX1Explicit88_Time) {
        self.notBefore = notBefore
        self.notAfter = notAfter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBefore: PKIX1Explicit88_Time = try PKIX1Explicit88_Time(derEncoded: &nodes)
            let notAfter: PKIX1Explicit88_Time = try PKIX1Explicit88_Time(derEncoded: &nodes)

            return PKIX1Explicit88_Validity(notBefore: notBefore, notAfter: notAfter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(notBefore)
            try coder.serialize(notAfter)

        }
    }
}

// MARK: - PKIX1Explicit88_Version.swift
public struct PKIX1Explicit88_Version : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKIX1Explicit88_Version, rhs: PKIX1Explicit88_Version) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let v1 = Self(rawValue: 0)
    public static let v2 = Self(rawValue: 1)
    public static let v3 = Self(rawValue: 2)
}

// MARK: - PKIX1Explicit88_X121Address.swift
@usableFromInline typealias PKIX1Explicit88_X121Address = ASN1PrintableString

// MARK: - PKIX1Explicit88_X520CommonName.swift
@usableFromInline indirect enum PKIX1Explicit88_X520CommonName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520LocalityName.swift
@usableFromInline indirect enum PKIX1Explicit88_X520LocalityName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520OrganizationName.swift
@usableFromInline indirect enum PKIX1Explicit88_X520OrganizationName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520OrganizationalUnitName.swift
@usableFromInline indirect enum PKIX1Explicit88_X520OrganizationalUnitName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520Pseudonym.swift
@usableFromInline indirect enum PKIX1Explicit88_X520Pseudonym: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520SerialNumber.swift
@usableFromInline typealias PKIX1Explicit88_X520SerialNumber = ASN1PrintableString

// MARK: - PKIX1Explicit88_X520StateOrProvinceName.swift
@usableFromInline indirect enum PKIX1Explicit88_X520StateOrProvinceName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520Title.swift
@usableFromInline indirect enum PKIX1Explicit88_X520Title: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_X520countryName.swift
@usableFromInline typealias PKIX1Explicit88_X520countryName = ASN1PrintableString

// MARK: - PKIX1Explicit88_X520dnQualifier.swift
@usableFromInline typealias PKIX1Explicit88_X520dnQualifier = ASN1PrintableString

// MARK: - PKIX1Explicit88_X520name.swift
@usableFromInline indirect enum PKIX1Explicit88_X520name: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case universalString(ASN1UniversalString)
    case utf8String(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }

        }
    }

}

// MARK: - PKIX1Explicit88_common_name.swift
public let PKIX1Explicit88_common_name: Int = 1

// MARK: - PKIX1Explicit88_extended_network_address.swift
public let PKIX1Explicit88_extended_network_address: Int = 22

// MARK: - PKIX1Explicit88_extension_OR_address_components.swift
public let PKIX1Explicit88_extension_OR_address_components: Int = 12

// MARK: - PKIX1Explicit88_extension_physical_delivery_address_components.swift
public let PKIX1Explicit88_extension_physical_delivery_address_components: Int = 15

// MARK: - PKIX1Explicit88_id_ad_caIssuers_oid.swift
public let PKIX1Explicit88_id_ad_caIssuers: ASN1ObjectIdentifier = PKIX1Explicit88_id_ad + [2]

// MARK: - PKIX1Explicit88_id_ad_caRepository_oid.swift
public let PKIX1Explicit88_id_ad_caRepository: ASN1ObjectIdentifier = PKIX1Explicit88_id_ad + [5]

// MARK: - PKIX1Explicit88_id_ad_ocsp_oid.swift
public let PKIX1Explicit88_id_ad_ocsp: ASN1ObjectIdentifier = PKIX1Explicit88_id_ad + [1]

// MARK: - PKIX1Explicit88_id_ad_oid.swift
public let PKIX1Explicit88_id_ad: ASN1ObjectIdentifier = PKIX1Explicit88_id_pkix + [48]

// MARK: - PKIX1Explicit88_id_ad_timeStamping_oid.swift
public let PKIX1Explicit88_id_ad_timeStamping: ASN1ObjectIdentifier = PKIX1Explicit88_id_ad + [3]

// MARK: - PKIX1Explicit88_id_at_commonName_oid.swift
public let PKIX1Explicit88_id_at_commonName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [3]

// MARK: - PKIX1Explicit88_id_at_countryName_oid.swift
public let PKIX1Explicit88_id_at_countryName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [6]

// MARK: - PKIX1Explicit88_id_at_dnQualifier_oid.swift
public let PKIX1Explicit88_id_at_dnQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [46]

// MARK: - PKIX1Explicit88_id_at_generationQualifier_oid.swift
public let PKIX1Explicit88_id_at_generationQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [44]

// MARK: - PKIX1Explicit88_id_at_givenName_oid.swift
public let PKIX1Explicit88_id_at_givenName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [42]

// MARK: - PKIX1Explicit88_id_at_initials_oid.swift
public let PKIX1Explicit88_id_at_initials: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [43]

// MARK: - PKIX1Explicit88_id_at_localityName_oid.swift
public let PKIX1Explicit88_id_at_localityName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [7]

// MARK: - PKIX1Explicit88_id_at_name_oid.swift
public let PKIX1Explicit88_id_at_name: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [41]

// MARK: - PKIX1Explicit88_id_at_oid.swift
public let PKIX1Explicit88_id_at: ASN1ObjectIdentifier = [2, 5, 4]

// MARK: - PKIX1Explicit88_id_at_organizationName_oid.swift
public let PKIX1Explicit88_id_at_organizationName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [10]

// MARK: - PKIX1Explicit88_id_at_organizationalUnitName_oid.swift
public let PKIX1Explicit88_id_at_organizationalUnitName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [11]

// MARK: - PKIX1Explicit88_id_at_pseudonym_oid.swift
public let PKIX1Explicit88_id_at_pseudonym: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [65]

// MARK: - PKIX1Explicit88_id_at_serialNumber_oid.swift
public let PKIX1Explicit88_id_at_serialNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [5]

// MARK: - PKIX1Explicit88_id_at_stateOrProvinceName_oid.swift
public let PKIX1Explicit88_id_at_stateOrProvinceName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [8]

// MARK: - PKIX1Explicit88_id_at_surname_oid.swift
public let PKIX1Explicit88_id_at_surname: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [4]

// MARK: - PKIX1Explicit88_id_at_title_oid.swift
public let PKIX1Explicit88_id_at_title: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [12]

// MARK: - PKIX1Explicit88_id_domainComponent_oid.swift
public let PKIX1Explicit88_id_domainComponent: ASN1ObjectIdentifier = [0, 9, 2342, 19200300, 100, 1, 25]

// MARK: - PKIX1Explicit88_id_emailAddress_oid.swift
public let PKIX1Explicit88_id_emailAddress: ASN1ObjectIdentifier = PKIX1Explicit88_pkcs_9 + [1]

// MARK: - PKIX1Explicit88_id_kp_oid.swift
public let PKIX1Explicit88_id_kp: ASN1ObjectIdentifier = PKIX1Explicit88_id_pkix + [3]

// MARK: - PKIX1Explicit88_id_pe_oid.swift
public let PKIX1Explicit88_id_pe: ASN1ObjectIdentifier = PKIX1Explicit88_id_pkix + [1]

// MARK: - PKIX1Explicit88_id_pkix_oid.swift
public let PKIX1Explicit88_id_pkix: ASN1ObjectIdentifier = [1, 3, 6, 1, 5, 5, 7]

// MARK: - PKIX1Explicit88_id_qt_cps_oid.swift
public let PKIX1Explicit88_id_qt_cps: ASN1ObjectIdentifier = PKIX1Explicit88_id_qt + [1]

// MARK: - PKIX1Explicit88_id_qt_oid.swift
public let PKIX1Explicit88_id_qt: ASN1ObjectIdentifier = PKIX1Explicit88_id_pkix + [2]

// MARK: - PKIX1Explicit88_id_qt_unotice_oid.swift
public let PKIX1Explicit88_id_qt_unotice: ASN1ObjectIdentifier = PKIX1Explicit88_id_qt + [2]

// MARK: - PKIX1Explicit88_local_postal_attributes.swift
public let PKIX1Explicit88_local_postal_attributes: Int = 21

// MARK: - PKIX1Explicit88_pds_name.swift
public let PKIX1Explicit88_pds_name: Int = 7

// MARK: - PKIX1Explicit88_physical_delivery_country_name.swift
public let PKIX1Explicit88_physical_delivery_country_name: Int = 8

// MARK: - PKIX1Explicit88_physical_delivery_office_name.swift
public let PKIX1Explicit88_physical_delivery_office_name: Int = 10

// MARK: - PKIX1Explicit88_physical_delivery_office_number.swift
public let PKIX1Explicit88_physical_delivery_office_number: Int = 11

// MARK: - PKIX1Explicit88_physical_delivery_organization_name.swift
public let PKIX1Explicit88_physical_delivery_organization_name: Int = 14

// MARK: - PKIX1Explicit88_physical_delivery_personal_name.swift
public let PKIX1Explicit88_physical_delivery_personal_name: Int = 13

// MARK: - PKIX1Explicit88_pkcs_9_oid.swift
public let PKIX1Explicit88_pkcs_9: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9]

// MARK: - PKIX1Explicit88_post_office_box_address.swift
public let PKIX1Explicit88_post_office_box_address: Int = 18

// MARK: - PKIX1Explicit88_postal_code.swift
public let PKIX1Explicit88_postal_code: Int = 9

// MARK: - PKIX1Explicit88_poste_restante_address.swift
public let PKIX1Explicit88_poste_restante_address: Int = 19

// MARK: - PKIX1Explicit88_street_address.swift
public let PKIX1Explicit88_street_address: Int = 17

// MARK: - PKIX1Explicit88_teletex_common_name.swift
public let PKIX1Explicit88_teletex_common_name: Int = 2

// MARK: - PKIX1Explicit88_teletex_domain_defined_attributes.swift
public let PKIX1Explicit88_teletex_domain_defined_attributes: Int = 6

// MARK: - PKIX1Explicit88_teletex_organization_name.swift
public let PKIX1Explicit88_teletex_organization_name: Int = 3

// MARK: - PKIX1Explicit88_teletex_organizational_unit_names.swift
public let PKIX1Explicit88_teletex_organizational_unit_names: Int = 5

// MARK: - PKIX1Explicit88_teletex_personal_name.swift
public let PKIX1Explicit88_teletex_personal_name: Int = 4

// MARK: - PKIX1Explicit88_terminal_type.swift
public let PKIX1Explicit88_terminal_type: Int = 23

// MARK: - PKIX1Explicit88_ub_common_name.swift
public let PKIX1Explicit88_ub_common_name: Int = 64

// MARK: - PKIX1Explicit88_ub_common_name_length.swift
public let PKIX1Explicit88_ub_common_name_length: Int = 64

// MARK: - PKIX1Explicit88_ub_country_name_alpha_length.swift
public let PKIX1Explicit88_ub_country_name_alpha_length: Int = 2

// MARK: - PKIX1Explicit88_ub_country_name_numeric_length.swift
public let PKIX1Explicit88_ub_country_name_numeric_length: Int = 3

// MARK: - PKIX1Explicit88_ub_domain_defined_attribute_type_length.swift
public let PKIX1Explicit88_ub_domain_defined_attribute_type_length: Int = 8

// MARK: - PKIX1Explicit88_ub_domain_defined_attribute_value_length.swift
public let PKIX1Explicit88_ub_domain_defined_attribute_value_length: Int = 128

// MARK: - PKIX1Explicit88_ub_domain_defined_attributes.swift
public let PKIX1Explicit88_ub_domain_defined_attributes: Int = 4

// MARK: - PKIX1Explicit88_ub_domain_name_length.swift
public let PKIX1Explicit88_ub_domain_name_length: Int = 16

// MARK: - PKIX1Explicit88_ub_e163_4_number_length.swift
public let PKIX1Explicit88_ub_e163_4_number_length: Int = 15

// MARK: - PKIX1Explicit88_ub_e163_4_sub_address_length.swift
public let PKIX1Explicit88_ub_e163_4_sub_address_length: Int = 40

// MARK: - PKIX1Explicit88_ub_emailaddress_length.swift
public let PKIX1Explicit88_ub_emailaddress_length: Int = 255

// MARK: - PKIX1Explicit88_ub_extension_attributes.swift
public let PKIX1Explicit88_ub_extension_attributes: Int = 256

// MARK: - PKIX1Explicit88_ub_generation_qualifier_length.swift
public let PKIX1Explicit88_ub_generation_qualifier_length: Int = 3

// MARK: - PKIX1Explicit88_ub_given_name_length.swift
public let PKIX1Explicit88_ub_given_name_length: Int = 16

// MARK: - PKIX1Explicit88_ub_initials_length.swift
public let PKIX1Explicit88_ub_initials_length: Int = 5

// MARK: - PKIX1Explicit88_ub_integer_options.swift
public let PKIX1Explicit88_ub_integer_options: Int = 256

// MARK: - PKIX1Explicit88_ub_locality_name.swift
public let PKIX1Explicit88_ub_locality_name: Int = 128

// MARK: - PKIX1Explicit88_ub_match.swift
public let PKIX1Explicit88_ub_match: Int = 128

// MARK: - PKIX1Explicit88_ub_name.swift
public let PKIX1Explicit88_ub_name: Int = 32768

// MARK: - PKIX1Explicit88_ub_numeric_user_id_length.swift
public let PKIX1Explicit88_ub_numeric_user_id_length: Int = 32

// MARK: - PKIX1Explicit88_ub_organization_name.swift
public let PKIX1Explicit88_ub_organization_name: Int = 64

// MARK: - PKIX1Explicit88_ub_organization_name_length.swift
public let PKIX1Explicit88_ub_organization_name_length: Int = 64

// MARK: - PKIX1Explicit88_ub_organizational_unit_name.swift
public let PKIX1Explicit88_ub_organizational_unit_name: Int = 64

// MARK: - PKIX1Explicit88_ub_organizational_unit_name_length.swift
public let PKIX1Explicit88_ub_organizational_unit_name_length: Int = 32

// MARK: - PKIX1Explicit88_ub_organizational_units.swift
public let PKIX1Explicit88_ub_organizational_units: Int = 4

// MARK: - PKIX1Explicit88_ub_pds_name_length.swift
public let PKIX1Explicit88_ub_pds_name_length: Int = 16

// MARK: - PKIX1Explicit88_ub_pds_parameter_length.swift
public let PKIX1Explicit88_ub_pds_parameter_length: Int = 30

// MARK: - PKIX1Explicit88_ub_pds_physical_address_lines.swift
public let PKIX1Explicit88_ub_pds_physical_address_lines: Int = 6

// MARK: - PKIX1Explicit88_ub_postal_code_length.swift
public let PKIX1Explicit88_ub_postal_code_length: Int = 16

// MARK: - PKIX1Explicit88_ub_pseudonym.swift
public let PKIX1Explicit88_ub_pseudonym: Int = 128

// MARK: - PKIX1Explicit88_ub_serial_number.swift
public let PKIX1Explicit88_ub_serial_number: Int = 64

// MARK: - PKIX1Explicit88_ub_state_name.swift
public let PKIX1Explicit88_ub_state_name: Int = 128

// MARK: - PKIX1Explicit88_ub_surname_length.swift
public let PKIX1Explicit88_ub_surname_length: Int = 40

// MARK: - PKIX1Explicit88_ub_terminal_id_length.swift
public let PKIX1Explicit88_ub_terminal_id_length: Int = 24

// MARK: - PKIX1Explicit88_ub_title.swift
public let PKIX1Explicit88_ub_title: Int = 64

// MARK: - PKIX1Explicit88_ub_unformatted_address_length.swift
public let PKIX1Explicit88_ub_unformatted_address_length: Int = 180

// MARK: - PKIX1Explicit88_ub_x121_address_length.swift
public let PKIX1Explicit88_ub_x121_address_length: Int = 16

// MARK: - PKIX1Explicit88_unformatted_postal_address.swift
public let PKIX1Explicit88_unformatted_postal_address: Int = 16

// MARK: - PKIX1Explicit88_unique_postal_name.swift
public let PKIX1Explicit88_unique_postal_name: Int = 20

// MARK: - PKIX1Implicit88_AccessDescription.swift
@usableFromInline struct PKIX1Implicit88_AccessDescription: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var accessMethod: ASN1ObjectIdentifier
    @usableFromInline var accessLocation: PKIX1Implicit88_GeneralName
    @inlinable init(accessMethod: ASN1ObjectIdentifier, accessLocation: PKIX1Implicit88_GeneralName) {
        self.accessMethod = accessMethod
        self.accessLocation = accessLocation

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let accessMethod: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let accessLocation: PKIX1Implicit88_GeneralName = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)

            return PKIX1Implicit88_AccessDescription(accessMethod: accessMethod, accessLocation: accessLocation)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(accessMethod)
            try coder.serialize(accessLocation)

        }
    }
}

// MARK: - PKIX1Implicit88_AnotherName.swift
@usableFromInline struct PKIX1Implicit88_AnotherName: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type_id: ASN1ObjectIdentifier
    @usableFromInline var value: ASN1Any
    @inlinable init(type_id: ASN1ObjectIdentifier, value: ASN1Any) {
        self.type_id = type_id
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type_id: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let value: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKIX1Implicit88_AnotherName(type_id: type_id, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type_id)
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(value) }

        }
    }
}

// MARK: - PKIX1Implicit88_AuthorityInfoAccessSyntax.swift
@usableFromInline struct PKIX1Implicit88_AuthorityInfoAccessSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_AccessDescription]
    @inlinable public init(_ value: [PKIX1Implicit88_AccessDescription]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_AccessDescription.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_AuthorityKeyIdentifier.swift
@usableFromInline struct PKIX1Implicit88_AuthorityKeyIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyIdentifier: PKIX1Implicit88_KeyIdentifier?
    @usableFromInline var authorityCertIssuer: PKIX1Implicit88_GeneralNames?
    @usableFromInline var authorityCertSerialNumber: ArraySlice<UInt8>?
    @inlinable init(keyIdentifier: PKIX1Implicit88_KeyIdentifier?, authorityCertIssuer: PKIX1Implicit88_GeneralNames?, authorityCertSerialNumber: ArraySlice<UInt8>?) {
        self.keyIdentifier = keyIdentifier
        self.authorityCertIssuer = authorityCertIssuer
        self.authorityCertSerialNumber = authorityCertSerialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyIdentifier: PKIX1Implicit88_KeyIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let authorityCertIssuer: PKIX1Implicit88_GeneralNames? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let authorityCertSerialNumber: ArraySlice<UInt8>? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

            return PKIX1Implicit88_AuthorityKeyIdentifier(keyIdentifier: keyIdentifier, authorityCertIssuer: authorityCertIssuer, authorityCertSerialNumber: authorityCertSerialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let keyIdentifier = self.keyIdentifier { try coder.serializeOptionalImplicitlyTagged(keyIdentifier, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let authorityCertIssuer = self.authorityCertIssuer { try coder.serializeOptionalImplicitlyTagged(authorityCertIssuer, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let authorityCertSerialNumber = self.authorityCertSerialNumber { try coder.serializeOptionalImplicitlyTagged(authorityCertSerialNumber, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_BaseCRLNumber.swift
@usableFromInline typealias PKIX1Implicit88_BaseCRLNumber = PKIX1Implicit88_CRLNumber

// MARK: - PKIX1Implicit88_BaseDistance.swift
@usableFromInline typealias PKIX1Implicit88_BaseDistance = Int

// MARK: - PKIX1Implicit88_BasicConstraints.swift
@usableFromInline struct PKIX1Implicit88_BasicConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var cA: Bool?
    @usableFromInline var pathLenConstraint: ArraySlice<UInt8>?
    @inlinable init(cA: Bool?, pathLenConstraint: ArraySlice<UInt8>?) {
        self.cA = cA
        self.pathLenConstraint = pathLenConstraint

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let cA: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            var pathLenConstraint: ArraySlice<UInt8>? = nil
var peek_pathLenConstraint = nodes
if let next = peek_pathLenConstraint.next(), next.identifier == ArraySlice<UInt8>.defaultIdentifier {
    pathLenConstraint = try ArraySlice<UInt8>(derEncoded: &nodes)
}

            return PKIX1Implicit88_BasicConstraints(cA: cA, pathLenConstraint: pathLenConstraint)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let cA = self.cA { try coder.serialize(cA) }
            if let pathLenConstraint = self.pathLenConstraint { try coder.serialize(pathLenConstraint) }

        }
    }
}

// MARK: - PKIX1Implicit88_CPSuri.swift
@usableFromInline typealias PKIX1Implicit88_CPSuri = ASN1IA5String

// MARK: - PKIX1Implicit88_CRLDistributionPoints.swift
@usableFromInline struct PKIX1Implicit88_CRLDistributionPoints: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_DistributionPoint]
    @inlinable public init(_ value: [PKIX1Implicit88_DistributionPoint]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_DistributionPoint.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_CRLNumber.swift
@usableFromInline typealias PKIX1Implicit88_CRLNumber = Int

// MARK: - PKIX1Implicit88_CRLReason.swift
public struct PKIX1Implicit88_CRLReason: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let unspecified = Self(rawValue: 0)
    static let keyCompromise = Self(rawValue: 1)
    static let cACompromise = Self(rawValue: 2)
    static let affiliationChanged = Self(rawValue: 3)
    static let superseded = Self(rawValue: 4)
    static let cessationOfOperation = Self(rawValue: 5)
    static let certificateHold = Self(rawValue: 6)
    static let removeFromCRL = Self(rawValue: 8)
    static let privilegeWithdrawn = Self(rawValue: 9)
    static let aACompromise = Self(rawValue: 10)
}

// MARK: - PKIX1Implicit88_CertPolicyId.swift
@usableFromInline typealias PKIX1Implicit88_CertPolicyId = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit88_CertificateIssuer.swift
@usableFromInline typealias PKIX1Implicit88_CertificateIssuer = PKIX1Implicit_2009_GeneralNames

// MARK: - PKIX1Implicit88_CertificatePolicies.swift
@usableFromInline struct PKIX1Implicit88_CertificatePolicies: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_PolicyInformation]
    @inlinable public init(_ value: [PKIX1Implicit88_PolicyInformation]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_PolicyInformation.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_CertificateSerialNumber.swift
@usableFromInline typealias PKIX1Implicit88_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - PKIX1Implicit88_DisplayText.swift
@usableFromInline indirect enum PKIX1Implicit88_DisplayText: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case ia5String(ASN1IA5String)
    case visibleString(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    case utf8String(ASN1UTF8String)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1IA5String.defaultIdentifier:
            self = .ia5String(try ASN1IA5String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .visibleString(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .ia5String(let ia5String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(ia5String)
                            }
                        } else {
                            try coder.serialize(ia5String)
                        }
        case .visibleString(let visibleString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(visibleString)
                            }
                        } else {
                            try coder.serialize(visibleString)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }

        }
    }

}

// MARK: - PKIX1Implicit88_DistributionPoint.swift
@usableFromInline struct PKIX1Implicit88_DistributionPoint: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var distributionPoint: PKIX1Implicit88_DistributionPointName?
    @usableFromInline var reasons: PKIX1Implicit88_ReasonFlags?
    @usableFromInline var cRLIssuer: PKIX1Implicit88_GeneralNames?
    @inlinable init(distributionPoint: PKIX1Implicit88_DistributionPointName?, reasons: PKIX1Implicit88_ReasonFlags?, cRLIssuer: PKIX1Implicit88_GeneralNames?) {
        self.distributionPoint = distributionPoint
        self.reasons = reasons
        self.cRLIssuer = cRLIssuer

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let distributionPoint: PKIX1Implicit88_DistributionPointName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let reasons: PKIX1Implicit88_ReasonFlags? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let cRLIssuer: PKIX1Implicit88_GeneralNames? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

            return PKIX1Implicit88_DistributionPoint(distributionPoint: distributionPoint, reasons: reasons, cRLIssuer: cRLIssuer)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let distributionPoint = self.distributionPoint { try coder.serializeOptionalImplicitlyTagged(distributionPoint, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let reasons = self.reasons { try coder.serializeOptionalImplicitlyTagged(reasons, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let cRLIssuer = self.cRLIssuer { try coder.serializeOptionalImplicitlyTagged(cRLIssuer, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_DistributionPointName.swift
@usableFromInline indirect enum PKIX1Implicit88_DistributionPointName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case fullName(PKIX1Implicit88_GeneralNames)
    case nameRelativeToCRLIssuer(InformationFramework_RelativeDistinguishedName)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .fullName(try PKIX1Implicit88_GeneralNames(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .nameRelativeToCRLIssuer(try InformationFramework_RelativeDistinguishedName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .fullName(let fullName): try fullName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .nameRelativeToCRLIssuer(let nameRelativeToCRLIssuer): try nameRelativeToCRLIssuer.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIX1Implicit88_EDIPartyName.swift
@usableFromInline struct PKIX1Implicit88_EDIPartyName: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var nameAssigner: PKIX1Explicit88_DirectoryString?
    @usableFromInline var partyName: PKIX1Explicit88_DirectoryString
    @inlinable init(nameAssigner: PKIX1Explicit88_DirectoryString?, partyName: PKIX1Explicit88_DirectoryString) {
        self.nameAssigner = nameAssigner
        self.partyName = partyName

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let nameAssigner: PKIX1Explicit88_DirectoryString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let partyName: PKIX1Explicit88_DirectoryString = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)))!

            return PKIX1Implicit88_EDIPartyName(nameAssigner: nameAssigner, partyName: partyName)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let nameAssigner = self.nameAssigner { try coder.serializeOptionalImplicitlyTagged(nameAssigner, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serializeOptionalImplicitlyTagged(partyName, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }
}

// MARK: - PKIX1Implicit88_ExtKeyUsageSyntax.swift
@usableFromInline struct PKIX1Implicit88_ExtKeyUsageSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_KeyPurposeId]
    @inlinable public init(_ value: [PKIX1Implicit88_KeyPurposeId]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_KeyPurposeId.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_FreshestCRL.swift
@usableFromInline typealias PKIX1Implicit88_FreshestCRL = PKIX1Implicit88_CRLDistributionPoints

// MARK: - PKIX1Implicit88_GeneralName.swift
@usableFromInline indirect enum PKIX1Implicit88_GeneralName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case otherName(PKIX1Implicit88_AnotherName)
    case rfc822Name(ASN1IA5String)
    case dNSName(ASN1IA5String)
    case x400Address(PKIX1Explicit88_ORAddress)
    case directoryName(InformationFramework_Name)
    case ediPartyName(PKIX1Implicit88_EDIPartyName)
    case uniformResourceIdentifier(ASN1IA5String)
    case iPAddress(ASN1OctetString)
    case registeredID(ASN1ObjectIdentifier)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .otherName(try PKIX1Implicit88_AnotherName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .rfc822Name(try ASN1IA5String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .dNSName(try ASN1IA5String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .x400Address(try PKIX1Explicit88_ORAddress(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            self = .directoryName(try InformationFramework_Name(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific):
            self = .ediPartyName(try PKIX1Implicit88_EDIPartyName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific):
            self = .uniformResourceIdentifier(try ASN1IA5String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 7, tagClass: .contextSpecific):
            self = .iPAddress(try ASN1OctetString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 8, tagClass: .contextSpecific):
            self = .registeredID(try ASN1ObjectIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .otherName(let otherName): try otherName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .rfc822Name(let rfc822Name): try rfc822Name.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .dNSName(let dNSName): try dNSName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .x400Address(let x400Address): try x400Address.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
        case .directoryName(let directoryName): try directoryName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
        case .ediPartyName(let ediPartyName): try ediPartyName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific))
        case .uniformResourceIdentifier(let uniformResourceIdentifier): try uniformResourceIdentifier.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific))
        case .iPAddress(let iPAddress): try iPAddress.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 7, tagClass: .contextSpecific))
        case .registeredID(let registeredID): try registeredID.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 8, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIX1Implicit88_GeneralNames.swift
@usableFromInline struct PKIX1Implicit88_GeneralNames: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_GeneralName]
    @inlinable public init(_ value: [PKIX1Implicit88_GeneralName]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_GeneralName.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_GeneralSubtree.swift
@usableFromInline struct PKIX1Implicit88_GeneralSubtree: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var base: PKIX1Implicit88_GeneralName
    @usableFromInline var minimum: PKIX1Implicit88_BaseDistance?
    @usableFromInline var maximum: PKIX1Implicit88_BaseDistance?
    @inlinable init(base: PKIX1Implicit88_GeneralName, minimum: PKIX1Implicit88_BaseDistance?, maximum: PKIX1Implicit88_BaseDistance?) {
        self.base = base
        self.minimum = minimum
        self.maximum = maximum

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let base: PKIX1Implicit88_GeneralName = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)
            let minimum: PKIX1Implicit88_BaseDistance? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let maximum: PKIX1Implicit88_BaseDistance? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit88_GeneralSubtree(base: base, minimum: minimum, maximum: maximum)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(base)
            if let minimum = self.minimum { try coder.serializeOptionalImplicitlyTagged(minimum, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let maximum = self.maximum { try coder.serializeOptionalImplicitlyTagged(maximum, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_GeneralSubtrees.swift
@usableFromInline struct PKIX1Implicit88_GeneralSubtrees: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_GeneralSubtree]
    @inlinable public init(_ value: [PKIX1Implicit88_GeneralSubtree]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_GeneralSubtree.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_HoldInstructionCode.swift
@usableFromInline typealias PKIX1Implicit88_HoldInstructionCode = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit88_InhibitAnyPolicy.swift
@usableFromInline typealias PKIX1Implicit88_InhibitAnyPolicy = PKIX1Implicit88_SkipCerts

// MARK: - PKIX1Implicit88_InvalidityDate.swift
@usableFromInline typealias PKIX1Implicit88_InvalidityDate = GeneralizedTime

// MARK: - PKIX1Implicit88_IssuerAltName.swift
@usableFromInline typealias PKIX1Implicit88_IssuerAltName = PKIX1Implicit_2009_GeneralNames

// MARK: - PKIX1Implicit88_IssuingDistributionPoint.swift
@usableFromInline struct PKIX1Implicit88_IssuingDistributionPoint: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var distributionPoint: PKIX1Implicit88_DistributionPointName?
    @usableFromInline var onlyContainsUserCerts: Bool?
    @usableFromInline var onlyContainsCACerts: Bool?
    @usableFromInline var onlySomeReasons: PKIX1Implicit88_ReasonFlags?
    @usableFromInline var indirectCRL: Bool?
    @usableFromInline var onlyContainsAttributeCerts: Bool?
    @inlinable init(distributionPoint: PKIX1Implicit88_DistributionPointName?, onlyContainsUserCerts: Bool?, onlyContainsCACerts: Bool?, onlySomeReasons: PKIX1Implicit88_ReasonFlags?, indirectCRL: Bool?, onlyContainsAttributeCerts: Bool?) {
        self.distributionPoint = distributionPoint
        self.onlyContainsUserCerts = onlyContainsUserCerts
        self.onlyContainsCACerts = onlyContainsCACerts
        self.onlySomeReasons = onlySomeReasons
        self.indirectCRL = indirectCRL
        self.onlyContainsAttributeCerts = onlyContainsAttributeCerts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let distributionPoint: PKIX1Implicit88_DistributionPointName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let onlyContainsUserCerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let onlyContainsCACerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let onlySomeReasons: PKIX1Implicit88_ReasonFlags? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
            let indirectCRL: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
            let onlyContainsAttributeCerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific))

            return PKIX1Implicit88_IssuingDistributionPoint(distributionPoint: distributionPoint, onlyContainsUserCerts: onlyContainsUserCerts, onlyContainsCACerts: onlyContainsCACerts, onlySomeReasons: onlySomeReasons, indirectCRL: indirectCRL, onlyContainsAttributeCerts: onlyContainsAttributeCerts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let distributionPoint = self.distributionPoint { try coder.serializeOptionalImplicitlyTagged(distributionPoint, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let onlyContainsUserCerts = self.onlyContainsUserCerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsUserCerts, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let onlyContainsCACerts = self.onlyContainsCACerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsCACerts, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let onlySomeReasons = self.onlySomeReasons { try coder.serializeOptionalImplicitlyTagged(onlySomeReasons, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }
            if let indirectCRL = self.indirectCRL { try coder.serializeOptionalImplicitlyTagged(indirectCRL, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) }
            if let onlyContainsAttributeCerts = self.onlyContainsAttributeCerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsAttributeCerts, withIdentifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_KeyIdentifier.swift
@usableFromInline typealias PKIX1Implicit88_KeyIdentifier = ASN1OctetString

// MARK: - PKIX1Implicit88_KeyPurposeId.swift
@usableFromInline typealias PKIX1Implicit88_KeyPurposeId = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit88_KeyUsage.swift
@usableFromInline typealias PKIX1Implicit88_KeyUsage = ASN1BitString

// MARK: - PKIX1Implicit88_Name.swift
@usableFromInline typealias PKIX1Implicit88_Name = InformationFramework_Name

// MARK: - PKIX1Implicit88_NameConstraints.swift
@usableFromInline struct PKIX1Implicit88_NameConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var permittedSubtrees: PKIX1Implicit88_GeneralSubtrees?
    @usableFromInline var excludedSubtrees: PKIX1Implicit88_GeneralSubtrees?
    @inlinable init(permittedSubtrees: PKIX1Implicit88_GeneralSubtrees?, excludedSubtrees: PKIX1Implicit88_GeneralSubtrees?) {
        self.permittedSubtrees = permittedSubtrees
        self.excludedSubtrees = excludedSubtrees

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let permittedSubtrees: PKIX1Implicit88_GeneralSubtrees? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let excludedSubtrees: PKIX1Implicit88_GeneralSubtrees? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit88_NameConstraints(permittedSubtrees: permittedSubtrees, excludedSubtrees: excludedSubtrees)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let permittedSubtrees = self.permittedSubtrees { try coder.serializeOptionalImplicitlyTagged(permittedSubtrees, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let excludedSubtrees = self.excludedSubtrees { try coder.serializeOptionalImplicitlyTagged(excludedSubtrees, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_NoticeReference.swift
@usableFromInline struct PKIX1Implicit88_NoticeReference: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var organization: PKIX1Implicit88_DisplayText
    @usableFromInline var noticeNumbers: [ArraySlice<UInt8>]
    @inlinable init(organization: PKIX1Implicit88_DisplayText, noticeNumbers: [ArraySlice<UInt8>]) {
        self.organization = organization
        self.noticeNumbers = noticeNumbers

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let organization: PKIX1Implicit88_DisplayText = try PKIX1Implicit88_DisplayText(derEncoded: &nodes)
            let noticeNumbers: [ArraySlice<UInt8>] = try DER.sequence(of: ArraySlice<UInt8>.self, identifier: .sequence, nodes: &nodes)

            return PKIX1Implicit88_NoticeReference(organization: organization, noticeNumbers: noticeNumbers)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(organization)
            try coder.serializeSequenceOf(noticeNumbers)

        }
    }
}

// MARK: - PKIX1Implicit88_PolicyConstraints.swift
@usableFromInline struct PKIX1Implicit88_PolicyConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var requireExplicitPolicy: PKIX1Implicit88_SkipCerts?
    @usableFromInline var inhibitPolicyMapping: PKIX1Implicit88_SkipCerts?
    @inlinable init(requireExplicitPolicy: PKIX1Implicit88_SkipCerts?, inhibitPolicyMapping: PKIX1Implicit88_SkipCerts?) {
        self.requireExplicitPolicy = requireExplicitPolicy
        self.inhibitPolicyMapping = inhibitPolicyMapping

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let requireExplicitPolicy: PKIX1Implicit88_SkipCerts? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let inhibitPolicyMapping: PKIX1Implicit88_SkipCerts? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit88_PolicyConstraints(requireExplicitPolicy: requireExplicitPolicy, inhibitPolicyMapping: inhibitPolicyMapping)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let requireExplicitPolicy = self.requireExplicitPolicy { try coder.serializeOptionalImplicitlyTagged(requireExplicitPolicy, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let inhibitPolicyMapping = self.inhibitPolicyMapping { try coder.serializeOptionalImplicitlyTagged(inhibitPolicyMapping, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_PolicyInformation.swift
@usableFromInline struct PKIX1Implicit88_PolicyInformation: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var policyIdentifier: PKIX1Implicit88_CertPolicyId
    @usableFromInline var policyQualifiers: [PKIX1Implicit88_PolicyQualifierInfo]?
    @inlinable init(policyIdentifier: PKIX1Implicit88_CertPolicyId, policyQualifiers: [PKIX1Implicit88_PolicyQualifierInfo]?) {
        self.policyIdentifier = policyIdentifier
        self.policyQualifiers = policyQualifiers

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let policyIdentifier: PKIX1Implicit88_CertPolicyId = try PKIX1Implicit88_CertPolicyId(derEncoded: &nodes)
            let policyQualifiers: [PKIX1Implicit88_PolicyQualifierInfo]? = try DER.sequence(of: PKIX1Implicit88_PolicyQualifierInfo.self, identifier: .sequence, nodes: &nodes)

            return PKIX1Implicit88_PolicyInformation(policyIdentifier: policyIdentifier, policyQualifiers: policyQualifiers)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(policyIdentifier)
            if let policyQualifiers = self.policyQualifiers { try coder.serializeSequenceOf(policyQualifiers) }

        }
    }
}

// MARK: - PKIX1Implicit88_PolicyMappings.swift
@usableFromInline struct PKIX1Implicit88_PolicyMappings: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_PolicyMappings_Element]
    @inlinable public init(_ value: [PKIX1Implicit88_PolicyMappings_Element]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_PolicyMappings_Element.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_PolicyMappings_Element.swift
@usableFromInline struct PKIX1Implicit88_PolicyMappings_Element: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuerDomainPolicy: PKIX1Implicit88_CertPolicyId
    @usableFromInline var subjectDomainPolicy: PKIX1Implicit88_CertPolicyId
    @inlinable init(issuerDomainPolicy: PKIX1Implicit88_CertPolicyId, subjectDomainPolicy: PKIX1Implicit88_CertPolicyId) {
        self.issuerDomainPolicy = issuerDomainPolicy
        self.subjectDomainPolicy = subjectDomainPolicy

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuerDomainPolicy: PKIX1Implicit88_CertPolicyId = try PKIX1Implicit88_CertPolicyId(derEncoded: &nodes)
            let subjectDomainPolicy: PKIX1Implicit88_CertPolicyId = try PKIX1Implicit88_CertPolicyId(derEncoded: &nodes)

            return PKIX1Implicit88_PolicyMappings_Element(issuerDomainPolicy: issuerDomainPolicy, subjectDomainPolicy: subjectDomainPolicy)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuerDomainPolicy)
            try coder.serialize(subjectDomainPolicy)

        }
    }
}

// MARK: - PKIX1Implicit88_PolicyQualifierId.swift
@usableFromInline typealias PKIX1Implicit88_PolicyQualifierId = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit88_PolicyQualifierInfo.swift
@usableFromInline struct PKIX1Implicit88_PolicyQualifierInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var policyQualifierId: PKIX1Implicit88_PolicyQualifierId
    @usableFromInline var qualifier: ASN1Any
    @inlinable init(policyQualifierId: PKIX1Implicit88_PolicyQualifierId, qualifier: ASN1Any) {
        self.policyQualifierId = policyQualifierId
        self.qualifier = qualifier

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let policyQualifierId: PKIX1Implicit88_PolicyQualifierId = try PKIX1Implicit88_PolicyQualifierId(derEncoded: &nodes)
            let qualifier: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return PKIX1Implicit88_PolicyQualifierInfo(policyQualifierId: policyQualifierId, qualifier: qualifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(policyQualifierId)
            try coder.serialize(qualifier)

        }
    }
}

// MARK: - PKIX1Implicit88_PrivateKeyUsagePeriod.swift
@usableFromInline struct PKIX1Implicit88_PrivateKeyUsagePeriod: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBefore: GeneralizedTime?
    @usableFromInline var notAfter: GeneralizedTime?
    @inlinable init(notBefore: GeneralizedTime?, notAfter: GeneralizedTime?) {
        self.notBefore = notBefore
        self.notAfter = notAfter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBefore: GeneralizedTime? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let notAfter: GeneralizedTime? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit88_PrivateKeyUsagePeriod(notBefore: notBefore, notAfter: notAfter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let notBefore = self.notBefore { try coder.serializeOptionalImplicitlyTagged(notBefore, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let notAfter = self.notAfter { try coder.serializeOptionalImplicitlyTagged(notAfter, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit88_ReasonFlags.swift
@usableFromInline typealias PKIX1Implicit88_ReasonFlags = ASN1BitString

// MARK: - PKIX1Implicit88_RelativeDistinguishedName.swift
@usableFromInline typealias PKIX1Implicit88_RelativeDistinguishedName = InformationFramework_RelativeDistinguishedName

// MARK: - PKIX1Implicit88_SkipCerts.swift
@usableFromInline typealias PKIX1Implicit88_SkipCerts = Int

// MARK: - PKIX1Implicit88_SubjectAltName.swift
@usableFromInline typealias PKIX1Implicit88_SubjectAltName = PKIX1Implicit_2009_GeneralNames

// MARK: - PKIX1Implicit88_SubjectDirectoryAttributes.swift
@usableFromInline struct PKIX1Implicit88_SubjectDirectoryAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_Attribute]
    @inlinable public init(_ value: [PKIX1Explicit88_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_SubjectInfoAccessSyntax.swift
@usableFromInline struct PKIX1Implicit88_SubjectInfoAccessSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit88_AccessDescription]
    @inlinable public init(_ value: [PKIX1Implicit88_AccessDescription]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit88_AccessDescription.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit88_SubjectKeyIdentifier.swift
@usableFromInline typealias PKIX1Implicit88_SubjectKeyIdentifier = PKIX1Implicit88_KeyIdentifier

// MARK: - PKIX1Implicit88_UserNotice.swift
@usableFromInline struct PKIX1Implicit88_UserNotice: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var noticeRef: PKIX1Implicit88_NoticeReference?
    @usableFromInline var explicitText: PKIX1Implicit88_DisplayText?
    @inlinable init(noticeRef: PKIX1Implicit88_NoticeReference?, explicitText: PKIX1Implicit88_DisplayText?) {
        self.noticeRef = noticeRef
        self.explicitText = explicitText

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var noticeRef: PKIX1Implicit88_NoticeReference? = nil
var peek_noticeRef = nodes
if let next = peek_noticeRef.next(), next.identifier == PKIX1Implicit88_NoticeReference.defaultIdentifier {
    noticeRef = try PKIX1Implicit88_NoticeReference(derEncoded: &nodes)
}
            var explicitText: PKIX1Implicit88_DisplayText? = nil
var peek_explicitText = nodes
if let next = peek_explicitText.next(), next.identifier == PKIX1Implicit88_DisplayText.defaultIdentifier {
    explicitText = try PKIX1Implicit88_DisplayText(derEncoded: &nodes)
}

            return PKIX1Implicit88_UserNotice(noticeRef: noticeRef, explicitText: explicitText)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let noticeRef = self.noticeRef { try coder.serialize(noticeRef) }
            if let explicitText = self.explicitText { try coder.serialize(explicitText) }

        }
    }
}

// MARK: - PKIX1Implicit88_anyExtendedKeyUsage_oid.swift
public let PKIX1Implicit88_anyExtendedKeyUsage: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce_extKeyUsage + [0]

// MARK: - PKIX1Implicit88_anyPolicy_oid.swift
public let PKIX1Implicit88_anyPolicy: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce_certificatePolicies + [0]

// MARK: - PKIX1Implicit88_holdInstruction_oid.swift
public let PKIX1Implicit88_holdInstruction: ASN1ObjectIdentifier = [2, 2, 840, 10040, 2]

// MARK: - PKIX1Implicit88_id_ce_authorityKeyIdentifier_oid.swift
public let PKIX1Implicit88_id_ce_authorityKeyIdentifier: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [35]

// MARK: - PKIX1Implicit88_id_ce_basicConstraints_oid.swift
public let PKIX1Implicit88_id_ce_basicConstraints: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [19]

// MARK: - PKIX1Implicit88_id_ce_cRLDistributionPoints_oid.swift
public let PKIX1Implicit88_id_ce_cRLDistributionPoints: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [31]

// MARK: - PKIX1Implicit88_id_ce_cRLNumber_oid.swift
public let PKIX1Implicit88_id_ce_cRLNumber: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [20]

// MARK: - PKIX1Implicit88_id_ce_cRLReasons_oid.swift
public let PKIX1Implicit88_id_ce_cRLReasons: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [21]

// MARK: - PKIX1Implicit88_id_ce_certificateIssuer_oid.swift
public let PKIX1Implicit88_id_ce_certificateIssuer: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [29]

// MARK: - PKIX1Implicit88_id_ce_certificatePolicies_oid.swift
public let PKIX1Implicit88_id_ce_certificatePolicies: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [32]

// MARK: - PKIX1Implicit88_id_ce_deltaCRLIndicator_oid.swift
public let PKIX1Implicit88_id_ce_deltaCRLIndicator: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [27]

// MARK: - PKIX1Implicit88_id_ce_extKeyUsage_oid.swift
public let PKIX1Implicit88_id_ce_extKeyUsage: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [37]

// MARK: - PKIX1Implicit88_id_ce_freshestCRL_oid.swift
public let PKIX1Implicit88_id_ce_freshestCRL: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [46]

// MARK: - PKIX1Implicit88_id_ce_holdInstructionCode_oid.swift
public let PKIX1Implicit88_id_ce_holdInstructionCode: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [23]

// MARK: - PKIX1Implicit88_id_ce_inhibitAnyPolicy_oid.swift
public let PKIX1Implicit88_id_ce_inhibitAnyPolicy: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [54]

// MARK: - PKIX1Implicit88_id_ce_invalidityDate_oid.swift
public let PKIX1Implicit88_id_ce_invalidityDate: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [24]

// MARK: - PKIX1Implicit88_id_ce_issuerAltName_oid.swift
public let PKIX1Implicit88_id_ce_issuerAltName: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [18]

// MARK: - PKIX1Implicit88_id_ce_issuingDistributionPoint_oid.swift
public let PKIX1Implicit88_id_ce_issuingDistributionPoint: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [28]

// MARK: - PKIX1Implicit88_id_ce_keyUsage_oid.swift
public let PKIX1Implicit88_id_ce_keyUsage: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [15]

// MARK: - PKIX1Implicit88_id_ce_nameConstraints_oid.swift
public let PKIX1Implicit88_id_ce_nameConstraints: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [30]

// MARK: - PKIX1Implicit88_id_ce_oid.swift
public let PKIX1Implicit88_id_ce: ASN1ObjectIdentifier = [2, 5, 29]

// MARK: - PKIX1Implicit88_id_ce_policyConstraints_oid.swift
public let PKIX1Implicit88_id_ce_policyConstraints: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [36]

// MARK: - PKIX1Implicit88_id_ce_policyMappings_oid.swift
public let PKIX1Implicit88_id_ce_policyMappings: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [33]

// MARK: - PKIX1Implicit88_id_ce_privateKeyUsagePeriod_oid.swift
public let PKIX1Implicit88_id_ce_privateKeyUsagePeriod: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [16]

// MARK: - PKIX1Implicit88_id_ce_subjectAltName_oid.swift
public let PKIX1Implicit88_id_ce_subjectAltName: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [17]

// MARK: - PKIX1Implicit88_id_ce_subjectDirectoryAttributes_oid.swift
public let PKIX1Implicit88_id_ce_subjectDirectoryAttributes: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [9]

// MARK: - PKIX1Implicit88_id_ce_subjectKeyIdentifier_oid.swift
public let PKIX1Implicit88_id_ce_subjectKeyIdentifier: ASN1ObjectIdentifier = PKIX1Implicit88_id_ce + [14]

// MARK: - PKIX1Implicit88_id_holdinstruction_callissuer_oid.swift
public let PKIX1Implicit88_id_holdinstruction_callissuer: ASN1ObjectIdentifier = PKIX1Implicit88_holdInstruction + [2]

// MARK: - PKIX1Implicit88_id_holdinstruction_none_oid.swift
public let PKIX1Implicit88_id_holdinstruction_none: ASN1ObjectIdentifier = PKIX1Implicit88_holdInstruction + [1]

// MARK: - PKIX1Implicit88_id_holdinstruction_reject_oid.swift
public let PKIX1Implicit88_id_holdinstruction_reject: ASN1ObjectIdentifier = PKIX1Implicit88_holdInstruction + [3]

// MARK: - PKIX1Implicit88_id_kp_OCSPSigning_oid.swift
public let PKIX1Implicit88_id_kp_OCSPSigning: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [9]

// MARK: - PKIX1Implicit88_id_kp_clientAuth_oid.swift
public let PKIX1Implicit88_id_kp_clientAuth: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [2]

// MARK: - PKIX1Implicit88_id_kp_codeSigning_oid.swift
public let PKIX1Implicit88_id_kp_codeSigning: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [3]

// MARK: - PKIX1Implicit88_id_kp_emailProtection_oid.swift
public let PKIX1Implicit88_id_kp_emailProtection: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [4]

// MARK: - PKIX1Implicit88_id_kp_serverAuth_oid.swift
public let PKIX1Implicit88_id_kp_serverAuth: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [1]

// MARK: - PKIX1Implicit88_id_kp_timeStamping_oid.swift
public let PKIX1Implicit88_id_kp_timeStamping: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [8]

// MARK: - PKIX1Implicit88_id_pe_authorityInfoAccess_oid.swift
public let PKIX1Implicit88_id_pe_authorityInfoAccess: ASN1ObjectIdentifier = PKIX1Explicit88_id_pe + [1]

// MARK: - PKIX1Implicit88_id_pe_subjectInfoAccess_oid.swift
public let PKIX1Implicit88_id_pe_subjectInfoAccess: ASN1ObjectIdentifier = PKIX1Explicit88_id_pe + [11]

// MARK: - PKIX1Implicit_2009_AccessDescription.swift
@usableFromInline struct PKIX1Implicit_2009_AccessDescription: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var accessMethod: ASN1ObjectIdentifier
    @usableFromInline var accessLocation: PKIX1Implicit88_GeneralName
    @inlinable init(accessMethod: ASN1ObjectIdentifier, accessLocation: PKIX1Implicit88_GeneralName) {
        self.accessMethod = accessMethod
        self.accessLocation = accessLocation

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let accessMethod: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let accessLocation: PKIX1Implicit88_GeneralName = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)

            return PKIX1Implicit_2009_AccessDescription(accessMethod: accessMethod, accessLocation: accessLocation)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(accessMethod)
            try coder.serialize(accessLocation)

        }
    }
}

// MARK: - PKIX1Implicit_2009_AuthorityInfoAccessSyntax.swift
@usableFromInline struct PKIX1Implicit_2009_AuthorityInfoAccessSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_AccessDescription]
    @inlinable public init(_ value: [PKIX1Implicit_2009_AccessDescription]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_AccessDescription.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_AuthorityKeyIdentifier.swift
@usableFromInline struct PKIX1Implicit_2009_AuthorityKeyIdentifier: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var keyIdentifier: PKIX1Implicit_2009_KeyIdentifier?
    @usableFromInline var authorityCertIssuer: PKIX1Implicit88_GeneralNames?
    @usableFromInline var authorityCertSerialNumber: ArraySlice<UInt8>?
    @inlinable init(keyIdentifier: PKIX1Implicit_2009_KeyIdentifier?, authorityCertIssuer: PKIX1Implicit88_GeneralNames?, authorityCertSerialNumber: ArraySlice<UInt8>?) {
        self.keyIdentifier = keyIdentifier
        self.authorityCertIssuer = authorityCertIssuer
        self.authorityCertSerialNumber = authorityCertSerialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let keyIdentifier: PKIX1Implicit_2009_KeyIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let authorityCertIssuer: PKIX1Implicit88_GeneralNames? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let authorityCertSerialNumber: ArraySlice<UInt8>? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_AuthorityKeyIdentifier(keyIdentifier: keyIdentifier, authorityCertIssuer: authorityCertIssuer, authorityCertSerialNumber: authorityCertSerialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let keyIdentifier = self.keyIdentifier { try coder.serializeOptionalImplicitlyTagged(keyIdentifier, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let authorityCertIssuer = self.authorityCertIssuer { try coder.serializeOptionalImplicitlyTagged(authorityCertIssuer, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let authorityCertSerialNumber = self.authorityCertSerialNumber { try coder.serializeOptionalImplicitlyTagged(authorityCertSerialNumber, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_BaseDistance.swift
@usableFromInline typealias PKIX1Implicit_2009_BaseDistance = Int

// MARK: - PKIX1Implicit_2009_BasicConstraints.swift
@usableFromInline struct PKIX1Implicit_2009_BasicConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var cA: Bool?
    @usableFromInline var pathLenConstraint: ArraySlice<UInt8>?
    @inlinable init(cA: Bool?, pathLenConstraint: ArraySlice<UInt8>?) {
        self.cA = cA
        self.pathLenConstraint = pathLenConstraint

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let cA: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            var pathLenConstraint: ArraySlice<UInt8>? = nil
var peek_pathLenConstraint = nodes
if let next = peek_pathLenConstraint.next(), next.identifier == ArraySlice<UInt8>.defaultIdentifier {
    pathLenConstraint = try ArraySlice<UInt8>(derEncoded: &nodes)
}

            return PKIX1Implicit_2009_BasicConstraints(cA: cA, pathLenConstraint: pathLenConstraint)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let cA = self.cA { try coder.serialize(cA) }
            if let pathLenConstraint = self.pathLenConstraint { try coder.serialize(pathLenConstraint) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_CERT_POLICY_QUALIFIER.swift
@usableFromInline typealias PKIX1Implicit_2009_CERT_POLICY_QUALIFIER = ASN1Any

// MARK: - PKIX1Implicit_2009_CPSuri.swift
@usableFromInline typealias PKIX1Implicit_2009_CPSuri = ASN1IA5String

// MARK: - PKIX1Implicit_2009_CRLDistributionPoints.swift
@usableFromInline struct PKIX1Implicit_2009_CRLDistributionPoints: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_DistributionPoint]
    @inlinable public init(_ value: [PKIX1Implicit_2009_DistributionPoint]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_DistributionPoint.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_CRLNumber.swift
@usableFromInline typealias PKIX1Implicit_2009_CRLNumber = Int

// MARK: - PKIX1Implicit_2009_CRLReason.swift
public struct PKIX1Implicit_2009_CRLReason: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let unspecified = Self(rawValue: 0)
    static let keyCompromise = Self(rawValue: 1)
    static let cACompromise = Self(rawValue: 2)
    static let affiliationChanged = Self(rawValue: 3)
    static let superseded = Self(rawValue: 4)
    static let cessationOfOperation = Self(rawValue: 5)
    static let certificateHold = Self(rawValue: 6)
    static let removeFromCRL = Self(rawValue: 8)
    static let privilegeWithdrawn = Self(rawValue: 9)
    static let aACompromise = Self(rawValue: 10)
}

// MARK: - PKIX1Implicit_2009_CertPolicyId.swift
@usableFromInline typealias PKIX1Implicit_2009_CertPolicyId = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit_2009_CertificatePolicies.swift
@usableFromInline struct PKIX1Implicit_2009_CertificatePolicies: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_PolicyInformation]
    @inlinable public init(_ value: [PKIX1Implicit_2009_PolicyInformation]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_PolicyInformation.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_CertificateSerialNumber.swift
@usableFromInline typealias PKIX1Implicit_2009_CertificateSerialNumber = ArraySlice<UInt8>

// MARK: - PKIX1Implicit_2009_DisplayText.swift
@usableFromInline indirect enum PKIX1Implicit_2009_DisplayText: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case ia5String(ASN1IA5String)
    case visibleString(ASN1UTF8String)
    case bmpString(ASN1BMPString)
    case utf8String(ASN1UTF8String)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1IA5String.defaultIdentifier:
            self = .ia5String(try ASN1IA5String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .visibleString(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .utf8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .ia5String(let ia5String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(ia5String)
                            }
                        } else {
                            try coder.serialize(ia5String)
                        }
        case .visibleString(let visibleString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(visibleString)
                            }
                        } else {
                            try coder.serialize(visibleString)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }
        case .utf8String(let utf8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(utf8String)
                            }
                        } else {
                            try coder.serialize(utf8String)
                        }

        }
    }

}

// MARK: - PKIX1Implicit_2009_DistributionPoint.swift
@usableFromInline struct PKIX1Implicit_2009_DistributionPoint: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var distributionPoint: PKIX1Implicit_2009_DistributionPointName?
    @usableFromInline var reasons: PKIX1Implicit_2009_ReasonFlags?
    @usableFromInline var cRLIssuer: PKIX1Implicit88_GeneralNames?
    @inlinable init(distributionPoint: PKIX1Implicit_2009_DistributionPointName?, reasons: PKIX1Implicit_2009_ReasonFlags?, cRLIssuer: PKIX1Implicit88_GeneralNames?) {
        self.distributionPoint = distributionPoint
        self.reasons = reasons
        self.cRLIssuer = cRLIssuer

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let distributionPoint: PKIX1Implicit_2009_DistributionPointName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let reasons: PKIX1Implicit_2009_ReasonFlags? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let cRLIssuer: PKIX1Implicit88_GeneralNames? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_DistributionPoint(distributionPoint: distributionPoint, reasons: reasons, cRLIssuer: cRLIssuer)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let distributionPoint = self.distributionPoint { try coder.serializeOptionalImplicitlyTagged(distributionPoint, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let reasons = self.reasons { try coder.serializeOptionalImplicitlyTagged(reasons, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let cRLIssuer = self.cRLIssuer { try coder.serializeOptionalImplicitlyTagged(cRLIssuer, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_DistributionPointName.swift
@usableFromInline indirect enum PKIX1Implicit_2009_DistributionPointName: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case fullName(PKIX1Implicit88_GeneralNames)
    case nameRelativeToCRLIssuer(InformationFramework_RelativeDistinguishedName)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .fullName(try PKIX1Implicit88_GeneralNames(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .nameRelativeToCRLIssuer(try InformationFramework_RelativeDistinguishedName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .fullName(let fullName): try fullName.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .nameRelativeToCRLIssuer(let nameRelativeToCRLIssuer): try nameRelativeToCRLIssuer.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIX1Implicit_2009_EDIPartyName.swift
@usableFromInline struct PKIX1Implicit_2009_EDIPartyName: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var nameAssigner: PKIX1Explicit88_DirectoryString?
    @usableFromInline var partyName: PKIX1Explicit88_DirectoryString
    @inlinable init(nameAssigner: PKIX1Explicit88_DirectoryString?, partyName: PKIX1Explicit88_DirectoryString) {
        self.nameAssigner = nameAssigner
        self.partyName = partyName

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let nameAssigner: PKIX1Explicit88_DirectoryString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let partyName: PKIX1Explicit88_DirectoryString = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)))!

            return PKIX1Implicit_2009_EDIPartyName(nameAssigner: nameAssigner, partyName: partyName)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let nameAssigner = self.nameAssigner { try coder.serializeOptionalImplicitlyTagged(nameAssigner, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serializeOptionalImplicitlyTagged(partyName, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

        }
    }
}

// MARK: - PKIX1Implicit_2009_ExtKeyUsageSyntax.swift
@usableFromInline struct PKIX1Implicit_2009_ExtKeyUsageSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_KeyPurposeId]
    @inlinable public init(_ value: [PKIX1Implicit_2009_KeyPurposeId]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_KeyPurposeId.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_GeneralName.swift
@usableFromInline typealias PKIX1Implicit_2009_GeneralName = PKIX1Implicit88_GeneralName

// MARK: - PKIX1Implicit_2009_GeneralNames.swift
@usableFromInline typealias PKIX1Implicit_2009_GeneralNames = PKIX1Implicit88_GeneralNames

// MARK: - PKIX1Implicit_2009_GeneralSubtree.swift
@usableFromInline struct PKIX1Implicit_2009_GeneralSubtree: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var base: PKIX1Implicit88_GeneralName
    @usableFromInline var minimum: PKIX1Implicit_2009_BaseDistance?
    @usableFromInline var maximum: PKIX1Implicit_2009_BaseDistance?
    @inlinable init(base: PKIX1Implicit88_GeneralName, minimum: PKIX1Implicit_2009_BaseDistance?, maximum: PKIX1Implicit_2009_BaseDistance?) {
        self.base = base
        self.minimum = minimum
        self.maximum = maximum

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let base: PKIX1Implicit88_GeneralName = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)
            let minimum: PKIX1Implicit_2009_BaseDistance? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let maximum: PKIX1Implicit_2009_BaseDistance? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_GeneralSubtree(base: base, minimum: minimum, maximum: maximum)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(base)
            if let minimum = self.minimum { try coder.serializeOptionalImplicitlyTagged(minimum, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let maximum = self.maximum { try coder.serializeOptionalImplicitlyTagged(maximum, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_GeneralSubtrees.swift
@usableFromInline struct PKIX1Implicit_2009_GeneralSubtrees: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_GeneralSubtree]
    @inlinable public init(_ value: [PKIX1Implicit_2009_GeneralSubtree]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_GeneralSubtree.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_IssuingDistributionPoint.swift
@usableFromInline struct PKIX1Implicit_2009_IssuingDistributionPoint: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var distributionPoint: PKIX1Implicit_2009_DistributionPointName?
    @usableFromInline var onlyContainsUserCerts: Bool?
    @usableFromInline var onlyContainsCACerts: Bool?
    @usableFromInline var onlySomeReasons: PKIX1Implicit_2009_ReasonFlags?
    @usableFromInline var indirectCRL: Bool?
    @usableFromInline var onlyContainsAttributeCerts: Bool?
    @inlinable init(distributionPoint: PKIX1Implicit_2009_DistributionPointName?, onlyContainsUserCerts: Bool?, onlyContainsCACerts: Bool?, onlySomeReasons: PKIX1Implicit_2009_ReasonFlags?, indirectCRL: Bool?, onlyContainsAttributeCerts: Bool?) {
        self.distributionPoint = distributionPoint
        self.onlyContainsUserCerts = onlyContainsUserCerts
        self.onlyContainsCACerts = onlyContainsCACerts
        self.onlySomeReasons = onlySomeReasons
        self.indirectCRL = indirectCRL
        self.onlyContainsAttributeCerts = onlyContainsAttributeCerts

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let distributionPoint: PKIX1Implicit_2009_DistributionPointName? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let onlyContainsUserCerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let onlyContainsCACerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let onlySomeReasons: PKIX1Implicit_2009_ReasonFlags? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
            let indirectCRL: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
            let onlyContainsAttributeCerts: Bool? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_IssuingDistributionPoint(distributionPoint: distributionPoint, onlyContainsUserCerts: onlyContainsUserCerts, onlyContainsCACerts: onlyContainsCACerts, onlySomeReasons: onlySomeReasons, indirectCRL: indirectCRL, onlyContainsAttributeCerts: onlyContainsAttributeCerts)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let distributionPoint = self.distributionPoint { try coder.serializeOptionalImplicitlyTagged(distributionPoint, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let onlyContainsUserCerts = self.onlyContainsUserCerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsUserCerts, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let onlyContainsCACerts = self.onlyContainsCACerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsCACerts, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let onlySomeReasons = self.onlySomeReasons { try coder.serializeOptionalImplicitlyTagged(onlySomeReasons, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }
            if let indirectCRL = self.indirectCRL { try coder.serializeOptionalImplicitlyTagged(indirectCRL, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) }
            if let onlyContainsAttributeCerts = self.onlyContainsAttributeCerts { try coder.serializeOptionalImplicitlyTagged(onlyContainsAttributeCerts, withIdentifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_KeyIdentifier.swift
@usableFromInline typealias PKIX1Implicit_2009_KeyIdentifier = ASN1OctetString

// MARK: - PKIX1Implicit_2009_KeyPurposeId.swift
@usableFromInline typealias PKIX1Implicit_2009_KeyPurposeId = ASN1ObjectIdentifier

// MARK: - PKIX1Implicit_2009_KeyUsage.swift
@usableFromInline typealias PKIX1Implicit_2009_KeyUsage = ASN1BitString

// MARK: - PKIX1Implicit_2009_Name.swift
@usableFromInline typealias PKIX1Implicit_2009_Name = InformationFramework_Name

// MARK: - PKIX1Implicit_2009_NameConstraints.swift
@usableFromInline struct PKIX1Implicit_2009_NameConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var permittedSubtrees: PKIX1Implicit_2009_GeneralSubtrees?
    @usableFromInline var excludedSubtrees: PKIX1Implicit_2009_GeneralSubtrees?
    @inlinable init(permittedSubtrees: PKIX1Implicit_2009_GeneralSubtrees?, excludedSubtrees: PKIX1Implicit_2009_GeneralSubtrees?) {
        self.permittedSubtrees = permittedSubtrees
        self.excludedSubtrees = excludedSubtrees

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let permittedSubtrees: PKIX1Implicit_2009_GeneralSubtrees? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let excludedSubtrees: PKIX1Implicit_2009_GeneralSubtrees? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_NameConstraints(permittedSubtrees: permittedSubtrees, excludedSubtrees: excludedSubtrees)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let permittedSubtrees = self.permittedSubtrees { try coder.serializeOptionalImplicitlyTagged(permittedSubtrees, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let excludedSubtrees = self.excludedSubtrees { try coder.serializeOptionalImplicitlyTagged(excludedSubtrees, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_NoticeReference.swift
@usableFromInline struct PKIX1Implicit_2009_NoticeReference: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var organization: PKIX1Implicit_2009_DisplayText
    @usableFromInline var noticeNumbers: [ArraySlice<UInt8>]
    @inlinable init(organization: PKIX1Implicit_2009_DisplayText, noticeNumbers: [ArraySlice<UInt8>]) {
        self.organization = organization
        self.noticeNumbers = noticeNumbers

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let organization: PKIX1Implicit_2009_DisplayText = try PKIX1Implicit_2009_DisplayText(derEncoded: &nodes)
            let noticeNumbers: [ArraySlice<UInt8>] = try DER.sequence(of: ArraySlice<UInt8>.self, identifier: .sequence, nodes: &nodes)

            return PKIX1Implicit_2009_NoticeReference(organization: organization, noticeNumbers: noticeNumbers)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(organization)
            try coder.serializeSequenceOf(noticeNumbers)

        }
    }
}

// MARK: - PKIX1Implicit_2009_OTHER_NAME.swift
@usableFromInline typealias PKIX1Implicit_2009_OTHER_NAME = ASN1Any

// MARK: - PKIX1Implicit_2009_PolicyConstraints.swift
@usableFromInline struct PKIX1Implicit_2009_PolicyConstraints: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var requireExplicitPolicy: PKIX1Implicit_2009_SkipCerts?
    @usableFromInline var inhibitPolicyMapping: PKIX1Implicit_2009_SkipCerts?
    @inlinable init(requireExplicitPolicy: PKIX1Implicit_2009_SkipCerts?, inhibitPolicyMapping: PKIX1Implicit_2009_SkipCerts?) {
        self.requireExplicitPolicy = requireExplicitPolicy
        self.inhibitPolicyMapping = inhibitPolicyMapping

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let requireExplicitPolicy: PKIX1Implicit_2009_SkipCerts? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let inhibitPolicyMapping: PKIX1Implicit_2009_SkipCerts? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_PolicyConstraints(requireExplicitPolicy: requireExplicitPolicy, inhibitPolicyMapping: inhibitPolicyMapping)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let requireExplicitPolicy = self.requireExplicitPolicy { try coder.serializeOptionalImplicitlyTagged(requireExplicitPolicy, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let inhibitPolicyMapping = self.inhibitPolicyMapping { try coder.serializeOptionalImplicitlyTagged(inhibitPolicyMapping, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_PolicyInformation.swift
@usableFromInline struct PKIX1Implicit_2009_PolicyInformation: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var policyIdentifier: PKIX1Implicit_2009_CertPolicyId
    @usableFromInline var policyQualifiers: [PKIX1Implicit_2009_PolicyQualifierInfo]?
    @inlinable init(policyIdentifier: PKIX1Implicit_2009_CertPolicyId, policyQualifiers: [PKIX1Implicit_2009_PolicyQualifierInfo]?) {
        self.policyIdentifier = policyIdentifier
        self.policyQualifiers = policyQualifiers

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let policyIdentifier: PKIX1Implicit_2009_CertPolicyId = try PKIX1Implicit_2009_CertPolicyId(derEncoded: &nodes)
            let policyQualifiers: [PKIX1Implicit_2009_PolicyQualifierInfo]? = try DER.sequence(of: PKIX1Implicit_2009_PolicyQualifierInfo.self, identifier: .sequence, nodes: &nodes)

            return PKIX1Implicit_2009_PolicyInformation(policyIdentifier: policyIdentifier, policyQualifiers: policyQualifiers)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(policyIdentifier)
            if let policyQualifiers = self.policyQualifiers { try coder.serializeSequenceOf(policyQualifiers) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_PolicyMappings.swift
@usableFromInline struct PKIX1Implicit_2009_PolicyMappings: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_PolicyMappings_Element]
    @inlinable public init(_ value: [PKIX1Implicit_2009_PolicyMappings_Element]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_PolicyMappings_Element.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_PolicyMappings_Element.swift
@usableFromInline struct PKIX1Implicit_2009_PolicyMappings_Element: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuerDomainPolicy: PKIX1Implicit_2009_CertPolicyId
    @usableFromInline var subjectDomainPolicy: PKIX1Implicit_2009_CertPolicyId
    @inlinable init(issuerDomainPolicy: PKIX1Implicit_2009_CertPolicyId, subjectDomainPolicy: PKIX1Implicit_2009_CertPolicyId) {
        self.issuerDomainPolicy = issuerDomainPolicy
        self.subjectDomainPolicy = subjectDomainPolicy

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuerDomainPolicy: PKIX1Implicit_2009_CertPolicyId = try PKIX1Implicit_2009_CertPolicyId(derEncoded: &nodes)
            let subjectDomainPolicy: PKIX1Implicit_2009_CertPolicyId = try PKIX1Implicit_2009_CertPolicyId(derEncoded: &nodes)

            return PKIX1Implicit_2009_PolicyMappings_Element(issuerDomainPolicy: issuerDomainPolicy, subjectDomainPolicy: subjectDomainPolicy)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuerDomainPolicy)
            try coder.serialize(subjectDomainPolicy)

        }
    }
}

// MARK: - PKIX1Implicit_2009_PolicyQualifierInfo.swift
@usableFromInline struct PKIX1Implicit_2009_PolicyQualifierInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var policyQualifierId: ASN1ObjectIdentifier
    @usableFromInline var qualifier: ASN1Any
    @inlinable init(policyQualifierId: ASN1ObjectIdentifier, qualifier: ASN1Any) {
        self.policyQualifierId = policyQualifierId
        self.qualifier = qualifier

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let policyQualifierId: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let qualifier: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return PKIX1Implicit_2009_PolicyQualifierInfo(policyQualifierId: policyQualifierId, qualifier: qualifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(policyQualifierId)
            try coder.serialize(qualifier)

        }
    }
}

// MARK: - PKIX1Implicit_2009_PrivateKeyUsagePeriod.swift
@usableFromInline struct PKIX1Implicit_2009_PrivateKeyUsagePeriod: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBefore: GeneralizedTime?
    @usableFromInline var notAfter: GeneralizedTime?
    @inlinable init(notBefore: GeneralizedTime?, notAfter: GeneralizedTime?) {
        self.notBefore = notBefore
        self.notAfter = notAfter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBefore: GeneralizedTime? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let notAfter: GeneralizedTime? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIX1Implicit_2009_PrivateKeyUsagePeriod(notBefore: notBefore, notAfter: notAfter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let notBefore = self.notBefore { try coder.serializeOptionalImplicitlyTagged(notBefore, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let notAfter = self.notAfter { try coder.serializeOptionalImplicitlyTagged(notAfter, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_ReasonFlags.swift
@usableFromInline typealias PKIX1Implicit_2009_ReasonFlags = ASN1BitString

// MARK: - PKIX1Implicit_2009_RelativeDistinguishedName.swift
@usableFromInline typealias PKIX1Implicit_2009_RelativeDistinguishedName = InformationFramework_RelativeDistinguishedName

// MARK: - PKIX1Implicit_2009_SkipCerts.swift
@usableFromInline typealias PKIX1Implicit_2009_SkipCerts = Int

// MARK: - PKIX1Implicit_2009_SubjectDirectoryAttributes.swift
@usableFromInline struct PKIX1Implicit_2009_SubjectDirectoryAttributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX_CommonTypes_2009_AttributeSet]
    @inlinable public init(_ value: [PKIX_CommonTypes_2009_AttributeSet]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX_CommonTypes_2009_AttributeSet.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_SubjectInfoAccessSyntax.swift
@usableFromInline struct PKIX1Implicit_2009_SubjectInfoAccessSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Implicit_2009_AccessDescription]
    @inlinable public init(_ value: [PKIX1Implicit_2009_AccessDescription]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Implicit_2009_AccessDescription.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX1Implicit_2009_UserNotice.swift
@usableFromInline struct PKIX1Implicit_2009_UserNotice: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var noticeRef: PKIX1Implicit_2009_NoticeReference?
    @usableFromInline var explicitText: PKIX1Implicit_2009_DisplayText?
    @inlinable init(noticeRef: PKIX1Implicit_2009_NoticeReference?, explicitText: PKIX1Implicit_2009_DisplayText?) {
        self.noticeRef = noticeRef
        self.explicitText = explicitText

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var noticeRef: PKIX1Implicit_2009_NoticeReference? = nil
var peek_noticeRef = nodes
if let next = peek_noticeRef.next(), next.identifier == PKIX1Implicit_2009_NoticeReference.defaultIdentifier {
    noticeRef = try PKIX1Implicit_2009_NoticeReference(derEncoded: &nodes)
}
            var explicitText: PKIX1Implicit_2009_DisplayText? = nil
var peek_explicitText = nodes
if let next = peek_explicitText.next(), next.identifier == PKIX1Implicit_2009_DisplayText.defaultIdentifier {
    explicitText = try PKIX1Implicit_2009_DisplayText(derEncoded: &nodes)
}

            return PKIX1Implicit_2009_UserNotice(noticeRef: noticeRef, explicitText: explicitText)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let noticeRef = self.noticeRef { try coder.serialize(noticeRef) }
            if let explicitText = self.explicitText { try coder.serialize(explicitText) }

        }
    }
}

// MARK: - PKIX1Implicit_2009_anyExtendedKeyUsage_oid.swift
public let PKIX1Implicit_2009_anyExtendedKeyUsage: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce_extKeyUsage + [0]

// MARK: - PKIX1Implicit_2009_holdInstruction_oid.swift
public let PKIX1Implicit_2009_holdInstruction: ASN1ObjectIdentifier = [2, 2, 840, 10040, 2]

// MARK: - PKIX1Implicit_2009_id_ce_authorityKeyIdentifier_oid.swift
public let PKIX1Implicit_2009_id_ce_authorityKeyIdentifier: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [35]

// MARK: - PKIX1Implicit_2009_id_ce_basicConstraints_oid.swift
public let PKIX1Implicit_2009_id_ce_basicConstraints: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [19]

// MARK: - PKIX1Implicit_2009_id_ce_cRLDistributionPoints_oid.swift
public let PKIX1Implicit_2009_id_ce_cRLDistributionPoints: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [31]

// MARK: - PKIX1Implicit_2009_id_ce_cRLNumber_oid.swift
public let PKIX1Implicit_2009_id_ce_cRLNumber: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [20]

// MARK: - PKIX1Implicit_2009_id_ce_cRLReasons_oid.swift
public let PKIX1Implicit_2009_id_ce_cRLReasons: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [21]

// MARK: - PKIX1Implicit_2009_id_ce_certificateIssuer_oid.swift
public let PKIX1Implicit_2009_id_ce_certificateIssuer: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [29]

// MARK: - PKIX1Implicit_2009_id_ce_certificatePolicies_oid.swift
public let PKIX1Implicit_2009_id_ce_certificatePolicies: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [32]

// MARK: - PKIX1Implicit_2009_id_ce_deltaCRLIndicator_oid.swift
public let PKIX1Implicit_2009_id_ce_deltaCRLIndicator: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [27]

// MARK: - PKIX1Implicit_2009_id_ce_extKeyUsage_oid.swift
public let PKIX1Implicit_2009_id_ce_extKeyUsage: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [37]

// MARK: - PKIX1Implicit_2009_id_ce_freshestCRL_oid.swift
public let PKIX1Implicit_2009_id_ce_freshestCRL: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [46]

// MARK: - PKIX1Implicit_2009_id_ce_holdInstructionCode_oid.swift
public let PKIX1Implicit_2009_id_ce_holdInstructionCode: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [23]

// MARK: - PKIX1Implicit_2009_id_ce_inhibitAnyPolicy_oid.swift
public let PKIX1Implicit_2009_id_ce_inhibitAnyPolicy: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [54]

// MARK: - PKIX1Implicit_2009_id_ce_invalidityDate_oid.swift
public let PKIX1Implicit_2009_id_ce_invalidityDate: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [24]

// MARK: - PKIX1Implicit_2009_id_ce_issuerAltName_oid.swift
public let PKIX1Implicit_2009_id_ce_issuerAltName: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [18]

// MARK: - PKIX1Implicit_2009_id_ce_issuingDistributionPoint_oid.swift
public let PKIX1Implicit_2009_id_ce_issuingDistributionPoint: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [28]

// MARK: - PKIX1Implicit_2009_id_ce_keyUsage_oid.swift
public let PKIX1Implicit_2009_id_ce_keyUsage: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [15]

// MARK: - PKIX1Implicit_2009_id_ce_nameConstraints_oid.swift
public let PKIX1Implicit_2009_id_ce_nameConstraints: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [30]

// MARK: - PKIX1Implicit_2009_id_ce_oid.swift
public let PKIX1Implicit_2009_id_ce: ASN1ObjectIdentifier = [2, 5, 29]

// MARK: - PKIX1Implicit_2009_id_ce_policyConstraints_oid.swift
public let PKIX1Implicit_2009_id_ce_policyConstraints: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [36]

// MARK: - PKIX1Implicit_2009_id_ce_policyMappings_oid.swift
public let PKIX1Implicit_2009_id_ce_policyMappings: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [33]

// MARK: - PKIX1Implicit_2009_id_ce_privateKeyUsagePeriod_oid.swift
public let PKIX1Implicit_2009_id_ce_privateKeyUsagePeriod: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [16]

// MARK: - PKIX1Implicit_2009_id_ce_subjectAltName_oid.swift
public let PKIX1Implicit_2009_id_ce_subjectAltName: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [17]

// MARK: - PKIX1Implicit_2009_id_ce_subjectDirectoryAttributes_oid.swift
public let PKIX1Implicit_2009_id_ce_subjectDirectoryAttributes: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [9]

// MARK: - PKIX1Implicit_2009_id_ce_subjectKeyIdentifier_oid.swift
public let PKIX1Implicit_2009_id_ce_subjectKeyIdentifier: ASN1ObjectIdentifier = PKIX1Implicit_2009_id_ce + [14]

// MARK: - PKIX1Implicit_2009_id_holdinstruction_callissuer_oid.swift
public let PKIX1Implicit_2009_id_holdinstruction_callissuer: ASN1ObjectIdentifier = PKIX1Implicit_2009_holdInstruction + [2]

// MARK: - PKIX1Implicit_2009_id_holdinstruction_none_oid.swift
public let PKIX1Implicit_2009_id_holdinstruction_none: ASN1ObjectIdentifier = PKIX1Implicit_2009_holdInstruction + [1]

// MARK: - PKIX1Implicit_2009_id_holdinstruction_reject_oid.swift
public let PKIX1Implicit_2009_id_holdinstruction_reject: ASN1ObjectIdentifier = PKIX1Implicit_2009_holdInstruction + [3]

// MARK: - PKIX1Implicit_2009_id_kp_OCSPSigning_oid.swift
public let PKIX1Implicit_2009_id_kp_OCSPSigning: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [9]

// MARK: - PKIX1Implicit_2009_id_kp_clientAuth_oid.swift
public let PKIX1Implicit_2009_id_kp_clientAuth: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [2]

// MARK: - PKIX1Implicit_2009_id_kp_codeSigning_oid.swift
public let PKIX1Implicit_2009_id_kp_codeSigning: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [3]

// MARK: - PKIX1Implicit_2009_id_kp_emailProtection_oid.swift
public let PKIX1Implicit_2009_id_kp_emailProtection: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [4]

// MARK: - PKIX1Implicit_2009_id_kp_serverAuth_oid.swift
public let PKIX1Implicit_2009_id_kp_serverAuth: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [1]

// MARK: - PKIX1Implicit_2009_id_kp_timeStamping_oid.swift
public let PKIX1Implicit_2009_id_kp_timeStamping: ASN1ObjectIdentifier = PKIX1Explicit88_id_kp + [8]

// MARK: - PKIX1Implicit_2009_id_pe_authorityInfoAccess_oid.swift
public let PKIX1Implicit_2009_id_pe_authorityInfoAccess: ASN1ObjectIdentifier = PKIX1Explicit88_id_pe + [1]

// MARK: - PKIX1Implicit_2009_id_pe_subjectInfoAccess_oid.swift
public let PKIX1Implicit_2009_id_pe_subjectInfoAccess: ASN1ObjectIdentifier = PKIX1Explicit88_id_pe + [11]

// MARK: - PKIX1Implicit_2009_ubMax.swift
public let PKIX1Implicit_2009_ubMax: Int = 32768

// MARK: - PKIXCRMF_2009_AlgorithmIdentifier.swift
@usableFromInline typealias PKIXCRMF_2009_AlgorithmIdentifier = AuthenticationFramework_AlgorithmIdentifier

// MARK: - PKIXCRMF_2009_Attributes.swift
@usableFromInline struct PKIXCRMF_2009_Attributes: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var value: [PKIX1Explicit88_Attribute]
    @inlinable public init(_ value: [PKIX1Explicit88_Attribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.set(of: PKIX1Explicit88_Attribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSetOf(value, identifier: identifier)
    }
}

// MARK: - PKIXCRMF_2009_Authenticator.swift
@usableFromInline typealias PKIXCRMF_2009_Authenticator = ASN1UTF8String

// MARK: - PKIXCRMF_2009_CertId.swift
@usableFromInline struct PKIXCRMF_2009_CertId: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var issuer: PKIX1Implicit88_GeneralName
    @usableFromInline var serialNumber: ArraySlice<UInt8>
    @inlinable init(issuer: PKIX1Implicit88_GeneralName, serialNumber: ArraySlice<UInt8>) {
        self.issuer = issuer
        self.serialNumber = serialNumber

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let issuer: PKIX1Implicit88_GeneralName = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)
            let serialNumber: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)

            return PKIXCRMF_2009_CertId(issuer: issuer, serialNumber: serialNumber)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(issuer)
            try coder.serialize(serialNumber)

        }
    }
}

// MARK: - PKIXCRMF_2009_CertReq.swift
@usableFromInline typealias PKIXCRMF_2009_CertReq = PKIXCRMF_2009_CertRequest

// MARK: - PKIXCRMF_2009_CertReqMessages.swift
@usableFromInline struct PKIXCRMF_2009_CertReqMessages: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIXCRMF_2009_CertReqMsg]
    @inlinable public init(_ value: [PKIXCRMF_2009_CertReqMsg]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIXCRMF_2009_CertReqMsg.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIXCRMF_2009_CertReqMsg.swift
@usableFromInline struct PKIXCRMF_2009_CertReqMsg: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certReq: PKIXCRMF_2009_CertRequest
    @usableFromInline var popo: PKIXCRMF_2009_ProofOfPossession?
    @usableFromInline var regInfo: [PKIX_CommonTypes_2009_SingleAttribute]?
    @inlinable init(certReq: PKIXCRMF_2009_CertRequest, popo: PKIXCRMF_2009_ProofOfPossession?, regInfo: [PKIX_CommonTypes_2009_SingleAttribute]?) {
        self.certReq = certReq
        self.popo = popo
        self.regInfo = regInfo

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certReq: PKIXCRMF_2009_CertRequest = try PKIXCRMF_2009_CertRequest(derEncoded: &nodes)
            var popo: PKIXCRMF_2009_ProofOfPossession? = nil
var peek_popo = nodes
if let next = peek_popo.next(), next.identifier == PKIXCRMF_2009_ProofOfPossession.defaultIdentifier {
    popo = try PKIXCRMF_2009_ProofOfPossession(derEncoded: &nodes)
}
            let regInfo: [PKIX_CommonTypes_2009_SingleAttribute]? = try DER.sequence(of: PKIX_CommonTypes_2009_SingleAttribute.self, identifier: .sequence, nodes: &nodes)

            return PKIXCRMF_2009_CertReqMsg(certReq: certReq, popo: popo, regInfo: regInfo)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(certReq)
            if let popo = self.popo { try coder.serialize(popo) }
            if let regInfo = self.regInfo { try coder.serializeSequenceOf(regInfo) }

        }
    }
}

// MARK: - PKIXCRMF_2009_CertRequest.swift
@usableFromInline struct PKIXCRMF_2009_CertRequest: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var certReqId: ArraySlice<UInt8>
    @usableFromInline var certTemplate: PKIXCRMF_2009_CertTemplate
    @usableFromInline var controls: PKIXCRMF_2009_Controls?
    @inlinable init(certReqId: ArraySlice<UInt8>, certTemplate: PKIXCRMF_2009_CertTemplate, controls: PKIXCRMF_2009_Controls?) {
        self.certReqId = certReqId
        self.certTemplate = certTemplate
        self.controls = controls

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let certReqId: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let certTemplate: PKIXCRMF_2009_CertTemplate = try PKIXCRMF_2009_CertTemplate(derEncoded: &nodes)
            var controls: PKIXCRMF_2009_Controls? = nil
var peek_controls = nodes
if let next = peek_controls.next(), next.identifier == PKIXCRMF_2009_Controls.defaultIdentifier {
    controls = try PKIXCRMF_2009_Controls(derEncoded: &nodes)
}

            return PKIXCRMF_2009_CertRequest(certReqId: certReqId, certTemplate: certTemplate, controls: controls)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(certReqId)
            try coder.serialize(certTemplate)
            if let controls = self.controls { try coder.serialize(controls) }

        }
    }
}

// MARK: - PKIXCRMF_2009_CertTemplate.swift
@usableFromInline struct PKIXCRMF_2009_CertTemplate: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: PKIX1Explicit88_Version?
    @usableFromInline var serialNumber: ArraySlice<UInt8>?
    @usableFromInline var signingAlg: AuthenticationFramework_AlgorithmIdentifier?
    @usableFromInline var issuer: InformationFramework_Name?
    @usableFromInline var validity: PKIXCRMF_2009_OptionalValidity?
    @usableFromInline var subject: InformationFramework_Name?
    @usableFromInline var publicKey: AuthenticationFramework_SubjectPublicKeyInfo?
    @usableFromInline var issuerUID: PKIX1Explicit88_UniqueIdentifier?
    @usableFromInline var subjectUID: PKIX1Explicit88_UniqueIdentifier?
    @usableFromInline var extensions: AuthenticationFramework_Extensions?
    @inlinable init(version: PKIX1Explicit88_Version?, serialNumber: ArraySlice<UInt8>?, signingAlg: AuthenticationFramework_AlgorithmIdentifier?, issuer: InformationFramework_Name?, validity: PKIXCRMF_2009_OptionalValidity?, subject: InformationFramework_Name?, publicKey: AuthenticationFramework_SubjectPublicKeyInfo?, issuerUID: PKIX1Explicit88_UniqueIdentifier?, subjectUID: PKIX1Explicit88_UniqueIdentifier?, extensions: AuthenticationFramework_Extensions?) {
        self.version = version
        self.serialNumber = serialNumber
        self.signingAlg = signingAlg
        self.issuer = issuer
        self.validity = validity
        self.subject = subject
        self.publicKey = publicKey
        self.issuerUID = issuerUID
        self.subjectUID = subjectUID
        self.extensions = extensions

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: PKIX1Explicit88_Version? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let serialNumber: ArraySlice<UInt8>? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let signingAlg: AuthenticationFramework_AlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let issuer: InformationFramework_Name? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
            let validity: PKIXCRMF_2009_OptionalValidity? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
            let subject: InformationFramework_Name? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific))
            let publicKey: AuthenticationFramework_SubjectPublicKeyInfo? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific))
            let issuerUID: PKIX1Explicit88_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 7, tagClass: .contextSpecific))
            let subjectUID: PKIX1Explicit88_UniqueIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 8, tagClass: .contextSpecific))
            let extensions: AuthenticationFramework_Extensions? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 9, tagClass: .contextSpecific))

            return PKIXCRMF_2009_CertTemplate(version: version, serialNumber: serialNumber, signingAlg: signingAlg, issuer: issuer, validity: validity, subject: subject, publicKey: publicKey, issuerUID: issuerUID, subjectUID: subjectUID, extensions: extensions)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let version = self.version { try coder.serializeOptionalImplicitlyTagged(version, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let serialNumber = self.serialNumber { try coder.serializeOptionalImplicitlyTagged(serialNumber, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let signingAlg = self.signingAlg { try coder.serializeOptionalImplicitlyTagged(signingAlg, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let issuer = self.issuer { try coder.serializeOptionalImplicitlyTagged(issuer, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }
            if let validity = self.validity { try coder.serializeOptionalImplicitlyTagged(validity, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) }
            if let subject = self.subject { try coder.serializeOptionalImplicitlyTagged(subject, withIdentifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific)) }
            if let publicKey = self.publicKey { try coder.serializeOptionalImplicitlyTagged(publicKey, withIdentifier: ASN1Identifier(tagWithNumber: 6, tagClass: .contextSpecific)) }
            if let issuerUID = self.issuerUID { try coder.serializeOptionalImplicitlyTagged(issuerUID, withIdentifier: ASN1Identifier(tagWithNumber: 7, tagClass: .contextSpecific)) }
            if let subjectUID = self.subjectUID { try coder.serializeOptionalImplicitlyTagged(subjectUID, withIdentifier: ASN1Identifier(tagWithNumber: 8, tagClass: .contextSpecific)) }
            if let extensions = self.extensions { try coder.serializeOptionalImplicitlyTagged(extensions, withIdentifier: ASN1Identifier(tagWithNumber: 9, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIXCRMF_2009_Controls.swift
@usableFromInline struct PKIXCRMF_2009_Controls: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX_CommonTypes_2009_SingleAttribute]
    @inlinable public init(_ value: [PKIX_CommonTypes_2009_SingleAttribute]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX_CommonTypes_2009_SingleAttribute.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIXCRMF_2009_EncKeyWithID.swift
@usableFromInline struct PKIXCRMF_2009_EncKeyWithID: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var privateKey: PKIXCRMF_2009_PrivateKeyInfo
    @usableFromInline var ident: PKIXCRMF_2009_EncKeyWithID_identifier_Choice?
    @inlinable init(privateKey: PKIXCRMF_2009_PrivateKeyInfo, ident: PKIXCRMF_2009_EncKeyWithID_identifier_Choice?) {
        self.privateKey = privateKey
        self.ident = ident

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let privateKey: PKIXCRMF_2009_PrivateKeyInfo = try PKIXCRMF_2009_PrivateKeyInfo(derEncoded: &nodes)
            var ident: PKIXCRMF_2009_EncKeyWithID_identifier_Choice? = nil
var peek_ident = nodes
if let next = peek_ident.next(), next.identifier == PKIXCRMF_2009_EncKeyWithID_identifier_Choice.defaultIdentifier {
    ident = try PKIXCRMF_2009_EncKeyWithID_identifier_Choice(derEncoded: &nodes)
}

            return PKIXCRMF_2009_EncKeyWithID(privateKey: privateKey, ident: ident)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(privateKey)
            if let ident = self.ident { try coder.serialize(ident) }

        }
    }
}

// MARK: - PKIXCRMF_2009_EncKeyWithID_identifier_Choice.swift
@usableFromInline indirect enum PKIXCRMF_2009_EncKeyWithID_identifier_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case string(ASN1UTF8String)
    case generalName(PKIX1Implicit88_GeneralName)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1UTF8String.defaultIdentifier:
            self = .string(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case PKIX1Implicit88_GeneralName.defaultIdentifier:
            self = .generalName(try PKIX1Implicit88_GeneralName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .string(let string):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(string)
                            }
                        } else {
                            try coder.serialize(string)
                        }
        case .generalName(let generalName):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(generalName)
                            }
                        } else {
                            try coder.serialize(generalName)
                        }

        }
    }

}

// MARK: - PKIXCRMF_2009_EncryptedKey.swift
@usableFromInline indirect enum PKIXCRMF_2009_EncryptedKey: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case encryptedValue(PKIXCRMF_2009_EncryptedValue)
    case envelopedData(PKCS_7_EnvelopedData)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case PKIXCRMF_2009_EncryptedValue.defaultIdentifier:
            self = .encryptedValue(try PKIXCRMF_2009_EncryptedValue(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .envelopedData(try PKCS_7_EnvelopedData(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .encryptedValue(let encryptedValue):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(encryptedValue)
                            }
                        } else {
                            try coder.serialize(encryptedValue)
                        }
        case .envelopedData(let envelopedData): try envelopedData.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIXCRMF_2009_EncryptedValue.swift
@usableFromInline struct PKIXCRMF_2009_EncryptedValue: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var intendedAlg: AuthenticationFramework_AlgorithmIdentifier?
    @usableFromInline var symmAlg: AuthenticationFramework_AlgorithmIdentifier?
    @usableFromInline var encSymmKey: ASN1BitString?
    @usableFromInline var keyAlg: AuthenticationFramework_AlgorithmIdentifier?
    @usableFromInline var valueHint: ASN1OctetString?
    @usableFromInline var encValue: ASN1BitString
    @inlinable init(intendedAlg: AuthenticationFramework_AlgorithmIdentifier?, symmAlg: AuthenticationFramework_AlgorithmIdentifier?, encSymmKey: ASN1BitString?, keyAlg: AuthenticationFramework_AlgorithmIdentifier?, valueHint: ASN1OctetString?, encValue: ASN1BitString) {
        self.intendedAlg = intendedAlg
        self.symmAlg = symmAlg
        self.encSymmKey = encSymmKey
        self.keyAlg = keyAlg
        self.valueHint = valueHint
        self.encValue = encValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let intendedAlg: AuthenticationFramework_AlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let symmAlg: AuthenticationFramework_AlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
            let encSymmKey: ASN1BitString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
            let keyAlg: AuthenticationFramework_AlgorithmIdentifier? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
            let valueHint: ASN1OctetString? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))
            let encValue: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIXCRMF_2009_EncryptedValue(intendedAlg: intendedAlg, symmAlg: symmAlg, encSymmKey: encSymmKey, keyAlg: keyAlg, valueHint: valueHint, encValue: encValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let intendedAlg = self.intendedAlg { try coder.serializeOptionalImplicitlyTagged(intendedAlg, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let symmAlg = self.symmAlg { try coder.serializeOptionalImplicitlyTagged(symmAlg, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }
            if let encSymmKey = self.encSymmKey { try coder.serializeOptionalImplicitlyTagged(encSymmKey, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) }
            if let keyAlg = self.keyAlg { try coder.serializeOptionalImplicitlyTagged(keyAlg, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) }
            if let valueHint = self.valueHint { try coder.serializeOptionalImplicitlyTagged(valueHint, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) }
            try coder.serialize(encValue)

        }
    }
}

// MARK: - PKIXCRMF_2009_Extensions.swift
@usableFromInline typealias PKIXCRMF_2009_Extensions = AuthenticationFramework_Extensions

// MARK: - PKIXCRMF_2009_GeneralName.swift
@usableFromInline typealias PKIXCRMF_2009_GeneralName = PKIX1Implicit88_GeneralName

// MARK: - PKIXCRMF_2009_KeyGenParameters.swift
@usableFromInline typealias PKIXCRMF_2009_KeyGenParameters = ASN1OctetString

// MARK: - PKIXCRMF_2009_Name.swift
@usableFromInline typealias PKIXCRMF_2009_Name = InformationFramework_Name

// MARK: - PKIXCRMF_2009_OldCertId.swift
@usableFromInline typealias PKIXCRMF_2009_OldCertId = PKIXCRMF_2009_CertId

// MARK: - PKIXCRMF_2009_OptionalValidity.swift
@usableFromInline struct PKIXCRMF_2009_OptionalValidity: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var notBefore: PKIX1Explicit88_Time?
    @usableFromInline var notAfter: PKIX1Explicit88_Time?
    @inlinable init(notBefore: PKIX1Explicit88_Time?, notAfter: PKIX1Explicit88_Time?) {
        self.notBefore = notBefore
        self.notAfter = notAfter

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let notBefore: PKIX1Explicit88_Time? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let notAfter: PKIX1Explicit88_Time? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))

            return PKIXCRMF_2009_OptionalValidity(notBefore: notBefore, notAfter: notAfter)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let notBefore = self.notBefore { try coder.serializeOptionalImplicitlyTagged(notBefore, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            if let notAfter = self.notAfter { try coder.serializeOptionalImplicitlyTagged(notAfter, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIXCRMF_2009_PBMParameter.swift
@usableFromInline struct PKIXCRMF_2009_PBMParameter: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var salt: ASN1OctetString
    @usableFromInline var owf: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var iterationCount: ArraySlice<UInt8>
    @usableFromInline var mac: AuthenticationFramework_AlgorithmIdentifier
    @inlinable init(salt: ASN1OctetString, owf: AuthenticationFramework_AlgorithmIdentifier, iterationCount: ArraySlice<UInt8>, mac: AuthenticationFramework_AlgorithmIdentifier) {
        self.salt = salt
        self.owf = owf
        self.iterationCount = iterationCount
        self.mac = mac

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let salt: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            let owf: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let iterationCount: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let mac: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)

            return PKIXCRMF_2009_PBMParameter(salt: salt, owf: owf, iterationCount: iterationCount, mac: mac)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(salt)
            try coder.serialize(owf)
            try coder.serialize(iterationCount)
            try coder.serialize(mac)

        }
    }
}

// MARK: - PKIXCRMF_2009_PKIArchiveOptions.swift
@usableFromInline indirect enum PKIXCRMF_2009_PKIArchiveOptions: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case encryptedPrivKey(PKIXCRMF_2009_EncryptedKey)
    case keyGenParameters(PKIXCRMF_2009_KeyGenParameters)
    case archiveRemGenPrivKey(Bool)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .encryptedPrivKey(try PKIXCRMF_2009_EncryptedKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .keyGenParameters(try PKIXCRMF_2009_KeyGenParameters(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .archiveRemGenPrivKey(try Bool(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .encryptedPrivKey(let encryptedPrivKey): try encryptedPrivKey.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .keyGenParameters(let keyGenParameters): try keyGenParameters.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .archiveRemGenPrivKey(let archiveRemGenPrivKey): try archiveRemGenPrivKey.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIXCRMF_2009_PKIPublicationInfo.swift
@usableFromInline struct PKIXCRMF_2009_PKIPublicationInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var action: PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum
    @usableFromInline var pubInfos: [PKIXCRMF_2009_SinglePubInfo]?
    @inlinable init(action: PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum, pubInfos: [PKIXCRMF_2009_SinglePubInfo]?) {
        self.action = action
        self.pubInfos = pubInfos

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let actionVal = try Int(derEncoded: &nodes)
            let action = PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum(rawValue: actionVal)
            let pubInfos: [PKIXCRMF_2009_SinglePubInfo]? = try DER.sequence(of: PKIXCRMF_2009_SinglePubInfo.self, identifier: .sequence, nodes: &nodes)

            return PKIXCRMF_2009_PKIPublicationInfo(action: action, pubInfos: pubInfos)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try action.serialize(into: &coder, withIdentifier: .integer)
            if let pubInfos = self.pubInfos { try coder.serializeSequenceOf(pubInfos) }

        }
    }
}

// MARK: - PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum.swift
public struct PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum, rhs: PKIXCRMF_2009_PKIPublicationInfo_action_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let dontPublish = Self(rawValue: 0)
    public static let pleasePublish = Self(rawValue: 1)
}

// MARK: - PKIXCRMF_2009_PKMACValue.swift
@usableFromInline struct PKIXCRMF_2009_PKMACValue: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algId: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var value: ASN1BitString
    @inlinable init(algId: AuthenticationFramework_AlgorithmIdentifier, value: ASN1BitString) {
        self.algId = algId
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algId: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let value: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIXCRMF_2009_PKMACValue(algId: algId, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algId)
            try coder.serialize(value)

        }
    }
}

// MARK: - PKIXCRMF_2009_POPOPrivKey.swift
@usableFromInline indirect enum PKIXCRMF_2009_POPOPrivKey: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case thisMessage(ASN1BitString)
    case subsequentMessage(PKIXCRMF_2009_SubsequentMessage)
    case dhMAC(ASN1BitString)
    case agreeMAC(PKIXCRMF_2009_PKMACValue)
    case encryptedKey(PKCS_7_EnvelopedData)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .thisMessage(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .subsequentMessage(try PKIXCRMF_2009_SubsequentMessage(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .dhMAC(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .agreeMAC(try PKIXCRMF_2009_PKMACValue(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            self = .encryptedKey(try PKCS_7_EnvelopedData(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .thisMessage(let thisMessage): try thisMessage.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .subsequentMessage(let subsequentMessage): try subsequentMessage.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .dhMAC(let dhMAC): try dhMAC.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .agreeMAC(let agreeMAC): try agreeMAC.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))
        case .encryptedKey(let encryptedKey): try encryptedKey.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIXCRMF_2009_POPOSigningKey.swift
@usableFromInline struct PKIXCRMF_2009_POPOSigningKey: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var poposkInput: PKIXCRMF_2009_POPOSigningKeyInput?
    @usableFromInline var algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var signature: ASN1BitString
    @inlinable init(poposkInput: PKIXCRMF_2009_POPOSigningKeyInput?, algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier, signature: ASN1BitString) {
        self.poposkInput = poposkInput
        self.algorithmIdentifier = algorithmIdentifier
        self.signature = signature

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let poposkInput: PKIXCRMF_2009_POPOSigningKeyInput? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            let algorithmIdentifier: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let signature: ASN1BitString = try ASN1BitString(derEncoded: &nodes)

            return PKIXCRMF_2009_POPOSigningKey(poposkInput: poposkInput, algorithmIdentifier: algorithmIdentifier, signature: signature)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let poposkInput = self.poposkInput { try coder.serializeOptionalImplicitlyTagged(poposkInput, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }
            try coder.serialize(algorithmIdentifier)
            try coder.serialize(signature)

        }
    }
}

// MARK: - PKIXCRMF_2009_POPOSigningKeyInput.swift
@usableFromInline struct PKIXCRMF_2009_POPOSigningKeyInput: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var authInfo: PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice
    @usableFromInline var publicKey: AuthenticationFramework_SubjectPublicKeyInfo
    @inlinable init(authInfo: PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice, publicKey: AuthenticationFramework_SubjectPublicKeyInfo) {
        self.authInfo = authInfo
        self.publicKey = publicKey

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let authInfo: PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice = try PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice(derEncoded: &nodes)
            let publicKey: AuthenticationFramework_SubjectPublicKeyInfo = try AuthenticationFramework_SubjectPublicKeyInfo(derEncoded: &nodes)

            return PKIXCRMF_2009_POPOSigningKeyInput(authInfo: authInfo, publicKey: publicKey)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(authInfo)
            try coder.serialize(publicKey)

        }
    }
}

// MARK: - PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice.swift
@usableFromInline indirect enum PKIXCRMF_2009_POPOSigningKeyInput_authInfo_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case sender(PKIX1Implicit88_GeneralName)
    case publicKeyMAC(PKIXCRMF_2009_PKMACValue)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .sender(try PKIX1Implicit88_GeneralName(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case PKIXCRMF_2009_PKMACValue.defaultIdentifier:
            self = .publicKeyMAC(try PKIXCRMF_2009_PKMACValue(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .sender(let sender): try sender.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .publicKeyMAC(let publicKeyMAC):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(publicKeyMAC)
                            }
                        } else {
                            try coder.serialize(publicKeyMAC)
                        }

        }
    }

}

// MARK: - PKIXCRMF_2009_PrivateKeyInfo.swift
@usableFromInline struct PKIXCRMF_2009_PrivateKeyInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var version: ArraySlice<UInt8>
    @usableFromInline var privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier
    @usableFromInline var privateKey: ASN1OctetString
    @usableFromInline var attributes: PKIXCRMF_2009_Attributes?
    @inlinable init(version: ArraySlice<UInt8>, privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier, privateKey: ASN1OctetString, attributes: PKIXCRMF_2009_Attributes?) {
        self.version = version
        self.privateKeyAlgorithm = privateKeyAlgorithm
        self.privateKey = privateKey
        self.attributes = attributes

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let version: ArraySlice<UInt8> = try ArraySlice<UInt8>(derEncoded: &nodes)
            let privateKeyAlgorithm: AuthenticationFramework_AlgorithmIdentifier = try AuthenticationFramework_AlgorithmIdentifier(derEncoded: &nodes)
            let privateKey: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            let attributes: PKIXCRMF_2009_Attributes? = try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))

            return PKIXCRMF_2009_PrivateKeyInfo(version: version, privateKeyAlgorithm: privateKeyAlgorithm, privateKey: privateKey, attributes: attributes)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(version)
            try coder.serialize(privateKeyAlgorithm)
            try coder.serialize(privateKey)
            if let attributes = self.attributes { try coder.serializeOptionalImplicitlyTagged(attributes, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) }

        }
    }
}

// MARK: - PKIXCRMF_2009_ProofOfPossession.swift
@usableFromInline indirect enum PKIXCRMF_2009_ProofOfPossession: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case raVerified(ASN1Null)
    case signature(PKIXCRMF_2009_POPOSigningKey)
    case keyEncipherment(PKIXCRMF_2009_POPOPrivKey)
    case keyAgreement(PKIXCRMF_2009_POPOPrivKey)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            self = .raVerified(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .signature(try PKIXCRMF_2009_POPOSigningKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .keyEncipherment(try PKIXCRMF_2009_POPOPrivKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            self = .keyAgreement(try PKIXCRMF_2009_POPOPrivKey(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .raVerified(let raVerified): try raVerified.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
        case .signature(let signature): try signature.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific))
        case .keyEncipherment(let keyEncipherment): try keyEncipherment.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific))
        case .keyAgreement(let keyAgreement): try keyAgreement.serialize(into: &coder, withIdentifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific))

        }
    }

}

// MARK: - PKIXCRMF_2009_ProtocolEncrKey.swift
@usableFromInline typealias PKIXCRMF_2009_ProtocolEncrKey = PKIXCRMF_2009_SubjectPublicKeyInfo

// MARK: - PKIXCRMF_2009_RegToken.swift
@usableFromInline typealias PKIXCRMF_2009_RegToken = ASN1UTF8String

// MARK: - PKIXCRMF_2009_SinglePubInfo.swift
@usableFromInline struct PKIXCRMF_2009_SinglePubInfo: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var pubMethod: PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum
    @usableFromInline var pubLocation: PKIX1Implicit88_GeneralName?
    @inlinable init(pubMethod: PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum, pubLocation: PKIX1Implicit88_GeneralName?) {
        self.pubMethod = pubMethod
        self.pubLocation = pubLocation

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let pubMethodVal = try Int(derEncoded: &nodes)
            let pubMethod = PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum(rawValue: pubMethodVal)
            var pubLocation: PKIX1Implicit88_GeneralName? = nil
var peek_pubLocation = nodes
if let next = peek_pubLocation.next(), next.identifier == PKIX1Implicit88_GeneralName.defaultIdentifier {
    pubLocation = try PKIX1Implicit88_GeneralName(derEncoded: &nodes)
}

            return PKIXCRMF_2009_SinglePubInfo(pubMethod: pubMethod, pubLocation: pubLocation)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try pubMethod.serialize(into: &coder, withIdentifier: .integer)
            if let pubLocation = self.pubLocation { try coder.serialize(pubLocation) }

        }
    }
}

// MARK: - PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum.swift
public struct PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum, rhs: PKIXCRMF_2009_SinglePubInfo_pubMethod_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let dontCare = Self(rawValue: 0)
    public static let x500 = Self(rawValue: 1)
    public static let web = Self(rawValue: 2)
    public static let ldap = Self(rawValue: 3)
}

// MARK: - PKIXCRMF_2009_SubjectPublicKeyInfo.swift
@usableFromInline typealias PKIXCRMF_2009_SubjectPublicKeyInfo = AuthenticationFramework_SubjectPublicKeyInfo

// MARK: - PKIXCRMF_2009_SubsequentMessage.swift
public struct PKIXCRMF_2009_SubsequentMessage : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: PKIXCRMF_2009_SubsequentMessage, rhs: PKIXCRMF_2009_SubsequentMessage) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let encrCert = Self(rawValue: 0)
    public static let challengeResp = Self(rawValue: 1)
}

// MARK: - PKIXCRMF_2009_UTF8Pairs.swift
@usableFromInline typealias PKIXCRMF_2009_UTF8Pairs = ASN1UTF8String

// MARK: - PKIXCRMF_2009_id_PasswordBasedMac_oid.swift
public let PKIXCRMF_2009_id_PasswordBasedMac: ASN1ObjectIdentifier = [1, 2, 840, 113533, 7, 66, 13]

// MARK: - PKIXCRMF_2009_id_ct_encKeyWithID_oid.swift
public let PKIXCRMF_2009_id_ct_encKeyWithID: ASN1ObjectIdentifier = PKIXCRMF_2009_id_ct + [21]

// MARK: - PKIXCRMF_2009_id_ct_oid.swift
public let PKIXCRMF_2009_id_ct: ASN1ObjectIdentifier = PKIXCRMF_2009_id_smime + [1]

// MARK: - PKIXCRMF_2009_id_pkip_oid.swift
public let PKIXCRMF_2009_id_pkip: ASN1ObjectIdentifier = PKIX1Explicit88_id_pkix + [5]

// MARK: - PKIXCRMF_2009_id_regCtrl_authenticator_oid.swift
public let PKIXCRMF_2009_id_regCtrl_authenticator: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [2]

// MARK: - PKIXCRMF_2009_id_regCtrl_oid.swift
public let PKIXCRMF_2009_id_regCtrl: ASN1ObjectIdentifier = PKIXCRMF_2009_id_pkip + [1]

// MARK: - PKIXCRMF_2009_id_regCtrl_oldCertID_oid.swift
public let PKIXCRMF_2009_id_regCtrl_oldCertID: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [5]

// MARK: - PKIXCRMF_2009_id_regCtrl_pkiArchiveOptions_oid.swift
public let PKIXCRMF_2009_id_regCtrl_pkiArchiveOptions: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [4]

// MARK: - PKIXCRMF_2009_id_regCtrl_pkiPublicationInfo_oid.swift
public let PKIXCRMF_2009_id_regCtrl_pkiPublicationInfo: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [3]

// MARK: - PKIXCRMF_2009_id_regCtrl_protocolEncrKey_oid.swift
public let PKIXCRMF_2009_id_regCtrl_protocolEncrKey: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [6]

// MARK: - PKIXCRMF_2009_id_regCtrl_regToken_oid.swift
public let PKIXCRMF_2009_id_regCtrl_regToken: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regCtrl + [1]

// MARK: - PKIXCRMF_2009_id_regInfo_certReq_oid.swift
public let PKIXCRMF_2009_id_regInfo_certReq: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regInfo + [2]

// MARK: - PKIXCRMF_2009_id_regInfo_oid.swift
public let PKIXCRMF_2009_id_regInfo: ASN1ObjectIdentifier = PKIXCRMF_2009_id_pkip + [2]

// MARK: - PKIXCRMF_2009_id_regInfo_utf8Pairs_oid.swift
public let PKIXCRMF_2009_id_regInfo_utf8Pairs: ASN1ObjectIdentifier = PKIXCRMF_2009_id_regInfo + [1]

// MARK: - PKIXCRMF_2009_id_smime_oid.swift
public let PKIXCRMF_2009_id_smime: ASN1ObjectIdentifier = [1, 2, 840, 113549, 1, 9, 16]

// MARK: - PKIX_CommonTypes_2009_Attribute.swift
@usableFromInline struct PKIX_CommonTypes_2009_Attribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return PKIX_CommonTypes_2009_Attribute(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - PKIX_CommonTypes_2009_AttributeSet.swift
@usableFromInline struct PKIX_CommonTypes_2009_AttributeSet: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var values: [ASN1Any]
    @inlinable init(type: ASN1ObjectIdentifier, values: [ASN1Any]) {
        self.type = type
        self.values = values

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let values: [ASN1Any] = try DER.set(of: ASN1Any.self, identifier: .set, nodes: &nodes)

            return PKIX_CommonTypes_2009_AttributeSet(type: type, values: values)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serializeSetOf(values)

        }
    }
}

// MARK: - PKIX_CommonTypes_2009_Extension.swift
@usableFromInline struct PKIX_CommonTypes_2009_Extension: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var extnID: ASN1ObjectIdentifier
    @usableFromInline var critical: Bool?
    @usableFromInline var extnValue: ASN1OctetString
    @inlinable init(extnID: ASN1ObjectIdentifier, critical: Bool?, extnValue: ASN1OctetString) {
        self.extnID = extnID
        self.critical = critical
        self.extnValue = extnValue

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let extnID: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let critical: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            let extnValue: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)

            return PKIX_CommonTypes_2009_Extension(extnID: extnID, critical: critical, extnValue: extnValue)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(extnID)
            if let critical = self.critical { try coder.serialize(critical) }
            try coder.serialize(extnValue)

        }
    }
}

// MARK: - PKIX_CommonTypes_2009_Extensions.swift
@usableFromInline struct PKIX_CommonTypes_2009_Extensions: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX_CommonTypes_2009_Extension]
    @inlinable public init(_ value: [PKIX_CommonTypes_2009_Extension]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX_CommonTypes_2009_Extension.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - PKIX_CommonTypes_2009_MATCHING_RULE.swift
@usableFromInline struct PKIX_CommonTypes_2009_MATCHING_RULE: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var algorithm: ASN1ObjectIdentifier
    @usableFromInline var parameters: ASN1Any?
    @inlinable init(algorithm: ASN1ObjectIdentifier, parameters: ASN1Any? = nil) {
        self.algorithm = algorithm
        self.parameters = parameters
    }
    @inlinable init(derEncoded root: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let algorithm = try ASN1ObjectIdentifier(derEncoded: &nodes)
            var parameters: ASN1Any? = nil
            if let nextNode = nodes.next() {
                parameters = try ASN1Any(derEncoded: nextNode)
            }
            return PKIX_CommonTypes_2009_MATCHING_RULE(algorithm: algorithm, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(algorithm)
            if let parameters = parameters { try coder.serialize(parameters) }
        }
    }
}

// MARK: - PKIX_CommonTypes_2009_SECURITY_CATEGORY.swift
@usableFromInline typealias PKIX_CommonTypes_2009_SECURITY_CATEGORY = ASN1Any

// MARK: - PKIX_CommonTypes_2009_SecurityCategory.swift
@usableFromInline struct PKIX_CommonTypes_2009_SecurityCategory: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var value: ASN1Any
    @inlinable init(type: ASN1ObjectIdentifier, value: ASN1Any) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = (try DER.optionalImplicitlyTagged(&nodes, tag: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)))!
            let value: ASN1Any = try DER.explicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ASN1Any(derEncoded: node) }

            return PKIX_CommonTypes_2009_SecurityCategory(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serializeOptionalImplicitlyTagged(type, withIdentifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific))
            try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(value) }

        }
    }
}

// MARK: - PKIX_CommonTypes_2009_SingleAttribute.swift
@usableFromInline struct PKIX_CommonTypes_2009_SingleAttribute: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var type: ASN1ObjectIdentifier
    @usableFromInline var value: ASN1Any
    @inlinable init(type: ASN1ObjectIdentifier, value: ASN1Any) {
        self.type = type
        self.value = value

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let type: ASN1ObjectIdentifier = try ASN1ObjectIdentifier(derEncoded: &nodes)
            let value: ASN1Any = try ASN1Any(derEncoded: &nodes)

            return PKIX_CommonTypes_2009_SingleAttribute(type: type, value: value)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(type)
            try coder.serialize(value)

        }
    }
}

// MARK: - SelectedAttributeTypes_CaseIgnoreListMatch.swift
@usableFromInline struct SelectedAttributeTypes_CaseIgnoreListMatch: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [SelectedAttributeTypes_DirectoryString]
    @inlinable public init(_ value: [SelectedAttributeTypes_DirectoryString]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: SelectedAttributeTypes_DirectoryString.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_CountryName.swift
@usableFromInline typealias SelectedAttributeTypes_CountryName = ASN1PrintableString

// MARK: - SelectedAttributeTypes_Criteria.swift
@usableFromInline indirect enum SelectedAttributeTypes_Criteria: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case type(SelectedAttributeTypes_CriteriaItem)
    case and([SelectedAttributeTypes_Criteria])
    case or([SelectedAttributeTypes_Criteria])
    case not(SelectedAttributeTypes_Criteria)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .type(try SelectedAttributeTypes_CriteriaItem(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            self = .and(try DER.set(of: SelectedAttributeTypes_Criteria.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            self = .or(try DER.set(of: SelectedAttributeTypes_Criteria.self, identifier: rootNode.identifier, rootNode: rootNode))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .not(try SelectedAttributeTypes_Criteria(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .type(let type): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try type.serialize(into: &coder) }
        case .and(let and): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try coder.serializeSetOf(and) }
        case .or(let or): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try coder.serializeSetOf(or) }
        case .not(let not): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try not.serialize(into: &coder) }

        }
    }

}

// MARK: - SelectedAttributeTypes_CriteriaItem.swift
@usableFromInline indirect enum SelectedAttributeTypes_CriteriaItem: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case equality(PKIX1Explicit88_AttributeType)
    case substrings(PKIX1Explicit88_AttributeType)
    case greaterOrEqual(PKIX1Explicit88_AttributeType)
    case lessOrEqual(PKIX1Explicit88_AttributeType)
    case approximateMatch(PKIX1Explicit88_AttributeType)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .equality(try PKIX1Explicit88_AttributeType(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .substrings(try PKIX1Explicit88_AttributeType(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .greaterOrEqual(try PKIX1Explicit88_AttributeType(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .lessOrEqual(try PKIX1Explicit88_AttributeType(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .approximateMatch(try PKIX1Explicit88_AttributeType(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .equality(let equality): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try equality.serialize(into: &coder) }
        case .substrings(let substrings): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try substrings.serialize(into: &coder) }
        case .greaterOrEqual(let greaterOrEqual): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try greaterOrEqual.serialize(into: &coder) }
        case .lessOrEqual(let lessOrEqual): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try lessOrEqual.serialize(into: &coder) }
        case .approximateMatch(let approximateMatch): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) { coder in try approximateMatch.serialize(into: &coder) }

        }
    }

}

// MARK: - SelectedAttributeTypes_DayTime.swift
@usableFromInline struct SelectedAttributeTypes_DayTime: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var hour: ArraySlice<UInt8>
    @usableFromInline var minute: ArraySlice<UInt8>?
    @usableFromInline var second: ArraySlice<UInt8>?
    @inlinable init(hour: ArraySlice<UInt8>, minute: ArraySlice<UInt8>?, second: ArraySlice<UInt8>?) {
        self.hour = hour
        self.minute = minute
        self.second = second

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let hour: ArraySlice<UInt8> = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ArraySlice<UInt8>(derEncoded: node) }
            let minute: ArraySlice<UInt8>? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ArraySlice<UInt8>(derEncoded: node) }
            let second: ArraySlice<UInt8>? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try ArraySlice<UInt8>(derEncoded: node) }

            return SelectedAttributeTypes_DayTime(hour: hour, minute: minute, second: second)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(hour) }
            if let minute = self.minute { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(minute) } }
            if let second = self.second { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(second) } }

        }
    }
}

// MARK: - SelectedAttributeTypes_DayTimeBand.swift
@usableFromInline struct SelectedAttributeTypes_DayTimeBand: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var startDayTime: SelectedAttributeTypes_DayTime?
    @usableFromInline var endDayTime: SelectedAttributeTypes_DayTime?
    @inlinable init(startDayTime: SelectedAttributeTypes_DayTime?, endDayTime: SelectedAttributeTypes_DayTime?) {
        self.startDayTime = startDayTime
        self.endDayTime = endDayTime

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let startDayTime: SelectedAttributeTypes_DayTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_DayTime(derEncoded: node) }
            let endDayTime: SelectedAttributeTypes_DayTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_DayTime(derEncoded: node) }

            return SelectedAttributeTypes_DayTimeBand(startDayTime: startDayTime, endDayTime: endDayTime)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let startDayTime = self.startDayTime { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(startDayTime) } }
            if let endDayTime = self.endDayTime { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(endDayTime) } }

        }
    }
}

// MARK: - SelectedAttributeTypes_DestinationIndicator.swift
@usableFromInline typealias SelectedAttributeTypes_DestinationIndicator = ASN1PrintableString

// MARK: - SelectedAttributeTypes_DirectoryString.swift
@usableFromInline indirect enum SelectedAttributeTypes_DirectoryString: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case teletexString(ASN1TeletexString)
    case printableString(ASN1PrintableString)
    case bmpString(ASN1BMPString)
    case universalString(ASN1UniversalString)
    case uTF8String(ASN1UTF8String)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1TeletexString.defaultIdentifier:
            self = .teletexString(try ASN1TeletexString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1PrintableString.defaultIdentifier:
            self = .printableString(try ASN1PrintableString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BMPString.defaultIdentifier:
            self = .bmpString(try ASN1BMPString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UniversalString.defaultIdentifier:
            self = .universalString(try ASN1UniversalString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1UTF8String.defaultIdentifier:
            self = .uTF8String(try ASN1UTF8String(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .teletexString(let teletexString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(teletexString)
                            }
                        } else {
                            try coder.serialize(teletexString)
                        }
        case .printableString(let printableString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(printableString)
                            }
                        } else {
                            try coder.serialize(printableString)
                        }
        case .bmpString(let bmpString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bmpString)
                            }
                        } else {
                            try coder.serialize(bmpString)
                        }
        case .universalString(let universalString):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(universalString)
                            }
                        } else {
                            try coder.serialize(universalString)
                        }
        case .uTF8String(let uTF8String):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(uTF8String)
                            }
                        } else {
                            try coder.serialize(uTF8String)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_EnhancedGuide.swift
@usableFromInline struct SelectedAttributeTypes_EnhancedGuide: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var objectClass: ASN1ObjectIdentifier
    @usableFromInline var criteria: SelectedAttributeTypes_Criteria
    @usableFromInline var subset: SelectedAttributeTypes_EnhancedGuide_subset_IntEnum?
    @inlinable init(objectClass: ASN1ObjectIdentifier, criteria: SelectedAttributeTypes_Criteria, subset: SelectedAttributeTypes_EnhancedGuide_subset_IntEnum?) {
        self.objectClass = objectClass
        self.criteria = criteria
        self.subset = subset

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let objectClass: ASN1ObjectIdentifier = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1ObjectIdentifier(derEncoded: node) }
            let criteria: SelectedAttributeTypes_Criteria = try DER.explicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_Criteria(derEncoded: node) }
            let subsetVal = try Int(derEncoded: &nodes)
            let subset = SelectedAttributeTypes_EnhancedGuide_subset_IntEnum(rawValue: subsetVal)

            return SelectedAttributeTypes_EnhancedGuide(objectClass: objectClass, criteria: criteria, subset: subset)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(objectClass) }
            try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(criteria) }
            if let subset = self.subset { try coder.serialize(subset.rawValue, explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) }

        }
    }
}

// MARK: - SelectedAttributeTypes_EnhancedGuide_subset_IntEnum.swift
public struct SelectedAttributeTypes_EnhancedGuide_subset_IntEnum : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: SelectedAttributeTypes_EnhancedGuide_subset_IntEnum, rhs: SelectedAttributeTypes_EnhancedGuide_subset_IntEnum) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let baseObject = Self(rawValue: 0)
    public static let oneLevel = Self(rawValue: 1)
    public static let wholeSubtree = Self(rawValue: 2)
}

// MARK: - SelectedAttributeTypes_FacsimileTelephoneNumber.swift
@usableFromInline struct SelectedAttributeTypes_FacsimileTelephoneNumber: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var telephoneNumber: SelectedAttributeTypes_TelephoneNumber
    @usableFromInline var parameters: SelectedAttributeTypes_G3FacsimileNonBasicParameters?
    @inlinable init(telephoneNumber: SelectedAttributeTypes_TelephoneNumber, parameters: SelectedAttributeTypes_G3FacsimileNonBasicParameters?) {
        self.telephoneNumber = telephoneNumber
        self.parameters = parameters

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let telephoneNumber: SelectedAttributeTypes_TelephoneNumber = try SelectedAttributeTypes_TelephoneNumber(derEncoded: &nodes)
            var parameters: SelectedAttributeTypes_G3FacsimileNonBasicParameters? = nil
var peek_parameters = nodes
if let next = peek_parameters.next(), next.identifier == SelectedAttributeTypes_G3FacsimileNonBasicParameters.defaultIdentifier {
    parameters = try SelectedAttributeTypes_G3FacsimileNonBasicParameters(derEncoded: &nodes)
}

            return SelectedAttributeTypes_FacsimileTelephoneNumber(telephoneNumber: telephoneNumber, parameters: parameters)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(telephoneNumber)
            if let parameters = self.parameters { try coder.serialize(parameters) }

        }
    }
}

// MARK: - SelectedAttributeTypes_G3FacsimileNonBasicParameters.swift
@usableFromInline typealias SelectedAttributeTypes_G3FacsimileNonBasicParameters = ASN1BitString

// MARK: - SelectedAttributeTypes_Guide.swift
@usableFromInline struct SelectedAttributeTypes_Guide: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .set }
    @usableFromInline var objectClass: ASN1ObjectIdentifier?
    @usableFromInline var criteria: SelectedAttributeTypes_Criteria
    @inlinable init(objectClass: ASN1ObjectIdentifier?, criteria: SelectedAttributeTypes_Criteria) {
        self.objectClass = objectClass
        self.criteria = criteria

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.set(root, identifier: identifier) { nodes in
            let objectClass: ASN1ObjectIdentifier? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1ObjectIdentifier(derEncoded: node) }
            let criteria: SelectedAttributeTypes_Criteria = try DER.explicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_Criteria(derEncoded: node) }

            return SelectedAttributeTypes_Guide(objectClass: objectClass, criteria: criteria)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let objectClass = self.objectClass { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(objectClass) } }
            try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(criteria) }

        }
    }
}

// MARK: - SelectedAttributeTypes_InternationalISDNNumber.swift
@usableFromInline typealias SelectedAttributeTypes_InternationalISDNNumber = ASN1PrintableString

// MARK: - SelectedAttributeTypes_LanguageContextSyntax.swift
@usableFromInline typealias SelectedAttributeTypes_LanguageContextSyntax = ASN1PrintableString

// MARK: - SelectedAttributeTypes_LocaleContextSyntax.swift
@usableFromInline indirect enum SelectedAttributeTypes_LocaleContextSyntax: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case localeID1(ASN1ObjectIdentifier)
    case localeID2(SelectedAttributeTypes_DirectoryString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1ObjectIdentifier.defaultIdentifier:
            self = .localeID1(try ASN1ObjectIdentifier(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case SelectedAttributeTypes_DirectoryString.defaultIdentifier:
            self = .localeID2(try SelectedAttributeTypes_DirectoryString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .localeID1(let localeID1):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(localeID1)
                            }
                        } else {
                            try coder.serialize(localeID1)
                        }
        case .localeID2(let localeID2):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(localeID2)
                            }
                        } else {
                            try coder.serialize(localeID2)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_MultipleMatchingLocalities.swift
@usableFromInline struct SelectedAttributeTypes_MultipleMatchingLocalities: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var matchingRuleUsed: ASN1ObjectIdentifier?
    @usableFromInline var attributeList: [InformationFramework_AttributeValueAssertion]
    @inlinable init(matchingRuleUsed: ASN1ObjectIdentifier?, attributeList: [InformationFramework_AttributeValueAssertion]) {
        self.matchingRuleUsed = matchingRuleUsed
        self.attributeList = attributeList

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            var matchingRuleUsed: ASN1ObjectIdentifier? = nil
var peek_matchingRuleUsed = nodes
if let next = peek_matchingRuleUsed.next(), next.identifier == ASN1ObjectIdentifier.defaultIdentifier {
    matchingRuleUsed = try ASN1ObjectIdentifier(derEncoded: &nodes)
}
            let attributeList: [InformationFramework_AttributeValueAssertion] = try DER.sequence(of: InformationFramework_AttributeValueAssertion.self, identifier: .sequence, nodes: &nodes)

            return SelectedAttributeTypes_MultipleMatchingLocalities(matchingRuleUsed: matchingRuleUsed, attributeList: attributeList)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let matchingRuleUsed = self.matchingRuleUsed { try coder.serialize(matchingRuleUsed) }
            try coder.serializeSequenceOf(attributeList)

        }
    }
}

// MARK: - SelectedAttributeTypes_NameAndOptionalUID.swift
@usableFromInline struct SelectedAttributeTypes_NameAndOptionalUID: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var dn: PKIX1Explicit88_DistinguishedName
    @usableFromInline var uid: SelectedAttributeTypes_UniqueIdentifier?
    @inlinable init(dn: PKIX1Explicit88_DistinguishedName, uid: SelectedAttributeTypes_UniqueIdentifier?) {
        self.dn = dn
        self.uid = uid

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let dn: PKIX1Explicit88_DistinguishedName = try PKIX1Explicit88_DistinguishedName(derEncoded: &nodes)
            var uid: SelectedAttributeTypes_UniqueIdentifier? = nil
var peek_uid = nodes
if let next = peek_uid.next(), next.identifier == SelectedAttributeTypes_UniqueIdentifier.defaultIdentifier {
    uid = try SelectedAttributeTypes_UniqueIdentifier(derEncoded: &nodes)
}

            return SelectedAttributeTypes_NameAndOptionalUID(dn: dn, uid: uid)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(dn)
            if let uid = self.uid { try coder.serialize(uid) }

        }
    }
}

// MARK: - SelectedAttributeTypes_NamedDay.swift
@usableFromInline indirect enum SelectedAttributeTypes_NamedDay: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case intNamedDays(SelectedAttributeTypes_NamedDay_intNamedDays_Enum)
    case bitNamedDays(ASN1BitString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case SelectedAttributeTypes_NamedDay_intNamedDays_Enum.defaultIdentifier:
            self = .intNamedDays(try SelectedAttributeTypes_NamedDay_intNamedDays_Enum(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1BitString.defaultIdentifier:
            self = .bitNamedDays(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .intNamedDays(let intNamedDays):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(intNamedDays)
                            }
                        } else {
                            try coder.serialize(intNamedDays)
                        }
        case .bitNamedDays(let bitNamedDays):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bitNamedDays)
                            }
                        } else {
                            try coder.serialize(bitNamedDays)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_NamedDay_intNamedDays_Enum.swift
public struct SelectedAttributeTypes_NamedDay_intNamedDays_Enum: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let sunday = Self(rawValue: 1)
    static let monday = Self(rawValue: 2)
    static let tuesday = Self(rawValue: 3)
    static let wednesday = Self(rawValue: 4)
    static let thursday = Self(rawValue: 5)
    static let friday = Self(rawValue: 6)
    static let saturday = Self(rawValue: 7)
}

// MARK: - SelectedAttributeTypes_OctetSubstringAssertion.swift
@usableFromInline struct SelectedAttributeTypes_OctetSubstringAssertion: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [SelectedAttributeTypes_OctetSubstringAssertion_Element]
    @inlinable public init(_ value: [SelectedAttributeTypes_OctetSubstringAssertion_Element]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: SelectedAttributeTypes_OctetSubstringAssertion_Element.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_OctetSubstringAssertion_Element.swift
@usableFromInline indirect enum SelectedAttributeTypes_OctetSubstringAssertion_Element: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case initial(ASN1OctetString)
    case any(ASN1OctetString)
    case `final`(ASN1OctetString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .initial(try ASN1OctetString(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .any(try ASN1OctetString(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .`final`(try ASN1OctetString(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .initial(let initial): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try initial.serialize(into: &coder) }
        case .any(let any): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try any.serialize(into: &coder) }
        case .`final`(let `final`): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try `final`.serialize(into: &coder) }

        }
    }

}

// MARK: - SelectedAttributeTypes_Period.swift
@usableFromInline struct SelectedAttributeTypes_Period: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var timesOfDay: [SelectedAttributeTypes_DayTimeBand]?
    @usableFromInline var days: SelectedAttributeTypes_Period_days_Choice?
    @usableFromInline var weeks: SelectedAttributeTypes_Period_weeks_Choice?
    @usableFromInline var months: SelectedAttributeTypes_Period_months_Choice?
    @usableFromInline var years: [ArraySlice<UInt8>]?
    @inlinable init(timesOfDay: [SelectedAttributeTypes_DayTimeBand]?, days: SelectedAttributeTypes_Period_days_Choice?, weeks: SelectedAttributeTypes_Period_weeks_Choice?, months: SelectedAttributeTypes_Period_months_Choice?, years: [ArraySlice<UInt8>]?) {
        self.timesOfDay = timesOfDay
        self.days = days
        self.weeks = weeks
        self.months = months
        self.years = years

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let timesOfDay: [SelectedAttributeTypes_DayTimeBand]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in try DER.set(of: SelectedAttributeTypes_DayTimeBand.self, identifier: .set, rootNode: node) }
            let days: SelectedAttributeTypes_Period_days_Choice? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_Period_days_Choice(derEncoded: node) }
            let weeks: SelectedAttributeTypes_Period_weeks_Choice? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_Period_weeks_Choice(derEncoded: node) }
            let months: SelectedAttributeTypes_Period_months_Choice? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in return try SelectedAttributeTypes_Period_months_Choice(derEncoded: node) }
            let years: [ArraySlice<UInt8>]? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 4, tagClass: .contextSpecific) { node in try DER.set(of: ArraySlice<UInt8>.self, identifier: .set, rootNode: node) }

            return SelectedAttributeTypes_Period(timesOfDay: timesOfDay, days: days, weeks: weeks, months: months, years: years)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let timesOfDay = self.timesOfDay { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(timesOfDay) } }
            if let days = self.days { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(days) } }
            if let weeks = self.weeks { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(weeks) } }
            if let months = self.months { try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serialize(months) } }
            if let years = self.years { try coder.serialize(explicitlyTaggedWithTagNumber: 4, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(years) } }

        }
    }
}

// MARK: - SelectedAttributeTypes_Period_days_Choice.swift
@usableFromInline indirect enum SelectedAttributeTypes_Period_days_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case intDay([ArraySlice<UInt8>])
    case bitDay(ASN1BitString)
    case dayOf(SelectedAttributeTypes_XDayOf)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier.set:
            self = .intDay(try DER.set(of: ArraySlice<UInt8>.self, identifier: .set, rootNode: rootNode))
        case ASN1BitString.defaultIdentifier:
            self = .bitDay(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case SelectedAttributeTypes_XDayOf.defaultIdentifier:
            self = .dayOf(try SelectedAttributeTypes_XDayOf(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .intDay(let intDay): try coder.serializeSetOf(intDay)
        case .bitDay(let bitDay):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bitDay)
                            }
                        } else {
                            try coder.serialize(bitDay)
                        }
        case .dayOf(let dayOf):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(dayOf)
                            }
                        } else {
                            try coder.serialize(dayOf)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_Period_months_Choice.swift
@usableFromInline indirect enum SelectedAttributeTypes_Period_months_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case allMonths(ASN1Null)
    case intMonth([ArraySlice<UInt8>])
    case bitMonth(ASN1BitString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Null.defaultIdentifier:
            self = .allMonths(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier.set:
            self = .intMonth(try DER.set(of: ArraySlice<UInt8>.self, identifier: .set, rootNode: rootNode))
        case ASN1BitString.defaultIdentifier:
            self = .bitMonth(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .allMonths(let allMonths):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(allMonths)
                            }
                        } else {
                            try coder.serialize(allMonths)
                        }
        case .intMonth(let intMonth): try coder.serializeSetOf(intMonth)
        case .bitMonth(let bitMonth):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bitMonth)
                            }
                        } else {
                            try coder.serialize(bitMonth)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_Period_weeks_Choice.swift
@usableFromInline indirect enum SelectedAttributeTypes_Period_weeks_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case allWeeks(ASN1Null)
    case intWeek([ArraySlice<UInt8>])
    case bitWeek(ASN1BitString)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Null.defaultIdentifier:
            self = .allWeeks(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier.set:
            self = .intWeek(try DER.set(of: ArraySlice<UInt8>.self, identifier: .set, rootNode: rootNode))
        case ASN1BitString.defaultIdentifier:
            self = .bitWeek(try ASN1BitString(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .allWeeks(let allWeeks):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(allWeeks)
                            }
                        } else {
                            try coder.serialize(allWeeks)
                        }
        case .intWeek(let intWeek): try coder.serializeSetOf(intWeek)
        case .bitWeek(let bitWeek):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(bitWeek)
                            }
                        } else {
                            try coder.serialize(bitWeek)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_PostalAddress.swift
@usableFromInline struct SelectedAttributeTypes_PostalAddress: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [SelectedAttributeTypes_DirectoryString]
    @inlinable public init(_ value: [SelectedAttributeTypes_DirectoryString]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: SelectedAttributeTypes_DirectoryString.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_PreferredDeliveryMethod.swift
@usableFromInline struct SelectedAttributeTypes_PreferredDeliveryMethod: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [SelectedAttributeTypes_PreferredDeliveryMethod_Element]
    @inlinable public init(_ value: [SelectedAttributeTypes_PreferredDeliveryMethod_Element]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: SelectedAttributeTypes_PreferredDeliveryMethod_Element.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_PreferredDeliveryMethod_Element.swift
public struct SelectedAttributeTypes_PreferredDeliveryMethod_Element : DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable, Comparable {
    public static var defaultIdentifier: ASN1Identifier { .integer }
    @usableFromInline  var rawValue: Int
    @inlinable public static func < (lhs: SelectedAttributeTypes_PreferredDeliveryMethod_Element, rhs: SelectedAttributeTypes_PreferredDeliveryMethod_Element) -> Bool { lhs.rawValue < rhs.rawValue }
    @inlinable init(rawValue: Int) { self.rawValue = rawValue }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try Int(derEncoded: rootNode, withIdentifier: identifier)
    }
    @inlinable public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    public static let any_delivery_method = Self(rawValue: 0)
    public static let mhs_delivery = Self(rawValue: 1)
    public static let physical_delivery = Self(rawValue: 2)
    public static let telex_delivery = Self(rawValue: 3)
    public static let teletex_delivery = Self(rawValue: 4)
    public static let g3_facsimile_delivery = Self(rawValue: 5)
    public static let g4_facsimile_delivery = Self(rawValue: 6)
    public static let ia5_terminal_delivery = Self(rawValue: 7)
    public static let videotex_delivery = Self(rawValue: 8)
    public static let telephone_delivery = Self(rawValue: 9)
}

// MARK: - SelectedAttributeTypes_PresentationAddress.swift
@usableFromInline struct SelectedAttributeTypes_PresentationAddress: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var pSelector: ASN1OctetString?
    @usableFromInline var sSelector: ASN1OctetString?
    @usableFromInline var tSelector: ASN1OctetString?
    @usableFromInline var nAddresses: [ASN1OctetString]
    @inlinable init(pSelector: ASN1OctetString?, sSelector: ASN1OctetString?, tSelector: ASN1OctetString?, nAddresses: [ASN1OctetString]) {
        self.pSelector = pSelector
        self.sSelector = sSelector
        self.tSelector = tSelector
        self.nAddresses = nAddresses

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let pSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let sSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let tSelector: ASN1OctetString? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 2, tagClass: .contextSpecific) { node in return try ASN1OctetString(derEncoded: node) }
            let nAddresses: [ASN1OctetString] = try DER.explicitlyTagged(&nodes, tagNumber: 3, tagClass: .contextSpecific) { node in try DER.set(of: ASN1OctetString.self, identifier: .set, rootNode: node) }

            return SelectedAttributeTypes_PresentationAddress(pSelector: pSelector, sSelector: sSelector, tSelector: tSelector, nAddresses: nAddresses)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let pSelector = self.pSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(pSelector) } }
            if let sSelector = self.sSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(sSelector) } }
            if let tSelector = self.tSelector { try coder.serialize(explicitlyTaggedWithTagNumber: 2, tagClass: .contextSpecific) { codec in try codec.serialize(tSelector) } }
            try coder.serialize(explicitlyTaggedWithTagNumber: 3, tagClass: .contextSpecific) { codec in try codec.serializeSetOf(nAddresses) }

        }
    }
}

// MARK: - SelectedAttributeTypes_ProtocolInformation.swift
@usableFromInline struct SelectedAttributeTypes_ProtocolInformation: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var nAddress: ASN1OctetString
    @usableFromInline var profiles: [ASN1ObjectIdentifier]
    @inlinable init(nAddress: ASN1OctetString, profiles: [ASN1ObjectIdentifier]) {
        self.nAddress = nAddress
        self.profiles = profiles

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let nAddress: ASN1OctetString = try ASN1OctetString(derEncoded: &nodes)
            let profiles: [ASN1ObjectIdentifier] = try DER.set(of: ASN1ObjectIdentifier.self, identifier: .set, nodes: &nodes)

            return SelectedAttributeTypes_ProtocolInformation(nAddress: nAddress, profiles: profiles)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(nAddress)
            try coder.serializeSetOf(profiles)

        }
    }
}

// MARK: - SelectedAttributeTypes_SubstringAssertion.swift
@usableFromInline struct SelectedAttributeTypes_SubstringAssertion: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [SelectedAttributeTypes_SubstringAssertion_Element]
    @inlinable public init(_ value: [SelectedAttributeTypes_SubstringAssertion_Element]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: SelectedAttributeTypes_SubstringAssertion_Element.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_SubstringAssertion_Element.swift
@usableFromInline indirect enum SelectedAttributeTypes_SubstringAssertion_Element: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case initial(SelectedAttributeTypes_DirectoryString)
    case any(SelectedAttributeTypes_DirectoryString)
    case `final`(SelectedAttributeTypes_DirectoryString)
    case control(PKIX1Explicit88_Attribute)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .initial(try SelectedAttributeTypes_DirectoryString(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .any(try SelectedAttributeTypes_DirectoryString(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .`final`(try SelectedAttributeTypes_DirectoryString(derEncoded: inner))
        case PKIX1Explicit88_Attribute.defaultIdentifier:
            self = .control(try PKIX1Explicit88_Attribute(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .initial(let initial): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 0, tagClass: .contextSpecific)) { coder in try initial.serialize(into: &coder) }
        case .any(let any): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try any.serialize(into: &coder) }
        case .`final`(let `final`): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try `final`.serialize(into: &coder) }
        case .control(let control):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(control)
                            }
                        } else {
                            try coder.serialize(control)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_TelephoneNumber.swift
@usableFromInline typealias SelectedAttributeTypes_TelephoneNumber = ASN1PrintableString

// MARK: - SelectedAttributeTypes_TelexNumber.swift
@usableFromInline struct SelectedAttributeTypes_TelexNumber: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var telexNumber: ASN1PrintableString
    @usableFromInline var countryCode: ASN1PrintableString
    @usableFromInline var answerback: ASN1PrintableString
    @inlinable init(telexNumber: ASN1PrintableString, countryCode: ASN1PrintableString, answerback: ASN1PrintableString) {
        self.telexNumber = telexNumber
        self.countryCode = countryCode
        self.answerback = answerback

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let telexNumber: ASN1PrintableString = try ASN1PrintableString(derEncoded: &nodes)
            let countryCode: ASN1PrintableString = try ASN1PrintableString(derEncoded: &nodes)
            let answerback: ASN1PrintableString = try ASN1PrintableString(derEncoded: &nodes)

            return SelectedAttributeTypes_TelexNumber(telexNumber: telexNumber, countryCode: countryCode, answerback: answerback)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(telexNumber)
            try coder.serialize(countryCode)
            try coder.serialize(answerback)

        }
    }
}

// MARK: - SelectedAttributeTypes_TimeAssertion.swift
@usableFromInline indirect enum SelectedAttributeTypes_TimeAssertion: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case now(ASN1Null)
    case at(GeneralizedTime)
    case between(SelectedAttributeTypes_TimeAssertion_between_Sequence)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Null.defaultIdentifier:
            self = .now(try ASN1Null(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case GeneralizedTime.defaultIdentifier:
            self = .at(try GeneralizedTime(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case SelectedAttributeTypes_TimeAssertion_between_Sequence.defaultIdentifier:
            self = .between(try SelectedAttributeTypes_TimeAssertion_between_Sequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .now(let now):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(now)
                            }
                        } else {
                            try coder.serialize(now)
                        }
        case .at(let at):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(at)
                            }
                        } else {
                            try coder.serialize(at)
                        }
        case .between(let between):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(between)
                            }
                        } else {
                            try coder.serialize(between)
                        }

        }
    }

}

// MARK: - SelectedAttributeTypes_TimeAssertion_between_Sequence.swift
@usableFromInline struct SelectedAttributeTypes_TimeAssertion_between_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var startTime: GeneralizedTime
    @usableFromInline var endTime: GeneralizedTime?
    @usableFromInline var entirely: Bool?
    @inlinable init(startTime: GeneralizedTime, endTime: GeneralizedTime?, entirely: Bool?) {
        self.startTime = startTime
        self.endTime = endTime
        self.entirely = entirely

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let startTime: GeneralizedTime = try DER.explicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try GeneralizedTime(derEncoded: node) }
            let endTime: GeneralizedTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try GeneralizedTime(derEncoded: node) }
            let entirely: Bool = try DER.decodeDefault(&nodes, defaultValue: false)

            return SelectedAttributeTypes_TimeAssertion_between_Sequence(startTime: startTime, endTime: endTime, entirely: entirely)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(startTime) }
            if let endTime = self.endTime { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(endTime) } }
            if let entirely = self.entirely { try coder.serialize(entirely) }

        }
    }
}

// MARK: - SelectedAttributeTypes_TimeSpecification.swift
@usableFromInline struct SelectedAttributeTypes_TimeSpecification: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var time: SelectedAttributeTypes_TimeSpecification_time_Choice
    @usableFromInline var notThisTime: Bool?
    @usableFromInline var timeZone: SelectedAttributeTypes_TimeZone?
    @inlinable init(time: SelectedAttributeTypes_TimeSpecification_time_Choice, notThisTime: Bool?, timeZone: SelectedAttributeTypes_TimeZone?) {
        self.time = time
        self.notThisTime = notThisTime
        self.timeZone = timeZone

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let time: SelectedAttributeTypes_TimeSpecification_time_Choice = try SelectedAttributeTypes_TimeSpecification_time_Choice(derEncoded: &nodes)
            let notThisTime: Bool = try DER.decodeDefault(&nodes, defaultValue: false)
            var timeZone: SelectedAttributeTypes_TimeZone? = nil
var peek_timeZone = nodes
if let next = peek_timeZone.next(), next.identifier == SelectedAttributeTypes_TimeZone.defaultIdentifier {
    timeZone = try SelectedAttributeTypes_TimeZone(derEncoded: &nodes)
}

            return SelectedAttributeTypes_TimeSpecification(time: time, notThisTime: notThisTime, timeZone: timeZone)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            try coder.serialize(time)
            if let notThisTime = self.notThisTime { try coder.serialize(notThisTime) }
            if let timeZone = self.timeZone { try coder.serialize(timeZone) }

        }
    }
}

// MARK: - SelectedAttributeTypes_TimeSpecification_time_Choice.swift
@usableFromInline indirect enum SelectedAttributeTypes_TimeSpecification_time_Choice: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case absolute(SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence)
    case periodic([SelectedAttributeTypes_Period])
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence.defaultIdentifier:
            self = .absolute(try SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence(derEncoded: rootNode, withIdentifier: rootNode.identifier))
        case ASN1Identifier.set:
            self = .periodic(try DER.set(of: SelectedAttributeTypes_Period.self, identifier: .set, rootNode: rootNode))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .absolute(let absolute):
                        if identifier != Self.defaultIdentifier {
                            try coder.appendConstructedNode(identifier: identifier) { coder in
                                try coder.serialize(absolute)
                            }
                        } else {
                            try coder.serialize(absolute)
                        }
        case .periodic(let periodic): try coder.serializeSetOf(periodic)

        }
    }

}

// MARK: - SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence.swift
@usableFromInline struct SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence: DERImplicitlyTaggable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var startTime: GeneralizedTime?
    @usableFromInline var endTime: GeneralizedTime?
    @inlinable init(startTime: GeneralizedTime?, endTime: GeneralizedTime?) {
        self.startTime = startTime
        self.endTime = endTime

    }
    @inlinable init(derEncoded root: ASN1Node,
        withIdentifier identifier: ASN1Identifier) throws {
        self = try DER.sequence(root, identifier: identifier) { nodes in
            let startTime: GeneralizedTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 0, tagClass: .contextSpecific) { node in return try GeneralizedTime(derEncoded: node) }
            let endTime: GeneralizedTime? = try DER.optionalExplicitlyTagged(&nodes, tagNumber: 1, tagClass: .contextSpecific) { node in return try GeneralizedTime(derEncoded: node) }

            return SelectedAttributeTypes_TimeSpecification_time_Choice_absolute_Sequence(startTime: startTime, endTime: endTime)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer,
        withIdentifier identifier: ASN1Identifier) throws {
        try coder.appendConstructedNode(identifier: identifier) { coder in
            if let startTime = self.startTime { try coder.serialize(explicitlyTaggedWithTagNumber: 0, tagClass: .contextSpecific) { codec in try codec.serialize(startTime) } }
            if let endTime = self.endTime { try coder.serialize(explicitlyTaggedWithTagNumber: 1, tagClass: .contextSpecific) { codec in try codec.serialize(endTime) } }

        }
    }
}

// MARK: - SelectedAttributeTypes_TimeZone.swift
@usableFromInline typealias SelectedAttributeTypes_TimeZone = Int

// MARK: - SelectedAttributeTypes_UniqueIdentifier.swift
@usableFromInline typealias SelectedAttributeTypes_UniqueIdentifier = ASN1BitString

// MARK: - SelectedAttributeTypes_X121Address.swift
@usableFromInline typealias SelectedAttributeTypes_X121Address = ASN1PrintableString

// MARK: - SelectedAttributeTypes_XDayOf.swift
@usableFromInline indirect enum SelectedAttributeTypes_XDayOf: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .enumerated }
        case first(SelectedAttributeTypes_NamedDay)
    case second(SelectedAttributeTypes_NamedDay)
    case third(SelectedAttributeTypes_NamedDay)
    case fourth(SelectedAttributeTypes_NamedDay)
    case fifth(SelectedAttributeTypes_NamedDay)
    @inlinable init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        switch rootNode.identifier {
        case ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .first(try SelectedAttributeTypes_NamedDay(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .second(try SelectedAttributeTypes_NamedDay(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .third(try SelectedAttributeTypes_NamedDay(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .fourth(try SelectedAttributeTypes_NamedDay(derEncoded: inner))
        case ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific):
            guard case .constructed(let nodes) = rootNode.content, var iterator = Optional(nodes.makeIterator()), let inner = iterator.next() else { throw ASN1Error.invalidASN1Object(reason: "Invalid explicit tag content") }
            self = .fifth(try SelectedAttributeTypes_NamedDay(derEncoded: inner))
            default: throw ASN1Error.unexpectedFieldType(rootNode.identifier)
        }
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        switch self {
        case .first(let first): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 1, tagClass: .contextSpecific)) { coder in try first.serialize(into: &coder) }
        case .second(let second): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 2, tagClass: .contextSpecific)) { coder in try second.serialize(into: &coder) }
        case .third(let third): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 3, tagClass: .contextSpecific)) { coder in try third.serialize(into: &coder) }
        case .fourth(let fourth): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 4, tagClass: .contextSpecific)) { coder in try fourth.serialize(into: &coder) }
        case .fifth(let fifth): try coder.appendConstructedNode(identifier: ASN1Identifier(tagWithNumber: 5, tagClass: .contextSpecific)) { coder in try fifth.serialize(into: &coder) }

        }
    }

}

// MARK: - SelectedAttributeTypes_ZONAL_MATCHING.swift
@usableFromInline typealias SelectedAttributeTypes_ZONAL_MATCHING = InformationFramework_MAPPING_BASED_MATCHING

// MARK: - SelectedAttributeTypes_ZonalResult.swift
public struct SelectedAttributeTypes_ZonalResult: DERImplicitlyTaggable, Sendable, RawRepresentable {
    public static var defaultIdentifier: ASN1Identifier { .enumerated }
    public var rawValue: Int
    public init(rawValue: Int) { self.rawValue = rawValue }
    public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.rawValue = try .init(derEncoded: rootNode, withIdentifier: identifier)
    }
    public func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try self.rawValue.serialize(into: &coder, withIdentifier: identifier)
    }
    static let cannot_select_mapping = Self(rawValue: 0)
    static let zero_mappings = Self(rawValue: 2)
    static let multiple_mappings = Self(rawValue: 3)
}

// MARK: - SelectedAttributeTypes_ZonalSelect.swift
@usableFromInline struct SelectedAttributeTypes_ZonalSelect: DERImplicitlyTaggable, DERParseable, DERSerializable, Sendable {
    @inlinable static var defaultIdentifier: ASN1Identifier { .sequence }
    @usableFromInline var value: [PKIX1Explicit88_AttributeType]
    @inlinable public init(_ value: [PKIX1Explicit88_AttributeType]) { self.value = value }
    @inlinable public init(derEncoded rootNode: ASN1Node, withIdentifier identifier: ASN1Identifier) throws {
        self.value = try DER.sequence(of: PKIX1Explicit88_AttributeType.self, identifier: identifier, rootNode: rootNode)
    }
    @inlinable func serialize(into coder: inout DER.Serializer, withIdentifier identifier: ASN1Identifier) throws {
        try coder.serializeSequenceOf(value, identifier: identifier)
    }
}

// MARK: - SelectedAttributeTypes_id_at_businessCategory_oid.swift
public let SelectedAttributeTypes_id_at_businessCategory: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [15]

// MARK: - SelectedAttributeTypes_id_at_collectiveFacsimileTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_collectiveFacsimileTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [23, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveInternationalISDNNumber_oid.swift
public let SelectedAttributeTypes_id_at_collectiveInternationalISDNNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [25, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveLocalityName_oid.swift
public let SelectedAttributeTypes_id_at_collectiveLocalityName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [7, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveOrganizationName_oid.swift
public let SelectedAttributeTypes_id_at_collectiveOrganizationName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [10, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveOrganizationalUnitName_oid.swift
public let SelectedAttributeTypes_id_at_collectiveOrganizationalUnitName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [11, 1]

// MARK: - SelectedAttributeTypes_id_at_collectivePhysicalDeliveryOfficeName_oid.swift
public let SelectedAttributeTypes_id_at_collectivePhysicalDeliveryOfficeName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [19, 1]

// MARK: - SelectedAttributeTypes_id_at_collectivePostOfficeBox_oid.swift
public let SelectedAttributeTypes_id_at_collectivePostOfficeBox: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [18, 1]

// MARK: - SelectedAttributeTypes_id_at_collectivePostalAddress_oid.swift
public let SelectedAttributeTypes_id_at_collectivePostalAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [16, 1]

// MARK: - SelectedAttributeTypes_id_at_collectivePostalCode_oid.swift
public let SelectedAttributeTypes_id_at_collectivePostalCode: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [17, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveStateOrProvinceName_oid.swift
public let SelectedAttributeTypes_id_at_collectiveStateOrProvinceName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [8, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveStreetAddress_oid.swift
public let SelectedAttributeTypes_id_at_collectiveStreetAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [9, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_collectiveTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [20, 1]

// MARK: - SelectedAttributeTypes_id_at_collectiveTelexNumber_oid.swift
public let SelectedAttributeTypes_id_at_collectiveTelexNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [21, 1]

// MARK: - SelectedAttributeTypes_id_at_commonName_oid.swift
public let SelectedAttributeTypes_id_at_commonName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [3]

// MARK: - SelectedAttributeTypes_id_at_communicationsNetwork_oid.swift
public let SelectedAttributeTypes_id_at_communicationsNetwork: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [67]

// MARK: - SelectedAttributeTypes_id_at_communicationsService_oid.swift
public let SelectedAttributeTypes_id_at_communicationsService: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [66]

// MARK: - SelectedAttributeTypes_id_at_countryName_oid.swift
public let SelectedAttributeTypes_id_at_countryName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [6]

// MARK: - SelectedAttributeTypes_id_at_description_oid.swift
public let SelectedAttributeTypes_id_at_description: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [13]

// MARK: - SelectedAttributeTypes_id_at_destinationIndicator_oid.swift
public let SelectedAttributeTypes_id_at_destinationIndicator: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [27]

// MARK: - SelectedAttributeTypes_id_at_distinguishedName_oid.swift
public let SelectedAttributeTypes_id_at_distinguishedName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [49]

// MARK: - SelectedAttributeTypes_id_at_dmdName_oid.swift
public let SelectedAttributeTypes_id_at_dmdName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [54]

// MARK: - SelectedAttributeTypes_id_at_dnQualifier_oid.swift
public let SelectedAttributeTypes_id_at_dnQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [46]

// MARK: - SelectedAttributeTypes_id_at_encryptedAliasedEntryName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedAliasedEntryName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedAttributeCertificateRevocationList_oid.swift
public let SelectedAttributeTypes_id_at_encryptedAttributeCertificateRevocationList: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [59, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedAttributeCertificate_oid.swift
public let SelectedAttributeTypes_id_at_encryptedAttributeCertificate: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [58, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedAttributeIntegrityInfo_oid.swift
public let SelectedAttributeTypes_id_at_encryptedAttributeIntegrityInfo: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [57, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedAuthorityRevocationList_oid.swift
public let SelectedAttributeTypes_id_at_encryptedAuthorityRevocationList: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [38, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedBusinessCategory_oid.swift
public let SelectedAttributeTypes_id_at_encryptedBusinessCategory: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [15, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCACertificate_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCACertificate: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [37, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCertificateRevocationList_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCertificateRevocationList: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [39, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedClearance_oid.swift
public let SelectedAttributeTypes_id_at_encryptedClearance: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [55, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveFacsimileTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveFacsimileTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [23, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveInternationalISDNNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveInternationalISDNNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [25, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveLocalityName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveLocalityName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [7, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveOrganizationName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveOrganizationName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [10, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveOrganizationalUnitName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveOrganizationalUnitName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [11, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectivePhysicalDeliveryOfficeName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectivePhysicalDeliveryOfficeName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [19, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectivePostOfficeBox_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectivePostOfficeBox: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [18, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectivePostalAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectivePostalAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [16, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectivePostalCode_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectivePostalCode: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [17, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveStateOrProvinceName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveStateOrProvinceName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [8, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveStreetAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveStreetAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [9, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [20, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCollectiveTelexNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCollectiveTelexNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [21, 1, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCommonName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCommonName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [3, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedConfKeyInfo_oid.swift
public let SelectedAttributeTypes_id_at_encryptedConfKeyInfo: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [60, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCountryName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCountryName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [6, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedCrossCertificatePair_oid.swift
public let SelectedAttributeTypes_id_at_encryptedCrossCertificatePair: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [40, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDefaultDirQop_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDefaultDirQop: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [56, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDeltaRevocationList_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDeltaRevocationList: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [53, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDescription_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDescription: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [13, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDestinationIndicator_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDestinationIndicator: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [27, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDistinguishedName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDistinguishedName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [49, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDmdName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDmdName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [54, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedDnQualifier_oid.swift
public let SelectedAttributeTypes_id_at_encryptedDnQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [46, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedEnhancedSearchGuide_oid.swift
public let SelectedAttributeTypes_id_at_encryptedEnhancedSearchGuide: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [47, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedFacsimileTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedFacsimileTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [23, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedGenerationQualifier_oid.swift
public let SelectedAttributeTypes_id_at_encryptedGenerationQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [44, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedGivenName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedGivenName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [42, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedHouseIdentifier_oid.swift
public let SelectedAttributeTypes_id_at_encryptedHouseIdentifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [51, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedInitials_oid.swift
public let SelectedAttributeTypes_id_at_encryptedInitials: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [43, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedInternationalISDNNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedInternationalISDNNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [25, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedLocalityName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedLocalityName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [7, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedMember_oid.swift
public let SelectedAttributeTypes_id_at_encryptedMember: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [31, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedOrganizationName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedOrganizationName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [10, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedOrganizationalUnitName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedOrganizationalUnitName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [11, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedOwner_oid.swift
public let SelectedAttributeTypes_id_at_encryptedOwner: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [32, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPhysicalDeliveryOfficeName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPhysicalDeliveryOfficeName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [19, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPostOfficeBox_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPostOfficeBox: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [18, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPostalAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPostalAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [16, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPostalCode_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPostalCode: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [17, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPreferredDeliveryMethod_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPreferredDeliveryMethod: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [28, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedPresentationAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedPresentationAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [29, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedProtocolInformation_oid.swift
public let SelectedAttributeTypes_id_at_encryptedProtocolInformation: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [48, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedRegisteredAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedRegisteredAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [26, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedRoleOccupant_oid.swift
public let SelectedAttributeTypes_id_at_encryptedRoleOccupant: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [33, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSearchGuide_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSearchGuide: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [14, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSeeAlso_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSeeAlso: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [34, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSerialNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSerialNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [5, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedStateOrProvinceName_oid.swift
public let SelectedAttributeTypes_id_at_encryptedStateOrProvinceName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [8, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedStreetAddress_oid.swift
public let SelectedAttributeTypes_id_at_encryptedStreetAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [9, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSupportedAlgorithms_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSupportedAlgorithms: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [52, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSupportedApplicationContext_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSupportedApplicationContext: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [30, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedSurname_oid.swift
public let SelectedAttributeTypes_id_at_encryptedSurname: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [4, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [20, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedTelexNumber_oid.swift
public let SelectedAttributeTypes_id_at_encryptedTelexNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [21, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedTitle_oid.swift
public let SelectedAttributeTypes_id_at_encryptedTitle: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [12, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedUniqueIdentifier_oid.swift
public let SelectedAttributeTypes_id_at_encryptedUniqueIdentifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [45, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedUniqueMember_oid.swift
public let SelectedAttributeTypes_id_at_encryptedUniqueMember: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [50, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedUserCertificate_oid.swift
public let SelectedAttributeTypes_id_at_encryptedUserCertificate: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [36, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedUserPassword_oid.swift
public let SelectedAttributeTypes_id_at_encryptedUserPassword: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [35, 2]

// MARK: - SelectedAttributeTypes_id_at_encryptedX121Address_oid.swift
public let SelectedAttributeTypes_id_at_encryptedX121Address: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [24, 2]

// MARK: - SelectedAttributeTypes_id_at_enhancedSearchGuide_oid.swift
public let SelectedAttributeTypes_id_at_enhancedSearchGuide: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [47]

// MARK: - SelectedAttributeTypes_id_at_facsimileTelephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_facsimileTelephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [23]

// MARK: - SelectedAttributeTypes_id_at_generationQualifier_oid.swift
public let SelectedAttributeTypes_id_at_generationQualifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [44]

// MARK: - SelectedAttributeTypes_id_at_givenName_oid.swift
public let SelectedAttributeTypes_id_at_givenName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [42]

// MARK: - SelectedAttributeTypes_id_at_houseIdentifier_oid.swift
public let SelectedAttributeTypes_id_at_houseIdentifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [51]

// MARK: - SelectedAttributeTypes_id_at_initials_oid.swift
public let SelectedAttributeTypes_id_at_initials: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [43]

// MARK: - SelectedAttributeTypes_id_at_internationalISDNNumber_oid.swift
public let SelectedAttributeTypes_id_at_internationalISDNNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [25]

// MARK: - SelectedAttributeTypes_id_at_knowledgeInformation_oid.swift
public let SelectedAttributeTypes_id_at_knowledgeInformation: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [2]

// MARK: - SelectedAttributeTypes_id_at_localityName_oid.swift
public let SelectedAttributeTypes_id_at_localityName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [7]

// MARK: - SelectedAttributeTypes_id_at_member_oid.swift
public let SelectedAttributeTypes_id_at_member: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [31]

// MARK: - SelectedAttributeTypes_id_at_name_oid.swift
public let SelectedAttributeTypes_id_at_name: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [41]

// MARK: - SelectedAttributeTypes_id_at_organizationName_oid.swift
public let SelectedAttributeTypes_id_at_organizationName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [10]

// MARK: - SelectedAttributeTypes_id_at_organizationalUnitName_oid.swift
public let SelectedAttributeTypes_id_at_organizationalUnitName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [11]

// MARK: - SelectedAttributeTypes_id_at_owner_oid.swift
public let SelectedAttributeTypes_id_at_owner: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [32]

// MARK: - SelectedAttributeTypes_id_at_physicalDeliveryOfficeName_oid.swift
public let SelectedAttributeTypes_id_at_physicalDeliveryOfficeName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [19]

// MARK: - SelectedAttributeTypes_id_at_postOfficeBox_oid.swift
public let SelectedAttributeTypes_id_at_postOfficeBox: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [18]

// MARK: - SelectedAttributeTypes_id_at_postalAddress_oid.swift
public let SelectedAttributeTypes_id_at_postalAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [16]

// MARK: - SelectedAttributeTypes_id_at_postalCode_oid.swift
public let SelectedAttributeTypes_id_at_postalCode: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [17]

// MARK: - SelectedAttributeTypes_id_at_preferredDeliveryMethod_oid.swift
public let SelectedAttributeTypes_id_at_preferredDeliveryMethod: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [28]

// MARK: - SelectedAttributeTypes_id_at_presentationAddress_oid.swift
public let SelectedAttributeTypes_id_at_presentationAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [29]

// MARK: - SelectedAttributeTypes_id_at_protocolInformation_oid.swift
public let SelectedAttributeTypes_id_at_protocolInformation: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [48]

// MARK: - SelectedAttributeTypes_id_at_pseudonym_oid.swift
public let SelectedAttributeTypes_id_at_pseudonym: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [65]

// MARK: - SelectedAttributeTypes_id_at_registeredAddress_oid.swift
public let SelectedAttributeTypes_id_at_registeredAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [26]

// MARK: - SelectedAttributeTypes_id_at_roleOccupant_oid.swift
public let SelectedAttributeTypes_id_at_roleOccupant: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [33]

// MARK: - SelectedAttributeTypes_id_at_searchGuide_oid.swift
public let SelectedAttributeTypes_id_at_searchGuide: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [14]

// MARK: - SelectedAttributeTypes_id_at_seeAlso_oid.swift
public let SelectedAttributeTypes_id_at_seeAlso: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [34]

// MARK: - SelectedAttributeTypes_id_at_serialNumber_oid.swift
public let SelectedAttributeTypes_id_at_serialNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [5]

// MARK: - SelectedAttributeTypes_id_at_stateOrProvinceName_oid.swift
public let SelectedAttributeTypes_id_at_stateOrProvinceName: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [8]

// MARK: - SelectedAttributeTypes_id_at_streetAddress_oid.swift
public let SelectedAttributeTypes_id_at_streetAddress: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [9]

// MARK: - SelectedAttributeTypes_id_at_supportedApplicationContext_oid.swift
public let SelectedAttributeTypes_id_at_supportedApplicationContext: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [30]

// MARK: - SelectedAttributeTypes_id_at_surname_oid.swift
public let SelectedAttributeTypes_id_at_surname: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [4]

// MARK: - SelectedAttributeTypes_id_at_telephoneNumber_oid.swift
public let SelectedAttributeTypes_id_at_telephoneNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [20]

// MARK: - SelectedAttributeTypes_id_at_telexNumber_oid.swift
public let SelectedAttributeTypes_id_at_telexNumber: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [21]

// MARK: - SelectedAttributeTypes_id_at_title_oid.swift
public let SelectedAttributeTypes_id_at_title: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [12]

// MARK: - SelectedAttributeTypes_id_at_uniqueIdentifier_oid.swift
public let SelectedAttributeTypes_id_at_uniqueIdentifier: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [45]

// MARK: - SelectedAttributeTypes_id_at_uniqueMember_oid.swift
public let SelectedAttributeTypes_id_at_uniqueMember: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [50]

// MARK: - SelectedAttributeTypes_id_at_x121Address_oid.swift
public let SelectedAttributeTypes_id_at_x121Address: ASN1ObjectIdentifier = PKIX1Explicit88_id_at + [24]

// MARK: - SelectedAttributeTypes_id_avc_language_oid.swift
public let SelectedAttributeTypes_id_avc_language: ASN1ObjectIdentifier = UsefulDefinitions_id_avc + [0]

// MARK: - SelectedAttributeTypes_id_avc_locale_oid.swift
public let SelectedAttributeTypes_id_avc_locale: ASN1ObjectIdentifier = UsefulDefinitions_id_avc + [2]

// MARK: - SelectedAttributeTypes_id_avc_temporal_oid.swift
public let SelectedAttributeTypes_id_avc_temporal: ASN1ObjectIdentifier = UsefulDefinitions_id_avc + [1]

// MARK: - SelectedAttributeTypes_id_cat_characterMatchTypes_oid.swift
public let SelectedAttributeTypes_id_cat_characterMatchTypes: ASN1ObjectIdentifier = UsefulDefinitions_id_cat + [3]

// MARK: - SelectedAttributeTypes_id_cat_selectedContexts_oid.swift
public let SelectedAttributeTypes_id_cat_selectedContexts: ASN1ObjectIdentifier = UsefulDefinitions_id_cat + [4]

// MARK: - SelectedAttributeTypes_id_cat_sequenceMatchType_oid.swift
public let SelectedAttributeTypes_id_cat_sequenceMatchType: ASN1ObjectIdentifier = UsefulDefinitions_id_cat + [1]

// MARK: - SelectedAttributeTypes_id_cat_wordMatchType_oid.swift
public let SelectedAttributeTypes_id_cat_wordMatchType: ASN1ObjectIdentifier = UsefulDefinitions_id_cat + [2]

// MARK: - SelectedAttributeTypes_id_mr_approximateStringMatch_oid.swift
public let SelectedAttributeTypes_id_mr_approximateStringMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [49]

// MARK: - SelectedAttributeTypes_id_mr_bitStringMatch_oid.swift
public let SelectedAttributeTypes_id_mr_bitStringMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [16]

// MARK: - SelectedAttributeTypes_id_mr_booleanMatch_oid.swift
public let SelectedAttributeTypes_id_mr_booleanMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [13]

// MARK: - SelectedAttributeTypes_id_mr_caseExactMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseExactMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [5]

// MARK: - SelectedAttributeTypes_id_mr_caseExactOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseExactOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [6]

// MARK: - SelectedAttributeTypes_id_mr_caseExactSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseExactSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [7]

// MARK: - SelectedAttributeTypes_id_mr_caseIgnoreListMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseIgnoreListMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [11]

// MARK: - SelectedAttributeTypes_id_mr_caseIgnoreListSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseIgnoreListSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [12]

// MARK: - SelectedAttributeTypes_id_mr_caseIgnoreMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseIgnoreMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [2]

// MARK: - SelectedAttributeTypes_id_mr_caseIgnoreOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseIgnoreOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [3]

// MARK: - SelectedAttributeTypes_id_mr_caseIgnoreSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_caseIgnoreSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [4]

// MARK: - SelectedAttributeTypes_id_mr_directoryStringFirstComponentMatch_oid.swift
public let SelectedAttributeTypes_id_mr_directoryStringFirstComponentMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [31]

// MARK: - SelectedAttributeTypes_id_mr_facsimileNumberMatch_oid.swift
public let SelectedAttributeTypes_id_mr_facsimileNumberMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [63]

// MARK: - SelectedAttributeTypes_id_mr_facsimileNumberSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_facsimileNumberSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [64]

// MARK: - SelectedAttributeTypes_id_mr_generalWordMatch_oid.swift
public let SelectedAttributeTypes_id_mr_generalWordMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [48]

// MARK: - SelectedAttributeTypes_id_mr_generalizedTimeMatch_oid.swift
public let SelectedAttributeTypes_id_mr_generalizedTimeMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [27]

// MARK: - SelectedAttributeTypes_id_mr_generalizedTimeOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_generalizedTimeOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [28]

// MARK: - SelectedAttributeTypes_id_mr_ignoreIfAbsentMatch_oid.swift
public let SelectedAttributeTypes_id_mr_ignoreIfAbsentMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [50]

// MARK: - SelectedAttributeTypes_id_mr_integerFirstComponentMatch_oid.swift
public let SelectedAttributeTypes_id_mr_integerFirstComponentMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [29]

// MARK: - SelectedAttributeTypes_id_mr_integerMatch_oid.swift
public let SelectedAttributeTypes_id_mr_integerMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [14]

// MARK: - SelectedAttributeTypes_id_mr_integerOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_integerOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [15]

// MARK: - SelectedAttributeTypes_id_mr_keywordMatch_oid.swift
public let SelectedAttributeTypes_id_mr_keywordMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [33]

// MARK: - SelectedAttributeTypes_id_mr_nullMatch_oid.swift
public let SelectedAttributeTypes_id_mr_nullMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [51]

// MARK: - SelectedAttributeTypes_id_mr_numericStringMatch_oid.swift
public let SelectedAttributeTypes_id_mr_numericStringMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [8]

// MARK: - SelectedAttributeTypes_id_mr_numericStringOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_numericStringOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [9]

// MARK: - SelectedAttributeTypes_id_mr_numericStringSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_numericStringSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [10]

// MARK: - SelectedAttributeTypes_id_mr_objectIdentifierFirstComponentMatch_oid.swift
public let SelectedAttributeTypes_id_mr_objectIdentifierFirstComponentMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [30]

// MARK: - SelectedAttributeTypes_id_mr_octetStringMatch_oid.swift
public let SelectedAttributeTypes_id_mr_octetStringMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [17]

// MARK: - SelectedAttributeTypes_id_mr_octetStringOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_octetStringOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [18]

// MARK: - SelectedAttributeTypes_id_mr_octetStringSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_octetStringSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [19]

// MARK: - SelectedAttributeTypes_id_mr_presentationAddressMatch_oid.swift
public let SelectedAttributeTypes_id_mr_presentationAddressMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [22]

// MARK: - SelectedAttributeTypes_id_mr_protocolInformationMatch_oid.swift
public let SelectedAttributeTypes_id_mr_protocolInformationMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [24]

// MARK: - SelectedAttributeTypes_id_mr_storedPrefixMatch_oid.swift
public let SelectedAttributeTypes_id_mr_storedPrefixMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [41]

// MARK: - SelectedAttributeTypes_id_mr_systemProposedMatch_oid.swift
public let SelectedAttributeTypes_id_mr_systemProposedMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [47]

// MARK: - SelectedAttributeTypes_id_mr_telephoneNumberMatch_oid.swift
public let SelectedAttributeTypes_id_mr_telephoneNumberMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [20]

// MARK: - SelectedAttributeTypes_id_mr_telephoneNumberSubstringsMatch_oid.swift
public let SelectedAttributeTypes_id_mr_telephoneNumberSubstringsMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [21]

// MARK: - SelectedAttributeTypes_id_mr_uTCTimeMatch_oid.swift
public let SelectedAttributeTypes_id_mr_uTCTimeMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [25]

// MARK: - SelectedAttributeTypes_id_mr_uTCTimeOrderingMatch_oid.swift
public let SelectedAttributeTypes_id_mr_uTCTimeOrderingMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [26]

// MARK: - SelectedAttributeTypes_id_mr_uniqueMemberMatch_oid.swift
public let SelectedAttributeTypes_id_mr_uniqueMemberMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [23]

// MARK: - SelectedAttributeTypes_id_mr_wordMatch_oid.swift
public let SelectedAttributeTypes_id_mr_wordMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [32]

// MARK: - SelectedAttributeTypes_id_mr_zonalMatch_oid.swift
public let SelectedAttributeTypes_id_mr_zonalMatch: ASN1ObjectIdentifier = UsefulDefinitions_id_mr + [52]

// MARK: - SelectedAttributeTypes_id_not_appliedRelaxation_oid.swift
public let SelectedAttributeTypes_id_not_appliedRelaxation: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [15]

// MARK: - SelectedAttributeTypes_id_not_attributeCombinations_oid.swift
public let SelectedAttributeTypes_id_not_attributeCombinations: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [6]

// MARK: - SelectedAttributeTypes_id_not_attributeTypeList_oid.swift
public let SelectedAttributeTypes_id_not_attributeTypeList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [3]

// MARK: - SelectedAttributeTypes_id_not_contextCombinations_oid.swift
public let SelectedAttributeTypes_id_not_contextCombinations: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [9]

// MARK: - SelectedAttributeTypes_id_not_contextList_oid.swift
public let SelectedAttributeTypes_id_not_contextList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [8]

// MARK: - SelectedAttributeTypes_id_not_contextTypeList_oid.swift
public let SelectedAttributeTypes_id_not_contextTypeList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [7]

// MARK: - SelectedAttributeTypes_id_not_dSAProblem_oid.swift
public let SelectedAttributeTypes_id_not_dSAProblem: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [0]

// MARK: - SelectedAttributeTypes_id_not_filterItem_oid.swift
public let SelectedAttributeTypes_id_not_filterItem: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [5]

// MARK: - SelectedAttributeTypes_id_not_hierarchySelectList_oid.swift
public let SelectedAttributeTypes_id_not_hierarchySelectList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [10]

// MARK: - SelectedAttributeTypes_id_not_matchingRuleList_oid.swift
public let SelectedAttributeTypes_id_not_matchingRuleList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [4]

// MARK: - SelectedAttributeTypes_id_not_multipleMatchingLocalities_oid.swift
public let SelectedAttributeTypes_id_not_multipleMatchingLocalities: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [13]

// MARK: - SelectedAttributeTypes_id_not_proposedRelaxation_oid.swift
public let SelectedAttributeTypes_id_not_proposedRelaxation: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [14]

// MARK: - SelectedAttributeTypes_id_not_searchOptionsList_oid.swift
public let SelectedAttributeTypes_id_not_searchOptionsList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [11]

// MARK: - SelectedAttributeTypes_id_not_searchServiceProblem_oid.swift
public let SelectedAttributeTypes_id_not_searchServiceProblem: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [1]

// MARK: - SelectedAttributeTypes_id_not_serviceControlOptionsList_oid.swift
public let SelectedAttributeTypes_id_not_serviceControlOptionsList: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [12]

// MARK: - SelectedAttributeTypes_id_not_serviceType_oid.swift
public let SelectedAttributeTypes_id_not_serviceType: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [2]

// MARK: - SelectedAttributeTypes_id_not_substringRequirements_oid.swift
public let SelectedAttributeTypes_id_not_substringRequirements: ASN1ObjectIdentifier = UsefulDefinitions_id_not + [16]

// MARK: - SelectedAttributeTypes_id_pr_ambiguousKeyAttributes_oid.swift
public let SelectedAttributeTypes_id_pr_ambiguousKeyAttributes: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [32]

// MARK: - SelectedAttributeTypes_id_pr_attributeMatchingViolation_oid.swift
public let SelectedAttributeTypes_id_pr_attributeMatchingViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [20]

// MARK: - SelectedAttributeTypes_id_pr_attributeNegationViolation_oid.swift
public let SelectedAttributeTypes_id_pr_attributeNegationViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [10]

// MARK: - SelectedAttributeTypes_id_pr_dataSourceUnavailable_oid.swift
public let SelectedAttributeTypes_id_pr_dataSourceUnavailable: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [2]

// MARK: - SelectedAttributeTypes_id_pr_hierarchySelectForbidden_oid.swift
public let SelectedAttributeTypes_id_pr_hierarchySelectForbidden: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [23]

// MARK: - SelectedAttributeTypes_id_pr_invalidContextSearchValue_oid.swift
public let SelectedAttributeTypes_id_pr_invalidContextSearchValue: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [18]

// MARK: - SelectedAttributeTypes_id_pr_invalidHierarchySelect_oid.swift
public let SelectedAttributeTypes_id_pr_invalidHierarchySelect: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [24]

// MARK: - SelectedAttributeTypes_id_pr_invalidSearchOptions_oid.swift
public let SelectedAttributeTypes_id_pr_invalidSearchOptions: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [26]

// MARK: - SelectedAttributeTypes_id_pr_invalidSearchValue_oid.swift
public let SelectedAttributeTypes_id_pr_invalidSearchValue: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [12]

// MARK: - SelectedAttributeTypes_id_pr_invalidServiceControlOptions_oid.swift
public let SelectedAttributeTypes_id_pr_invalidServiceControlOptions: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [28]

// MARK: - SelectedAttributeTypes_id_pr_matchingUseViolation_oid.swift
public let SelectedAttributeTypes_id_pr_matchingUseViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [22]

// MARK: - SelectedAttributeTypes_id_pr_missingSearchAttribute_oid.swift
public let SelectedAttributeTypes_id_pr_missingSearchAttribute: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [8]

// MARK: - SelectedAttributeTypes_id_pr_missingSearchContext_oid.swift
public let SelectedAttributeTypes_id_pr_missingSearchContext: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [15]

// MARK: - SelectedAttributeTypes_id_pr_missingSearchOptions_oid.swift
public let SelectedAttributeTypes_id_pr_missingSearchOptions: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [27]

// MARK: - SelectedAttributeTypes_id_pr_missingServiceControlOptions_oid.swift
public let SelectedAttributeTypes_id_pr_missingServiceControlOptions: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [29]

// MARK: - SelectedAttributeTypes_id_pr_searchAttributeCombinationViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchAttributeCombinationViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [6]

// MARK: - SelectedAttributeTypes_id_pr_searchAttributeViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchAttributeViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [5]

// MARK: - SelectedAttributeTypes_id_pr_searchContextCombinationViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchContextCombinationViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [14]

// MARK: - SelectedAttributeTypes_id_pr_searchContextValueRequired_oid.swift
public let SelectedAttributeTypes_id_pr_searchContextValueRequired: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [17]

// MARK: - SelectedAttributeTypes_id_pr_searchContextValueViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchContextValueViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [16]

// MARK: - SelectedAttributeTypes_id_pr_searchContextViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchContextViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [13]

// MARK: - SelectedAttributeTypes_id_pr_searchSubsetViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchSubsetViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [30]

// MARK: - SelectedAttributeTypes_id_pr_searchValueNotAllowed_oid.swift
public let SelectedAttributeTypes_id_pr_searchValueNotAllowed: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [7]

// MARK: - SelectedAttributeTypes_id_pr_searchValueRequired_oid.swift
public let SelectedAttributeTypes_id_pr_searchValueRequired: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [11]

// MARK: - SelectedAttributeTypes_id_pr_searchValueViolation_oid.swift
public let SelectedAttributeTypes_id_pr_searchValueViolation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [9]

// MARK: - SelectedAttributeTypes_id_pr_targetDsaUnavailable_oid.swift
public let SelectedAttributeTypes_id_pr_targetDsaUnavailable: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [1]

// MARK: - SelectedAttributeTypes_id_pr_unavailableHierarchySelect_oid.swift
public let SelectedAttributeTypes_id_pr_unavailableHierarchySelect: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [25]

// MARK: - SelectedAttributeTypes_id_pr_unavailableOperation_oid.swift
public let SelectedAttributeTypes_id_pr_unavailableOperation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [4]

// MARK: - SelectedAttributeTypes_id_pr_unidentifiedOperation_oid.swift
public let SelectedAttributeTypes_id_pr_unidentifiedOperation: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [3]

// MARK: - SelectedAttributeTypes_id_pr_unmatchedKeyAttributes_oid.swift
public let SelectedAttributeTypes_id_pr_unmatchedKeyAttributes: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [31]

// MARK: - SelectedAttributeTypes_id_pr_unsupportedMatchingRule_oid.swift
public let SelectedAttributeTypes_id_pr_unsupportedMatchingRule: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [19]

// MARK: - SelectedAttributeTypes_id_pr_unsupportedMatchingUse_oid.swift
public let SelectedAttributeTypes_id_pr_unsupportedMatchingUse: ASN1ObjectIdentifier = UsefulDefinitions_id_pr + [21]

// MARK: - UsefulDefinitions_ID.swift
@usableFromInline typealias UsefulDefinitions_ID = ASN1ObjectIdentifier

// MARK: - UsefulDefinitions_abstractSyntax_oid.swift
public let UsefulDefinitions_abstractSyntax: ASN1ObjectIdentifier = UsefulDefinitions_ds + [9]

// MARK: - UsefulDefinitions_accessControlAttribute_oid.swift
public let UsefulDefinitions_accessControlAttribute: ASN1ObjectIdentifier = UsefulDefinitions_ds + [24]

// MARK: - UsefulDefinitions_accessControlSchemes_oid.swift
public let UsefulDefinitions_accessControlSchemes: ASN1ObjectIdentifier = UsefulDefinitions_ds + [28]

// MARK: - UsefulDefinitions_administrativeRoles_oid.swift
public let UsefulDefinitions_administrativeRoles: ASN1ObjectIdentifier = UsefulDefinitions_ds + [23]

// MARK: - UsefulDefinitions_algorithmObjectIdentifiers_oid.swift
public let UsefulDefinitions_algorithmObjectIdentifiers: ASN1ObjectIdentifier = UsefulDefinitions_module + [8, 3]

// MARK: - UsefulDefinitions_algorithm_oid.swift
public let UsefulDefinitions_algorithm: ASN1ObjectIdentifier = UsefulDefinitions_ds + [8]

// MARK: - UsefulDefinitions_applicationContext_oid.swift
public let UsefulDefinitions_applicationContext: ASN1ObjectIdentifier = UsefulDefinitions_ds + [3]

// MARK: - UsefulDefinitions_attributeSyntax_oid.swift
public let UsefulDefinitions_attributeSyntax: ASN1ObjectIdentifier = UsefulDefinitions_ds + [5]

// MARK: - UsefulDefinitions_attributeType_oid.swift
public let UsefulDefinitions_attributeType: ASN1ObjectIdentifier = UsefulDefinitions_ds + [4]

// MARK: - UsefulDefinitions_attributeValueContext_oid.swift
public let UsefulDefinitions_attributeValueContext: ASN1ObjectIdentifier = UsefulDefinitions_ds + [31]

// MARK: - UsefulDefinitions_authenticationFramework_oid.swift
public let UsefulDefinitions_authenticationFramework: ASN1ObjectIdentifier = UsefulDefinitions_module + [7, 3]

// MARK: - UsefulDefinitions_basicAccessControl_oid.swift
public let UsefulDefinitions_basicAccessControl: ASN1ObjectIdentifier = UsefulDefinitions_module + [24, 3]

// MARK: - UsefulDefinitions_certificateExtension_oid.swift
public let UsefulDefinitions_certificateExtension: ASN1ObjectIdentifier = UsefulDefinitions_ds + [29]

// MARK: - UsefulDefinitions_certificateExtensions_oid.swift
public let UsefulDefinitions_certificateExtensions: ASN1ObjectIdentifier = UsefulDefinitions_module + [26, 0]

// MARK: - UsefulDefinitions_contract_oid.swift
public let UsefulDefinitions_contract: ASN1ObjectIdentifier = UsefulDefinitions_ds + [26]

// MARK: - UsefulDefinitions_controlAttributeType_oid.swift
public let UsefulDefinitions_controlAttributeType: ASN1ObjectIdentifier = UsefulDefinitions_ds + [37]

// MARK: - UsefulDefinitions_dap_oid.swift
public let UsefulDefinitions_dap: ASN1ObjectIdentifier = UsefulDefinitions_module + [11, 3]

// MARK: - UsefulDefinitions_directoryAbstractService_oid.swift
public let UsefulDefinitions_directoryAbstractService: ASN1ObjectIdentifier = UsefulDefinitions_module + [2, 3]

// MARK: - UsefulDefinitions_directoryIDMProtocols_oid.swift
public let UsefulDefinitions_directoryIDMProtocols: ASN1ObjectIdentifier = UsefulDefinitions_module + [31, 4]

// MARK: - UsefulDefinitions_directoryManagement_oid.swift
public let UsefulDefinitions_directoryManagement: ASN1ObjectIdentifier = UsefulDefinitions_module + [27, 1]

// MARK: - UsefulDefinitions_directoryObjectIdentifiers_oid.swift
public let UsefulDefinitions_directoryObjectIdentifiers: ASN1ObjectIdentifier = UsefulDefinitions_module + [9, 3]

// MARK: - UsefulDefinitions_directoryOperationalBindingTypes_oid.swift
public let UsefulDefinitions_directoryOperationalBindingTypes: ASN1ObjectIdentifier = UsefulDefinitions_module + [25, 3]

// MARK: - UsefulDefinitions_directoryShadowAbstractService_oid.swift
public let UsefulDefinitions_directoryShadowAbstractService: ASN1ObjectIdentifier = UsefulDefinitions_module + [15, 3]

// MARK: - UsefulDefinitions_directoryShadowOIDs_oid.swift
public let UsefulDefinitions_directoryShadowOIDs: ASN1ObjectIdentifier = UsefulDefinitions_module + [14, 3]

// MARK: - UsefulDefinitions_disp_oid.swift
public let UsefulDefinitions_disp: ASN1ObjectIdentifier = UsefulDefinitions_module + [16, 3]

// MARK: - UsefulDefinitions_distributedDirectoryOIDs_oid.swift
public let UsefulDefinitions_distributedDirectoryOIDs: ASN1ObjectIdentifier = UsefulDefinitions_module + [13, 3]

// MARK: - UsefulDefinitions_distributedOperations_oid.swift
public let UsefulDefinitions_distributedOperations: ASN1ObjectIdentifier = UsefulDefinitions_module + [3, 3]

// MARK: - UsefulDefinitions_dop_oid.swift
public let UsefulDefinitions_dop: ASN1ObjectIdentifier = UsefulDefinitions_module + [17, 3]

// MARK: - UsefulDefinitions_ds_oid.swift
public let UsefulDefinitions_ds: ASN1ObjectIdentifier = [2, 5]

// MARK: - UsefulDefinitions_dsaOperationalAttributeTypes_oid.swift
public let UsefulDefinitions_dsaOperationalAttributeTypes: ASN1ObjectIdentifier = UsefulDefinitions_module + [22, 3]

// MARK: - UsefulDefinitions_dsaOperationalAttribute_oid.swift
public let UsefulDefinitions_dsaOperationalAttribute: ASN1ObjectIdentifier = UsefulDefinitions_ds + [12]

// MARK: - UsefulDefinitions_dsp_oid.swift
public let UsefulDefinitions_dsp: ASN1ObjectIdentifier = UsefulDefinitions_module + [12, 3]

// MARK: - UsefulDefinitions_enhancedSecurity_oid.swift
public let UsefulDefinitions_enhancedSecurity: ASN1ObjectIdentifier = UsefulDefinitions_module + [28, 1]

// MARK: - UsefulDefinitions_group_oid.swift
public let UsefulDefinitions_group: ASN1ObjectIdentifier = UsefulDefinitions_ds + [16]

// MARK: - UsefulDefinitions_hierarchicalOperationalBindings_oid.swift
public let UsefulDefinitions_hierarchicalOperationalBindings: ASN1ObjectIdentifier = UsefulDefinitions_module + [20, 3]

// MARK: - UsefulDefinitions_iDMProtocolSpecification_oid.swift
public let UsefulDefinitions_iDMProtocolSpecification: ASN1ObjectIdentifier = UsefulDefinitions_module + [30, 4]

// MARK: - UsefulDefinitions_id_acScheme_oid.swift
public let UsefulDefinitions_id_acScheme: ASN1ObjectIdentifier = UsefulDefinitions_accessControlSchemes

// MARK: - UsefulDefinitions_id_ac_oid.swift
public let UsefulDefinitions_id_ac: ASN1ObjectIdentifier = UsefulDefinitions_applicationContext

// MARK: - UsefulDefinitions_id_aca_oid.swift
public let UsefulDefinitions_id_aca: ASN1ObjectIdentifier = UsefulDefinitions_accessControlAttribute

// MARK: - UsefulDefinitions_id_ar_oid.swift
public let UsefulDefinitions_id_ar: ASN1ObjectIdentifier = UsefulDefinitions_administrativeRoles

// MARK: - UsefulDefinitions_id_as_oid.swift
public let UsefulDefinitions_id_as: ASN1ObjectIdentifier = UsefulDefinitions_abstractSyntax

// MARK: - UsefulDefinitions_id_at_oid.swift
public let UsefulDefinitions_id_at: ASN1ObjectIdentifier = UsefulDefinitions_attributeType

// MARK: - UsefulDefinitions_id_avc_oid.swift
public let UsefulDefinitions_id_avc: ASN1ObjectIdentifier = UsefulDefinitions_attributeValueContext

// MARK: - UsefulDefinitions_id_cat_oid.swift
public let UsefulDefinitions_id_cat: ASN1ObjectIdentifier = UsefulDefinitions_controlAttributeType

// MARK: - UsefulDefinitions_id_ce_oid.swift
public let UsefulDefinitions_id_ce: ASN1ObjectIdentifier = UsefulDefinitions_certificateExtension

// MARK: - UsefulDefinitions_id_contract_oid.swift
public let UsefulDefinitions_id_contract: ASN1ObjectIdentifier = UsefulDefinitions_contract

// MARK: - UsefulDefinitions_id_doa_oid.swift
public let UsefulDefinitions_id_doa: ASN1ObjectIdentifier = UsefulDefinitions_dsaOperationalAttribute

// MARK: - UsefulDefinitions_id_idm_oid.swift
public let UsefulDefinitions_id_idm: ASN1ObjectIdentifier = UsefulDefinitions_idmProtocol

// MARK: - UsefulDefinitions_id_kmr_oid.swift
public let UsefulDefinitions_id_kmr: ASN1ObjectIdentifier = UsefulDefinitions_knowledgeMatchingRule

// MARK: - UsefulDefinitions_id_mgt_oid.swift
public let UsefulDefinitions_id_mgt: ASN1ObjectIdentifier = UsefulDefinitions_managementObject

// MARK: - UsefulDefinitions_id_mr_oid.swift
public let UsefulDefinitions_id_mr: ASN1ObjectIdentifier = UsefulDefinitions_matchingRule

// MARK: - UsefulDefinitions_id_mre_oid.swift
public let UsefulDefinitions_id_mre: ASN1ObjectIdentifier = UsefulDefinitions_matchingRestriction

// MARK: - UsefulDefinitions_id_nf_oid.swift
public let UsefulDefinitions_id_nf: ASN1ObjectIdentifier = UsefulDefinitions_nameForm

// MARK: - UsefulDefinitions_id_not_oid.swift
public let UsefulDefinitions_id_not: ASN1ObjectIdentifier = UsefulDefinitions_notification

// MARK: - UsefulDefinitions_id_oa_oid.swift
public let UsefulDefinitions_id_oa: ASN1ObjectIdentifier = UsefulDefinitions_operationalAttributeType

// MARK: - UsefulDefinitions_id_ob_oid.swift
public let UsefulDefinitions_id_ob: ASN1ObjectIdentifier = UsefulDefinitions_operationalBinding

// MARK: - UsefulDefinitions_id_oc_oid.swift
public let UsefulDefinitions_id_oc: ASN1ObjectIdentifier = UsefulDefinitions_objectClass

// MARK: - UsefulDefinitions_id_package_oid.swift
public let UsefulDefinitions_id_package: ASN1ObjectIdentifier = UsefulDefinitions_package

// MARK: - UsefulDefinitions_id_pr_oid.swift
public let UsefulDefinitions_id_pr: ASN1ObjectIdentifier = UsefulDefinitions_problem

// MARK: - UsefulDefinitions_id_rosObject_oid.swift
public let UsefulDefinitions_id_rosObject: ASN1ObjectIdentifier = UsefulDefinitions_rosObject

// MARK: - UsefulDefinitions_id_sc_oid.swift
public let UsefulDefinitions_id_sc: ASN1ObjectIdentifier = UsefulDefinitions_subentry

// MARK: - UsefulDefinitions_id_soa_oid.swift
public let UsefulDefinitions_id_soa: ASN1ObjectIdentifier = UsefulDefinitions_schemaOperationalAttribute

// MARK: - UsefulDefinitions_id_soc_oid.swift
public let UsefulDefinitions_id_soc: ASN1ObjectIdentifier = UsefulDefinitions_schemaObjectClass

// MARK: - UsefulDefinitions_idmProtocol_oid.swift
public let UsefulDefinitions_idmProtocol: ASN1ObjectIdentifier = UsefulDefinitions_ds + [33]

// MARK: - UsefulDefinitions_informationFramework_oid.swift
public let UsefulDefinitions_informationFramework: ASN1ObjectIdentifier = UsefulDefinitions_module + [1, 3]

// MARK: - UsefulDefinitions_knowledgeMatchingRule_oid.swift
public let UsefulDefinitions_knowledgeMatchingRule: ASN1ObjectIdentifier = UsefulDefinitions_ds + [14]

// MARK: - UsefulDefinitions_managementObject_oid.swift
public let UsefulDefinitions_managementObject: ASN1ObjectIdentifier = UsefulDefinitions_ds + [30]

// MARK: - UsefulDefinitions_matchingRestriction_oid.swift
public let UsefulDefinitions_matchingRestriction: ASN1ObjectIdentifier = UsefulDefinitions_ds + [36]

// MARK: - UsefulDefinitions_matchingRule_oid.swift
public let UsefulDefinitions_matchingRule: ASN1ObjectIdentifier = UsefulDefinitions_ds + [13]

// MARK: - UsefulDefinitions_module_oid.swift
public let UsefulDefinitions_module: ASN1ObjectIdentifier = UsefulDefinitions_ds + [1]

// MARK: - UsefulDefinitions_nameForm_oid.swift
public let UsefulDefinitions_nameForm: ASN1ObjectIdentifier = UsefulDefinitions_ds + [15]

// MARK: - UsefulDefinitions_notification_oid.swift
public let UsefulDefinitions_notification: ASN1ObjectIdentifier = UsefulDefinitions_ds + [35]

// MARK: - UsefulDefinitions_objectClass_oid.swift
public let UsefulDefinitions_objectClass: ASN1ObjectIdentifier = UsefulDefinitions_ds + [6]

// MARK: - UsefulDefinitions_opBindingManagement_oid.swift
public let UsefulDefinitions_opBindingManagement: ASN1ObjectIdentifier = UsefulDefinitions_module + [18, 3]

// MARK: - UsefulDefinitions_opBindingOIDs_oid.swift
public let UsefulDefinitions_opBindingOIDs: ASN1ObjectIdentifier = UsefulDefinitions_module + [19, 3]

// MARK: - UsefulDefinitions_operationalAttributeType_oid.swift
public let UsefulDefinitions_operationalAttributeType: ASN1ObjectIdentifier = UsefulDefinitions_ds + [18]

// MARK: - UsefulDefinitions_operationalBinding_oid.swift
public let UsefulDefinitions_operationalBinding: ASN1ObjectIdentifier = UsefulDefinitions_ds + [19]

// MARK: - UsefulDefinitions_package_oid.swift
public let UsefulDefinitions_package: ASN1ObjectIdentifier = UsefulDefinitions_ds + [27]

// MARK: - UsefulDefinitions_problem_oid.swift
public let UsefulDefinitions_problem: ASN1ObjectIdentifier = UsefulDefinitions_ds + [34]

// MARK: - UsefulDefinitions_protocolObjectIdentifiers_oid.swift
public let UsefulDefinitions_protocolObjectIdentifiers: ASN1ObjectIdentifier = UsefulDefinitions_module + [4, 3]

// MARK: - UsefulDefinitions_rosObject_oid.swift
public let UsefulDefinitions_rosObject: ASN1ObjectIdentifier = UsefulDefinitions_ds + [25]

// MARK: - UsefulDefinitions_schemaAdministration_oid.swift
public let UsefulDefinitions_schemaAdministration: ASN1ObjectIdentifier = UsefulDefinitions_module + [23, 3]

// MARK: - UsefulDefinitions_schemaObjectClass_oid.swift
public let UsefulDefinitions_schemaObjectClass: ASN1ObjectIdentifier = UsefulDefinitions_ds + [20]

// MARK: - UsefulDefinitions_schemaOperationalAttribute_oid.swift
public let UsefulDefinitions_schemaOperationalAttribute: ASN1ObjectIdentifier = UsefulDefinitions_ds + [21]

// MARK: - UsefulDefinitions_selectedAttributeTypes_oid.swift
public let UsefulDefinitions_selectedAttributeTypes: ASN1ObjectIdentifier = UsefulDefinitions_module + [5, 3]

// MARK: - UsefulDefinitions_selectedObjectClasses_oid.swift
public let UsefulDefinitions_selectedObjectClasses: ASN1ObjectIdentifier = UsefulDefinitions_module + [6, 3]

// MARK: - UsefulDefinitions_serviceElement_oid.swift
public let UsefulDefinitions_serviceElement: ASN1ObjectIdentifier = UsefulDefinitions_ds + [2]

// MARK: - UsefulDefinitions_subentry_oid.swift
public let UsefulDefinitions_subentry: ASN1ObjectIdentifier = UsefulDefinitions_ds + [17]

// MARK: - UsefulDefinitions_upperBounds_oid.swift
public let UsefulDefinitions_upperBounds: ASN1ObjectIdentifier = UsefulDefinitions_module + [10, 3]

// MARK: - UsefulDefinitions_usefulDefinitions_oid.swift
public let UsefulDefinitions_usefulDefinitions: ASN1ObjectIdentifier = UsefulDefinitions_module + [0, 3]

