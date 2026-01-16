// swift-tools-version: 5.9
// The Swift Programming Language
// https://docs.swift.org/swift-book

import PackageDescription

let package = Package(
    name: "Cryptonite",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Cryptonite",
            targets: ["Cryptonite"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-asn1.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Cryptonite",
            dependencies: [
                .product(name: "SwiftASN1", package: "swift-asn1"),
            ]),
        .testTarget(
            name: "CryptoniteTests",
            dependencies: ["Cryptonite"]),
    ]
)
