import A
import B

public struct CStruct { }

// test basic collision
public extension AProtocol {
    func bar(val: Int) {}
    
    func bar(val: Double) {}
}

// test collision between syntzesized members (see D, E)
public extension BProtocol {
    func bar() -> CStruct {
        print("c")
        return CStruct()
    }
}


// This construction is interesting, because the
// swift.extension symbol (as well as AStruct.BStruct.CStruct)
// will be emitted in C@A.symbols.json, but the swiftExtension.extendedModule
// will be "B".
public extension AStruct.BStruct {
    struct CStruct { }
}
