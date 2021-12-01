// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "StaticSite",
    products: [
        .executable(
            name: "StaticSite",
            targets: ["StaticSite"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0"),
        .package(url: "https://github.com/alex-ross/highlightjspublishplugin", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "StaticSite",
            dependencies: [
                "Publish",
                .product(name: "HighlightJSPublishPlugin", package: "highlightjspublishplugin")
            ]
        )
    ]
)
