import A
import B
import C

public struct DStruct {}

// test collision accross typealias
public extension AProtocol {
    func dbar() -> Double { 0.0 }
}

// test collision accross typealias
public extension AProto {
    func dbar() -> Int { 0 }
}

// test collision between syntzesized members (see C, E)
public extension BProtocol {
    func bar() -> DStruct {
        print("d")
        return DStruct()
    }
}

/// Testing local link resolution to ``C`` (`C`)  (doesn't work yet)
public extension CStruct {
    func foo() {}
}

// This construction is interesting, because the
// swift.extension symbol (as well as AStruct.BStruct.CStruct.DStruct)
// will be emitted in D@A.symbols.json, but the swiftExtension.extendedModule
// will be "C".
public extension AStruct.BStruct.CStruct {
    struct DStruct { }
}
