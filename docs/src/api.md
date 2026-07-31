```@meta
CurrentModule = LibPARI
```

# API reference

LibPARI exposes PARI/GP to Julia through two layers: a large
machine-generated binding layer, and a compact hand-written core. This page
documents both.

## The generated bindings — `LibPARI.PARI`

The `LibPARI.PARI` submodule holds nearly 1200 bindings, one per eligible
PARI/GP function, generated directly from PARI's own machine-readable
function database (`pari.desc`). Each binding:

- keeps PARI's function name (e.g. `LibPARI.PARI.nextprime`,
  `LibPARI.PARI.factorial`, `LibPARI.PARI.isprime`);
- carries PARI's own `Help` text as its docstring — query it with `?` at the
  REPL, e.g. `?LibPARI.PARI.nextprime`;
- takes and returns [`Gen`](@ref) values (or the scalar Julia type the
  function's prototype calls for), and is type-stable;
- routes through the same safe, leak-free, thread-safe call boundary as the
  hand-written API.

A few prototype conventions are worth knowing:

- **Precision arguments** are supplied automatically; pass a `prec` keyword
  to override the working precision.
- **Optional arguments** are exposed as keyword arguments with PARI's
  declared defaults.
- **Output arguments** are returned alongside the primary result as a tuple.
- Functions taking a **GP closure** argument are not generated — reach them
  through [`gp_eval`](@ref) instead.

Because the binding layer is generated, it is not enumerated symbol-by-symbol
here; PARI's own [function reference](https://pari.math.u-bordeaux.fr/doc.html)
is the authoritative index of what each function computes. The rest of this
page documents the hand-written core in full.

## Hand-written core

```@index
Pages = ["api.md"]
```

### Library lifecycle

```@docs
LibPARI.LibraryState
```

```@autodocs
Modules = [LibPARI]
Pages = ["lifecycle.jl"]
```

### The `Gen` value type

```@autodocs
Modules = [LibPARI]
Pages = ["gen.jl"]
```

```@docs
LibPARI.PariType
```

### Error handling

```@docs
LibPARI.PariErr
```

```@autodocs
Modules = [LibPARI]
Pages = ["errors.jl"]
```

### The entry point and the high-level facade

`pari(x)` is the entry point; the rest of this section is the deliberately
small facade over the generated layer. Every facade function documents the
Julia and PARI inputs it accepts, its exact return type, and how it fails.

```@autodocs
Modules = [LibPARI]
Pages = ["facade.jl"]
```

### Type conversions

LibPARI converts an *enumerated* set of Julia types, not every `Number`.
The set is [`LibPARI.PariConvertible`](@ref) and the single entry point is
[`LibPARI.gen_convert`](@ref); `Gen(x)`, `convert(Gen, x)` and every
mixed-operand operator funnel through it, so one type is converted in
exactly one way.

**Into a `Gen`:**

| Julia type | PARI type | Notes |
|------------|-----------|-------|
| `Bool` | `t_INT` | `0`/`1` — PARI has no boolean type, and `Bool <: Integer` |
| `Int8` … `Int128`, `UInt8` … `UInt128` | `t_INT` | exact at every width |
| `BigInt` | `t_INT` | exact, any magnitude |
| `Rational{<:Integer}` | `t_FRAC` | reduced by PARI; an integral value normalises to `t_INT` |
| `Float16`, `Float32`, `Float64` | `t_REAL` | exact |
| `BigFloat` | `t_REAL` | exact — see [Precision](@ref) |
| `Complex{T}`, `T` convertible | `t_COMPLEX` | a zero imaginary part normalises to the real type |

Anything else — an `Irrational` such as `π`, a `Missing`, a foreign
numeric type — raises [`LibPARI.ConversionError`](@ref), which names the
offending type. A downstream package adds support for its own type by
defining a `LibPARI.gen_convert` method for it, which is type piracy on
neither side.

`Inf`, `-Inf` and `NaN` raise `InexactError`: PARI's `t_INFINITY` exists
but does not take part in general arithmetic, so mapping onto it would
produce values that fail later, far from the conversion.

**Out of a `Gen`:** `BigInt`, `Bool` and the fixed-width integer types
(`InexactError` when the value is not an integer or does not fit);
`Rational` and `Rational{T}`; `Float16`, `Float32`, `Float64` and
`BigFloat`; `Complex` and `Complex{T}`. A `t_REAL` is decomposed with
PARI's own mantissa and exponent rather than re-parsed from its printed
form, so the conversion neither loses digits nor fails on a large
exponent.

```@autodocs
Modules = [LibPARI]
Pages = ["conversions.jl"]
```

### Numeric API

`Gen` is a [`PariObject`](@ref LibPARI.PariObject), **not** a Julia
`Number` — one concrete `Gen` wraps every PARI object, matrices and strings
included. The numeric surface is therefore declared explicitly, not
inherited: `+`, `-`, `*`, `/`, `^`, `\`, `==`, `<`, `<=` and `isless` have
methods for `Gen`/`Gen` and for a `Gen` against a Julia `Integer`,
`AbstractFloat`, `Rational` or `Complex`, in either operand order. `Gen`
also carries the `zero`/`one` identities, the standard predicates
(`iszero`, `isinteger`, `isfinite`, …), the elementary operations (`abs`,
`sign`, `inv`, `conj`, `real`, `imag`), `hash`, `float`, `abs2`, `adjoint`,
`transpose` and scalar broadcasting — so a `Gen` sorts and serves as a
`Dict`/`Set` key interchangeably with an equal Julia number.

Generic code bounded by `T<:Number` — parts of LinearAlgebra, other numeric
packages — does **not** accept a `Gen`; dispatch on
[`PariObject`](@ref LibPARI.PariObject), or convert. An operation that does
not apply to a `Gen`'s underlying PARI type raises a catchable
[`PariError`](@ref).

```@autodocs
Modules = [LibPARI]
Pages = ["numeric.jl"]
```

### GP expression evaluator

```@autodocs
Modules = [LibPARI]
Pages = ["evaluator.jl"]
```

### Module

```@autodocs
Modules = [LibPARI]
Pages = ["LibPARI.jl"]
```
