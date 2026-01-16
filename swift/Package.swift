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
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Cryptonite"),
        .testTarget(
            name: "CryptoniteTests",
            dependencies: ["Cryptonite"]),
    ]
)
