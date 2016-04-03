import PackageDescription

let package = Package(
    name: "GeneticAlgorithm",
    dependencies: [
        .Package(url: "https://github.com/VeniceX/Venice.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/Zewo/Data.git", majorVersion: 0, minor: 4)
    ]
)
