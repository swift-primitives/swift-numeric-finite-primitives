// swift-tools-version: 6.3.1

import PackageDescription

let package = Package(
    name: "swift-numeric-finite-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(
            name: "Numeric Finite Primitives",
            targets: ["Numeric Finite Primitives"]
        ),
        .library(
            name: "Numeric Finite Primitives Test Support",
            targets: ["Numeric Finite Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-finite-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-primitives/swift-numeric-primitives.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Numeric Finite Primitives",
            dependencies: [
                .product(name: "Finite Enumerable Primitives", package: "swift-finite-primitives"),
                .product(name: "Numeric Primitives", package: "swift-numeric-primitives"),
            ]
        ),
        .target(
            name: "Numeric Finite Primitives Test Support",
            dependencies: [
                "Numeric Finite Primitives",
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Numeric Finite Primitives Tests",
            dependencies: [
                "Numeric Finite Primitives",
                "Numeric Finite Primitives Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
