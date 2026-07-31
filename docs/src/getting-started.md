```@meta
CurrentModule = LibPARI
```

# Getting started

## Installation

`LibPARI` is installable from the Julia General registry:

```julia
using Pkg
Pkg.add("LibPARI")
```

The native PARI library is supplied by
[`PARI_jll`](https://github.com/JuliaPackaging/Yggdrasil/tree/master/P/PARI),
a registered binary build of PARI 2.17.3 for Linux, macOS, and Windows.
`Pkg.add` resolves and installs it automatically — no system PARI is
required.

LibPARI requires Julia 1.10 (the long-term-support release) or later.

## Loading the package

```julia
using LibPARI
```

Loading the module initializes the embedded PARI library exactly once for the
process and registers a clean shutdown at process exit. You can observe the
lifecycle:

```julia
LibPARI.is_initialized()   # true
LibPARI.library_state()    # LibraryState.INITIALIZED
LibPARI.stack_size()       # PARI main-stack size, in bytes
```

The PARI main-stack size defaults to 8 MiB. To change it, set the
`LIBPARI_STACK_SIZE` environment variable (a byte count) **before** the
package is loaded.

## A first tour

`using LibPARI` brings in exactly four names: [`pari`](@ref), [`Gen`](@ref),
[`gp_eval`](@ref) and [`PariError`](@ref). Everything else stays qualified.

[`pari`](@ref) converts a Julia value into a PARI one — a [`Gen`](@ref) —
and the usual Julia operators work on it:

```@repl tour
using LibPARI
a = pari(42)
a * a + 1
pari(2)^100
```

`pari` accepts integers of any magnitude, rationals, floats — including
`BigFloat`, exactly — and complex numbers. Mixed arithmetic takes a Julia
operand on either side:

```@repl tour
pari(3 // 4) + 1
pari(2)^200 == big(2)^200
pari(big"1.234567890123456789012345678901")
```

Convert back to a Julia value:

```@repl tour
BigInt(pari(2)^64)
Int(pari(255))
```

## The three levels of access

**1. Idiomatic Julia.** A small hand-written surface: the operators above,
the conversions, and a short list of Base functions where PARI's operation
*is* Julia's.

```@repl tour
gcd(pari(12), 18)
factorial(pari(20))
LibPARI.isprime(1009)
LibPARI.factors(60)
```

This layer is the one promised stable at 1.0.

**2. The generated bindings.** Nearly 1200 PARI functions under
`LibPARI.PARI`, one per eligible entry in PARI's own function database, each
carrying PARI's help text as its docstring:

```@repl tour
LibPARI.PARI.nextprime(pari(1000))
LibPARI.PARI.eulerphi(pari(100))
```

Their names and calling conventions follow `pari.desc`, so they track PARI
rather than Julia taste.

**3. GP expressions.** [`gp_eval`](@ref) reaches anything the other two do
not — in particular the functions taking a GP closure, which are not
generated:

```@repl tour
gp_eval("sum(k = 1, 100, k^2)")
```

It is an escape hatch, not the recommended way to use LibPARI.

## Handling errors

A failing PARI call raises a catchable [`PariError`](@ref) carrying PARI's
own message and an error category:

```@repl tour
try
    gp_eval("1/0")
catch e
    e isa PariError
end
```

## Next steps

The [API reference](@ref) documents the hand-written public surface in full
and explains how the generated `LibPARI.PARI` bindings are organized.
