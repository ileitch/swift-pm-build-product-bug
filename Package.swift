// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MyTool",
    products: [
        .executable(name: "mytool", targets: ["MyTool"]),
        .plugin(name: "MyToolPlugin", targets: ["MyToolCommandPlugin"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "MyTool"),
        .testTarget(
            name: "MyToolTests",
            dependencies: ["MyTool"]),
        .plugin(
            name: "MyToolCommandPlugin",
            capability: .command(
                intent: .custom(verb: "mytool", description: "My tool"),
                permissions: []
            ),
            dependencies: [
                .target(name: "MyToolBinary", condition: .when(platforms: [.macOS])),
            ]
        ),
        .binaryTarget(
            name: "MyToolBinary",
            url: "https://example.com/some.artifactbundle.zip",
            checksum: "abc123"
        ),
    ]
)
