// swift-tools-version:5.5
import PackageDescription

let package =
  Package(
    name: "SwiftUIGrid",
    platforms: [
      .iOS(.v15),
      .watchOS(.v8),
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
      // NOTE: Re-enable when tests are added.
//      .testTarget(
//        name: "SwiftUIGridTests",
//        dependencies: ["SwiftUIGrid"]
//      ),
    ]
  )
