public protocol AProtocol {}

public extension AProtocol {
    func aFoo() {}
}

public typealias AProto = AProtocol

public struct AStruct {
    public init() {}
    
    public var aFoo: String = ""
}

public extension AStruct {
    struct AStruct {}
}

public struct AStruct2 {
    public struct Inner {
        public struct Inner {
            public struct Inner {
                public struct Inner {
                    public struct Inner {
                        
                    }
                }
            }
        }
    }
}

public struct AStruct3 {}

public struct AStruct4 {}

public struct AStruct5 {}

public struct AStruct6 {}

public struct AStruct7 {}

public protocol AProtocolWithRequirement {
    func aFoo()
}
