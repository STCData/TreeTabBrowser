// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TTBrowser",
    platforms: [
        .macOS(.v12),
        .iOS(.v13),

    ],

    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TTBrowser",
            targets: ["TTBrowser"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.2"),
        .package(url: "https://github.com/will-lumley/FaviconFinder.git", from: "3.1.0"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TTBrowser",
            dependencies: [
                "FaviconFinder",
                .product(name: "Logging", package: "swift-log")
            ]),
        .testTarget(
            name: "TTBrowserTests",
            dependencies: ["TTBrowser"]),
    ]
)
