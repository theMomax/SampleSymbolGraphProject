# SampleSymbolGraphProject
This is a sample project for demonstrating, testing, and discussing the changes introduced by apple/swift#59047 and apple/swift-docc#210.

## Resources

* You can find the Swift files in the respective module folders.
* The Symbol Graph Files are emitted to [SampleSymbolGraphProject/.build/symbol-graphs](SampleSymbolGraphProject/.build/symbol-graphs).
* The documentation archive (prepared for static hosting) is located at [docs](docs)
* The live documentation archive is hosted [here](https://themomax.github.io/SampleSymbolGraphProject/documentation/samplesymbolgraphproject/) via GitHub pages.

## Build Instructions

> **Note** You might need to switch out the os/arch parts for some of the paths below to match your system.

Build the Swift compiler from apple/swift#59047 (latest build: [`c1fb185`](https://github.com/theMomax/swift-docc-symbolkit/commit/c1fb185b472411620cce49a82ad462f602fd52c3))

In the [SampleSymbolGraphProject](SampleSymbolGraphProject) folder, run the following commands to generate the symbol graph files with extension block symbols.
```
swift package clean && rm -rf .build/symbol-graphs && mkdir -p .build/symbol-graphs
SWIFT_EXEC=PATH/TO/YOUR/APPLE/FOLDER/build/Ninja-RelWithDebInfoAssert/swift-macosx-arm64/bin/swiftc swift build \
  --target SampleSymbolGraphProject \
  -Xswiftc -emit-symbol-graph \
  -Xswiftc -emit-symbol-graph-dir \
  -Xswiftc .build/symbol-graphs \
  -Xswiftc -emit-extension-block-symbols
```

Check out swift-docc at apple/swift-docc#335 (latest build: [`06cdfd2`](https://github.com/apple/swift-docc/pull/335/commits/06cdfd2a548d08cc3badc37fc9b4bb7213050880))

Get the [swift-docc-render artifact](https://github.com/apple/swift-docc-render-artifact).

In the swift-docc directory, run the following commands to build `docc` and generate the `doccarchive`.

```
swift build
DOCC_HTML_DIR=/PATH/TO/APPLE/SWIFT-DOCC-RENDER-ARTIFACT/FOLDER/dist .build/arm64-apple-macosx/debug/docc convert \
  /PATH/TO/THIS/REPOSITORY/SampleSymbolGraphProject/Sources/SampleSymbolGraphProject/SampleSymbolGraphProject.docc \
  --fallback-display-name SampleSymbolGraphProject \
  --fallback-bundle-identifier org.test.SampleSymbolGraphProject \
  --fallback-bundle-version 1.0.0 \
  --additional-symbol-graph-dir /PATH/TO/THIS/REPOSITORY/SampleSymbolGraphProject/.build/symbol-graphs \
  --output-path  /PATH/TO/THIS/REPOSITORY/docs \
  --hosting-base-path SampleSymbolGraphProject
```
