# Numeric Finite Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Retroactive `Finite.Enumerable` conformances that make the `Numeric.Sign` and `Numeric.Ternary` enums ordinal-indexable, with a fixed `count` and a lossless round-trip between a value and its ordinal.

---

## Quick Start

`Numeric.Sign` (positive / negative / zero) and `Numeric.Ternary` (the balanced-ternary digit −1 / 0 / +1) are small, fixed-cardinality classifications. This package teaches both of them the `Finite.Enumerable` protocol, so each gains a stable `count`, an `ordinal` in `0..<count`, and an unchecked initializer that reconstructs a value from its ordinal — the isomorphism to `Ordinal<N>` that every finite type shares.

```swift
import Numeric_Finite_Primitives

// Both enums now report a fixed number of inhabitants.
print(Numeric.Sign.count)       // 3
print(Numeric.Ternary.count)    // 3

// Project any value to its ordinal — a compact, stable index in 0..<count.
let sign = Numeric.Sign.negative
let index = sign.ordinal         // 1

// Reconstruct it from that ordinal on the unchecked fast path (index is in range).
let restored = Numeric.Sign(_unchecked: (), ordinal: index)
print(restored == sign)          // true
```

Because both types stay `CaseIterable`, ordinals line up with iteration order — the basis for ordinal-keyed tables, compact serialization, and exhaustive case coverage:

```swift
import Numeric_Finite_Primitives

for value in Numeric.Ternary.allCases {
    print(value, value.ordinal)
}
// negative 0
// zero 1
// positive 2
```

A single `import Numeric_Finite_Primitives` re-exports the `Numeric` vocabulary and the `Finite.Enumerable`, `Cardinal`, and `Ordinal` primitives, so the conformance and everything it touches arrive together.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-numeric-finite-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Numeric Finite Primitives", package: "swift-numeric-finite-primitives"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products. This package owns no new types — it composes `Numeric.Sign` and `Numeric.Ternary` from `swift-numeric-primitives` with the `Finite.Enumerable` protocol from `swift-finite-primitives`.

| Product | Target | Purpose |
|---------|--------|---------|
| `Numeric Finite Primitives` | `Sources/Numeric Finite Primitives/` | Retroactive `Finite.Enumerable` conformances for `Numeric.Sign` and `Numeric.Ternary` (`count`, `ordinal`, `init(_unchecked:ordinal:)`); re-exports the `Finite Enumerable Primitives` and `Numeric Primitives` vocabularies. |
| `Numeric Finite Primitives Test Support` | `Tests/Support/` | Test-support module for downstream packages' test targets. |

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
