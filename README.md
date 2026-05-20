# LibPARI.jl

A Julia wrapper for the [PARI/GP](https://pari.math.u-bordeaux.fr/)
number-theory library.

LibPARI embeds the PARI/GP C library in a Julia process and exposes it two
ways: over 1200 functions generated directly from PARI's own machine-readable
function database (the `LibPARI.PARI` submodule), and a hand-written core —
a `Gen` value type wrapping every PARI object, idiomatic numeric operators,
conversions to and from Julia numbers, a GP expression evaluator, and safe
library lifecycle and error handling.

## Documentation

Full documentation — introduction, getting-started guide, and API reference —
is published at **<https://s-celles.github.io/LibPARI.jl>**.

## Features

- **`Gen <: Number`** — PARI objects are first-class Julia numbers, with
  `+`, `-`, `*`, `/`, `^`, and `==`, and mixed `Gen`/Julia arithmetic.
- **Exact arbitrary-size arithmetic** — PARI bignum integers, rationals, and
  reals, with conversions back to `BigInt` and fixed-width integer types.
- **`gp_eval`** — evaluate any GP-language expression, the escape hatch to
  every PARI capability.
- **A safe C boundary** — every PARI error becomes a catchable `PariError`;
  PARI's stack stays leak-free and each `Gen` frees its own storage.
- **Thread-safe** — every `libpari` call is marshalled onto one dedicated
  worker task, so LibPARI is correct under multi-threaded Julia.
- **Type-stable and precompiled** — built to SciML inference standards.

## Installation

`LibPARI` depends on `PARI_jll`, which is not yet in the Julia General
registry ([Yggdrasil PR #13771](https://github.com/JuliaPackaging/Yggdrasil)).
Until it is registered, resolve both packages from local development paths:

```julia
using Pkg
Pkg.develop(path = joinpath(homedir(), ".julia", "dev", "PARI_jll"))
Pkg.develop(path = "path/to/LibPARI.jl")
```

LibPARI requires Julia 1.10 (the long-term-support release) or later.

## Quick example

```julia
using LibPARI

a = LibPARI.Gen(42)
a * a + LibPARI.Gen(1)                  # 1765
LibPARI.Gen(2)^100                      # 1267650600228229401496703205376
BigInt(LibPARI.Gen(2)^64)               # 18446744073709551616

LibPARI.PARI.nextprime(LibPARI.Gen(1000))   # 1009
LibPARI.gp_eval("sum(k = 1, 100, k^2)")     # 338350
```

See the
[getting-started guide](https://s-celles.github.io/LibPARI.jl/getting-started/)
for a fuller tour.

## Development

- Tests: `julia --project=. -e 'using Pkg; Pkg.test()'`
- Documentation: `julia --project=docs docs/make.jl` (after
  `Pkg.develop(path = ".")` + `Pkg.instantiate()` in the `docs/`
  environment).
- Formatting: 80-column margin, enforced by JuliaFormatter and `pre-commit`.
- The project follows Semantic Versioning; notable changes are recorded in
  [`CHANGELOG.md`](CHANGELOG.md). The implementation plan is in
  [`ROADMAP.md`](ROADMAP.md).
