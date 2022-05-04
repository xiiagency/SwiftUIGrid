// swift-tools-version:5.5
import PackageDescription

let package =
  Package(
    name: "SwiftUIGrid",
    platforms: [
      .iOS(.v15),
      .watchOS(.v8),
      .macOS(.v12),
    ],
    products: [
      .library(
        name: "SwiftUIGrid",
        targets: ["SwiftUIGrid"]
      ),
    ],
    dependencies: [],
    targets: [
      .target(
        name: "SwiftUIGrid",
        dependencies: []
      ),
    ]
  )
