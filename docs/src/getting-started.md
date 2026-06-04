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

Build a [`Gen`](@ref) — LibPARI's wrapper for a PARI object — from a Julia
number, and compute with it as you would any Julia `Number`:

```@repl tour
using LibPARI
a = LibPARI.Gen(42)
a * a + LibPARI.Gen(1)
LibPARI.Gen(2)^100
```

`Gen` accepts integers of any magnitude, floats, and rationals, and mixed
arithmetic promotes the Julia operand automatically:

```@repl tour
LibPARI.Gen(3 // 4) + 1
LibPARI.Gen(2)^200 == big(2)^200
```

Convert an integer-valued `Gen` back to a Julia integer:

```@repl tour
BigInt(LibPARI.Gen(2)^64)
Int(LibPARI.Gen(255))
```

Call one of the generated bindings from the `LibPARI.PARI` submodule — here,
the next prime after 1000:

```@repl tour
LibPARI.PARI.nextprime(LibPARI.Gen(1000))
```

Or reach any PARI/GP capability through the GP expression evaluator,
[`gp_eval`](@ref):

```@repl tour
LibPARI.gp_eval("sum(k = 1, 100, k^2)")
```

## Handling errors

A failing PARI call raises a catchable [`PariError`](@ref) carrying PARI's
own message and an error category:

```@repl tour
try
    LibPARI.gp_eval("1/0")
catch e
    e isa LibPARI.PariError
end
```

## Next steps

The [API reference](@ref) documents the hand-written public surface in full
and explains how the generated `LibPARI.PARI` bindings are organized.
