public import Finite_Enumerable_Primitives
public import Numeric_Primitives

extension Numeric.Sign: @retroactive Finite.Enumerable {

    @inlinable
    public static var count: Cardinal { 3 }

    @inlinable
    public var ordinal: Ordinal {
        switch self {
        case .positive: 0
        case .negative: 1
        case .zero: 2
        }
    }

    @inlinable
    public init(_unchecked: Void, ordinal: Ordinal) {
        self = [.positive, .negative, .zero][ordinal]
    }
}
