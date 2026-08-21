public import Finite_Enumerable_Primitives
public import Numeric_Primitives

extension Numeric.Ternary: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 3 }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .negative: 0
        case .zero: 1
        case .positive: 2
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.negative, .zero, .positive][ordinal]
    }
}
