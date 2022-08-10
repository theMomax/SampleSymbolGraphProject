# SampleSymbolGraphProject
This is a sample project for demonstrating, testing, and discussing the changes introduced by apple/swift#59047 and apple/swift-docc#210.

## Resources

* You can find the Swift files in the respective module folders.
* The Symbol Graph Files are emitted to [SampleSymbolGraphProject/.build/symbol-graphs](SampleSymbolGraphProject/.build/symbol-graphs).
* The documentation archive (prepared for static hosting) is located at [docs](docs)
* The live documentation archive is hosted [here](https://themomax.github.io/SampleSymbolGraphProject/documentation/samplesymbolgraphproject/) via GitHub pages.

## Build Instructions

> **Note** You might need to switch out the os/arch parts for some of the paths below to match your system.

Build the Swift compiler from apple/swift#59047 (latest build: [`fb9ecb2`](https://github.com/apple/swift/pull/59047/commits/fb9ecb25924353e26fd130d21c174713786a640e))

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

Check out swift-docc at apple/swift-docc#335 (latest build: [`3ae5f3b`](https://github.com/apple/swift-docc/pull/335/commits/3ae5f3b0a3af8ed32d3d6c69ddf90938cb6706ce))

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
