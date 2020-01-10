// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "LibraryTemplate",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        .library(name: "LibraryTemplate", targets: ["LibraryTemplate"]),
    ],
    targets: [
        .target(name: "LibraryTemplate", dependencies: [], path: "Sources"),
        .testTarget(name: "LibrarySetupTests", dependencies: ["LibraryTemplate"], path: "Tests"),
    ],
    swiftLanguageVersions: [.v5]
)
