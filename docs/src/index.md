```@meta
CurrentModule = LibPARI
```

# LibPARI.jl

A Julia wrapper for the [PARI/GP](https://pari.math.u-bordeaux.fr/)
number-theory library.

LibPARI embeds the PARI/GP C library in a Julia process and exposes it to
Julia code in two complementary ways:

- **Generated bindings** — nearly 1200 PARI functions, generated directly from
  PARI's own machine-readable function database (`pari.desc`), reachable
  through the `LibPARI.PARI` submodule. See [API reference](@ref).
- **A hand-written core** — a [`Gen`](@ref) value type wrapping
  every PARI object, idiomatic numeric operators, type conversions to and
  from Julia numbers, a GP expression evaluator, and safe library lifecycle
  and error handling.

## What LibPARI gives you

- **`Gen` is a [`PariObject`](@ref LibPARI.PariObject), not a Julia
  `Number`.** One wrapper type covers every PARI object — matrices, strings
  and closures included — so LibPARI declares the arithmetic explicitly
  rather than claiming a `Number` supertype: build a `Gen` from Julia
  integers, floats and rationals and use `+`, `-`, `*`, `/`, `^`, and `==`
  directly, with a Julia number on either side.
- **Exact arithmetic of arbitrary size.** PARI's bignum integers, rationals,
  and reals, with conversions back to Julia's `BigInt` and fixed-width
  integer types.
- **The whole of GP, one string away.** [`gp_eval`](@ref)
  evaluates any GP-language expression — the escape hatch for functions the
  generated bindings do not cover.
- **A safe C boundary.** Every PARI error becomes a catchable
  [`PariError`](@ref); a PARI `longjmp` never unwinds past
  Julia. PARI's transient stack is kept leak-free, and each `Gen` frees its
  own storage.
- **Parallel and thread-safe.** Each Julia OS thread gets its own PARI
  context, so concurrent calls into the PARI library run in parallel on
  multiple cores — and a PARI error raised on any thread, even
  simultaneously from many, is caught safely as a [`PariError`](@ref).
- **Type-stable and precompiled** — built to SciML inference standards, with
  a precompilation workload for a fast first call.

## Status

LibPARI is at version `0.18.0`. The hand-written core (lifecycle, `Gen`,
error handling, conversions, the numeric API, precision, containers,
display, the `pari` entry point and the GP evaluator) and the generated
binding layer are complete; the library is platform-correct, parallel, and
thread-safe.

`0.18.0` narrows the optional Symbolics.jl bridge to Symbolics 7, and
`0.17.0` before it carried breaking changes to the display contract and the
generated bindings — see
the [changelog](https://github.com/s-celles/LibPARI.jl/blob/main/CHANGELOG.md)
before upgrading. The API is still being reshaped and the package stays in
`0.x`; `ROADMAP.md`
Part II tracks what remains.

Both `LibPARI` and `PARI_jll` are registered in the Julia General registry
— a plain `Pkg.add("LibPARI")` installs everything on Linux, macOS, and
Windows. See [Getting started](@ref) for the install command.

## Contents

```@contents
Pages = ["getting-started.md", "api.md"]
Depth = 2
```
