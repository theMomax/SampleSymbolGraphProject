import A
import B
import C
import D

// test collision between syntzesized members (see C, D)

extension AStruct: BProtocol {}


public func execute() {
    let _: CStruct = AStruct().bar()
    let _: DStruct = AStruct().bar()
}

public extension AStruct2 {
    func efoo() {}
}

public extension AStruct2.Inner {
    func efoo() {}
}

public extension AStruct2.Inner.Inner {
    func efoo() {}
}

public extension AStruct2.Inner.Inner.Inner.Inner {
    func efoo() {}
}
