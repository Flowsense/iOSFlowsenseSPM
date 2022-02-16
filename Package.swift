// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOSFlowsenseSPM",
    platforms: [.iOS(.v11)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iOSFlowsenseSPM",
            targets: ["iOSFlowsenseSPMTargets"]),
    ],
    dependencies: [
        .package(name:"AWSiOSSDKV2", url: "https://github.com/aws-amplify/aws-sdk-ios-spm.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "FlowsenseSDK",
            url: "https://github.com/Flowsense/iOSFlowsenseSPM/releases/download/4.1.1/SDK_4.1.1.zip",
            checksum: "bfcdddf85b2f5b364ddcb4d16d679c3ba49bc648b2776f27b93258057b4b126a"
        ),
        .target(name: "iOSFlowsenseSPMTargets",
                dependencies: [
                    .target(name: "FlowsenseSDK"),
                    .product(name: "AWSCore", package: "AWSiOSSDKV2"),
                    .product(name: "AWSKinesis", package: "AWSiOSSDKV2")
                ],
                path: "Sources")
    ]
)
