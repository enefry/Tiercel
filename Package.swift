// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tiercel",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "Tiercel",targets: ["Tiercel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/enefry/ConcurrencyCollection", from: "0.0.1"),
        .package(url: "https://github.com/enefry/LoggerProxy.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Tiercel",dependencies: [
                .productItem(name: "LoggerProxy",package: "LoggerProxy"),
                .productItem(name: "ConcurrencyCollection", package: "ConcurrencyCollection"),
            ],
            path: "Sources")
    ],
    swiftLanguageVersions: [.version("5.6")]
)
