// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUIThemeFlow",
    platforms: [
            .iOS("16.0"),
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
