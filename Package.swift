// swift-tools-version:5.7
// We're hiding dev, test, and danger dependencies with // dev to make sure they're not fetched by users of this package.
import PackageDescription

let package = Package(
    name: "WeScan",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "WeScan", targets: ["WeScan"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.10.0")
    ],
    targets: [
        .target(name: "WeScan",
                exclude: [
                    "Info.plist",
                    "WeScan.h"
                ],
                resources: [
                    .process("Resources")
                ]),
        .testTarget(
            name: "WeScanTests",
            dependencies: [
                "WeScan",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
