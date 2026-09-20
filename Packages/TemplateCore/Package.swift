// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "TemplateCore",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "TemplateCore", targets: ["TemplateCore"]),
        .executable(name: "templateCli", targets: ["templateCli"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .target(name: "TemplateCore"),
        .executableTarget(
            name: "templateCli",
            dependencies: [
                "TemplateCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .testTarget(
            name: "TemplateCoreTests",
            dependencies: ["TemplateCore"],
            resources: [.copy("Fixtures")]
        ),
    ]
)
