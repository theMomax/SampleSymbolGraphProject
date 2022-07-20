import A

public protocol BProtocol {}

public extension BProtocol {
    func bFoo() {}
}

public struct BStruct {
    public var bFoo: String = ""
}

public extension AStruct {
    struct BStruct {}
}

// testing stability of documentation comments

/// 1
public extension AStruct {
    func bBar1() {}
}

/// 2
public extension AStruct {
    func bBar2() {}
}


// testing stability of USR/links
public extension AStruct {
    func bFoo1() { }
}

public extension AStruct.AStruct {
    func bFoo2() { }
}

/// This is the in-code documentation for ``AStruct6``
public extension AStruct6 {
    func foo() {}
}
