import Numeric_Finite_Primitives
import Testing

@Suite("Enumerable Tests")
struct EnumerableTests {
    @Suite struct Unit {}
}

extension EnumerableTests.Unit {
    @Test
    func `sign count is three`() {
        #expect(Numeric.Sign.count == 3)
    }

    @Test
    func `sign positive is ordinal zero`() {
        let value = Numeric.Sign.positive
        #expect(value.ordinal == 0)
        #expect(Numeric.Sign(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }

    @Test
    func `sign negative is ordinal one`() {
        let value = Numeric.Sign.negative
        #expect(value.ordinal == 1)
        #expect(Numeric.Sign(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }

    @Test
    func `sign zero is ordinal two`() {
        let value = Numeric.Sign.zero
        #expect(value.ordinal == 2)
        #expect(Numeric.Sign(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }

    @Test
    func `ternary count is three`() {
        #expect(Numeric.Ternary.count == 3)
    }

    @Test
    func `ternary negative is ordinal zero`() {
        let value = Numeric.Ternary.negative
        #expect(value.ordinal == 0)
        #expect(Numeric.Ternary(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }

    @Test
    func `ternary zero is ordinal one`() {
        let value = Numeric.Ternary.zero
        #expect(value.ordinal == 1)
        #expect(Numeric.Ternary(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }

    @Test
    func `ternary positive is ordinal two`() {
        let value = Numeric.Ternary.positive
        #expect(value.ordinal == 2)
        #expect(Numeric.Ternary(_unchecked: (), ordinal: value.ordinal).ordinal == value.ordinal)
    }
}
