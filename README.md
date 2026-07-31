# LibPARI.jl

A Julia wrapper for the [PARI/GP](https://pari.math.u-bordeaux.fr/)
number-theory library.

LibPARI embeds the PARI/GP C library in a Julia process and exposes it two
ways: nearly 1200 functions generated directly from PARI's own machine-readable
function database (the `LibPARI.PARI` submodule), and a hand-written core —
a `Gen` value type wrapping every PARI object, idiomatic numeric operators,
conversions to and from Julia numbers, a GP expression evaluator, and safe
library lifecycle and error handling.

LibPARI.jl is an independent, community-maintained Julia interface to the [PARI/GP](https://pari.math.u-bordeaux.fr/) computer algebra system. This project is not affiliated with, endorsed by, or maintained by the PARI Group or the PARI/GP development team.
PARI/GP is developed by the PARI Group and distributed under the GNU General Public License. This wrapper merely calls into the official PARI library (distributed here via PARI_jll) and does not modify it.

- Bugs or feature requests concerning this Julia wrapper should be reported to this repository's issue tracker.

- Bugs or feature requests concerning PARI/GP itself should be directed to the [official PARI/GP bug tracker](https://pari.math.u-bordeaux.fr/Bugs/) or the [pari-users mailing list](https://pari.math.u-bordeaux.fr/lists-index.html).

Any errors in the Julia interface, the high-level API, or its documentation are the responsibility of this project's maintainers, not of the PARI Group.

Substantial portions of this code were generated with AI assistance and reviewed by the maintainer. See [topic ai-generated-code] for details.

## Documentation

Full documentation — introduction, getting-started guide, and API reference —
is published at **<https://s-celles.github.io/LibPARI.jl>**.

## Features

- **`Gen <: LibPARI.PariObject`** — one wrapper for every PARI object, with
  `+`, `-`, `*`, `/`, `^`, `\`, `==` and ordering as explicit methods,
  including mixed `Gen`/Julia-number arithmetic in either operand order. A
  `Gen` is deliberately **not** a Julia `Number`: the same type also wraps
  matrices, strings and closures.
- **Exact arbitrary-size arithmetic** — PARI bignum integers, rationals, and
  reals, with conversions back to `BigInt` and fixed-width integer types.
- **`pari(x)`** — one entry point, converting Julia integers of any size,
  rationals, floats (`BigFloat` exactly) and complex numbers.
- **Precision in bits** — `setprecision(Gen, 256) do ... end`, a nesting
  scope that reaches the generated bindings too.
- **`gp_eval`** — evaluate any GP-language expression, the escape hatch to
  every PARI capability.
- **A safe C boundary** — every PARI error becomes a catchable `PariError`;
  PARI's stack stays leak-free and each `Gen` frees its own storage.
- **Parallel and thread-safe** — one PARI context per Julia OS thread, so
  concurrent calls run on multiple cores, and a PARI error raised on any
  thread is caught safely.
- **Type-stable and precompiled** — built to SciML inference standards.

## Installation

```julia
using Pkg
Pkg.add("LibPARI")
```

The native PARI library is supplied by
[`PARI_jll`](https://github.com/JuliaPackaging/Yggdrasil/tree/master/P/PARI),
a registered binary build of PARI 2.17.3 for Linux, macOS, and Windows.
Installation is fully automatic — no system PARI is required.

LibPARI requires Julia 1.10 (the long-term-support release) or later.

## Quick example

```julia
using LibPARI                     # exports exactly: pari, Gen, gp_eval, PariError

a = pari(42)
a * a + 1                         # 1765
pari(2)^100                       # 1267650600228229401496703205376
BigInt(pari(2)^64)                # 18446744073709551616
pari(3 // 4) + 1                  # 7/4

gcd(pari(12), 18)                 # 6
LibPARI.factors(60)               # [2 => 2, 3 => 1, 5 => 1]

LibPARI.PARI.nextprime(pari(1000))    # 1009 — the generated binding layer
gp_eval("sum(k = 1, 100, k^2)")       # 338350 — the GP escape hatch
```

Three levels of access: a small idiomatic Julia surface (the one promised
stable at 1.0), the ~1200 generated `LibPARI.PARI` bindings, and `gp_eval`
for everything else.

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
