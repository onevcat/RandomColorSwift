// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "RandomColor",
    platforms: [.iOS(.v8), .macOS(.v10_10), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(name: "RandomColor", targets: ["RandomColor"])
    ],
    targets: [
        .target(
            name: "RandomColor",
            path: "RandomColor"
        )
    ]
)
