// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HiddenToggle",
    platforms: [.macOS(.v13)],
    targets: [
        .executableTarget(
            name: "HiddenToggle",
            path: "Sources/HiddenToggle",
            resources: [.copy("Resources")]
        )
    ]
)
