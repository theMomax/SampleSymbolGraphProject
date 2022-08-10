import SwiftUI
import A
import B

// testing availability handling

@available(macOS 10.15, *)
public extension Color {
    static var beige: Color { Color(red: 0.961, green: 0.961, blue: 0.863) }
}

/// This package adds awesome transformation effects to SwiftUI views.
@available(macOS 10.15, *)
public extension View {
    func verticallyMirrored() -> some View {
        self.transformEffect(CGAffineTransform(scaleX: 1, y: -1))
    }
}

public extension AStruct {
    var sample: String { "SampleSymbolGraphProject" }
}

// testing type-kind collision resolution
public let b = ""

public extension BStruct {
    var sample: String { "SampleSymbolGraphProject" }
}

public extension AProtocolWithRequirement {
    /// The default implementation.
    func aFoo() {}
}
