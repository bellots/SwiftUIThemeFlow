// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUIThemeFlow",
    platforms: [
            .iOS("14.0"),
    ],
    products: [
            .library(
            name: "SwiftUIThemeFlow",
            targets: ["SwiftUIThemeFlow"]
        ),
    ],
    dependencies: [],
    targets: [
            .target(
            name: "SwiftUIThemeFlow",
            dependencies: [],
            path: "SwiftUIThemeFlow"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
