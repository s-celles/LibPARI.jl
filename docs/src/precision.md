```@meta
CurrentModule = LibPARI
```

# Precision

PARI computes with reals to a **working precision**. LibPARI states that
precision in **bits** everywhere on its own surface, and converts only at
the `ccall` boundary.

## The units

PARI's own units are easy to misread, so they are pinned here against the
headers shipped with `PARI_jll` (PARI 2.17):

- A prototype `p` or `b` argument is a **bit count**. `pariinl.h` defines
  `prec2nbits(long x) { return x; }` — the value is already in bits.
- PARI allocates a `t_REAL` to a whole number of machine words, so a
  request is rounded **up**: `nbits2prec(x) = ceil(x / 64) * 64` on a
  64-bit platform.

[`LibPARI.nbits2prec`](@ref) exposes that rounding:

| requested bits | allocated bits |
|----------------|----------------|
| 1 | 64 |
| 4 | 64 |
| 64 | 64 |
| 65 | 128 |
| 128 | 128 |
| 200 | 256 |

!!! note "A historical mistake, now fixed"
    Before version 0.18.0 every generated binding defaulted to `prec = 4`,
    with a comment describing it as "word precision". It was in fact a
    request for **4 bits**, which PARI rounded up to its 64-bit minimum —
    not a deliberate choice. Bindings now default to LibPARI's working
    precision.

## The default

[`LibPARI.default_precision`](@ref) is **128 bits**, which is GP's own
`realbitprecision` default (about 38 decimal digits — the width PARI prints
by default). Matching GP means the same expression gives the same answer in
`gp` and in LibPARI.

Tracking Julia's `precision(BigFloat)` (256 bits) was the alternative. It
was rejected: it would make LibPARI disagree with the library it wraps.

## Setting it

```julia
setprecision(LibPARI.Gen, 256) do
    LibPARI.PARI.mppi()        # computed to 256 bits
end
```

Scopes nest and unwind, including when the body throws:

```julia
setprecision(LibPARI.Gen, 256) do
    setprecision(LibPARI.Gen, 512) do
        precision(LibPARI.Gen)   # 512
    end
    precision(LibPARI.Gen)       # back to 256
end
```

`precision(LibPARI.Gen)` reads the value in force;
`precision(g::LibPARI.Gen)` reads the accuracy of a real value, and raises
`ArgumentError` for an exact one — test with [`LibPARI.isexact`](@ref).

## What the scope reaches, and what it does not

| | follows `setprecision(Gen, …)` |
|---|---|
| generated bindings taking `p` or `b` | **yes** — it is their keyword default |
| `Gen^Gen` and the hand-written numeric API | **yes** |
| conversions into and out of a `Gen` | value-preserving, so unaffected |
| [`gp_eval`](@ref) | **no** — see below |
| a task spawned inside the scope | **no** — see below |

**`gp_eval` follows PARI's process-global `realprecision`,** not the
scope. The GP interpreter reads its own global default, which is shared by
every thread in the process; LibPARI does not write it behind your back.
Set it from GP itself if you need to:

```julia
LibPARI.gp_eval("default(realbitprecision, 512)")
```

**The scope is task-local.** It nests and unwinds correctly, and it does
cross the hop onto LibPARI's PARI worker tasks — the precision is read in
the *calling* task and carried into the closure that gets marshalled. But a
task you spawn inside the scope does **not** inherit it:

```julia
setprecision(LibPARI.Gen, 512) do
    fetch(Threads.@spawn precision(LibPARI.Gen))   # the default, not 512
end
```

This is a limitation of the Julia 1.10 LTS floor, which has no
`Base.ScopedValues`; a `ScopedValue` would be inherited. Set the precision
inside the spawned task, or revisit when the compat floor moves to 1.11.

## Precision and conversion

`Gen(x)` preserves `x` exactly, whatever its width:

```julia
x = big"1.00000000000000000000000000000001"
BigFloat(LibPARI.Gen(x)) == x        # true
```

A wide float is decomposed into its exact integer significand and binary
exponent and rebuilt at a precision that holds every bit — nothing passes
through `Cdouble`. An `IEEEFloat` takes PARI's `dbltor`, which is exact.

Coming back, `BigFloat(g)` is exact by default: the result carries PARI's
own mantissa, at whatever precision that takes, which may exceed the
ambient `precision(BigFloat)`. Pass the keyword to round once to a chosen
width instead:

```julia
BigFloat(g; precision = 256)
```

`Inf`, `-Inf` and `NaN` raise `InexactError`: PARI's `t_INFINITY` exists
but does not take part in general arithmetic, so mapping onto it would
produce values that fail later, far from the conversion.

## Series precision

A series precision (prototype code `P`) is a **number of terms**, not a bit
count. It has its own default and is deliberately outside the precision
scope.

```@docs
LibPARI.nbits2prec
LibPARI.default_precision
LibPARI.isexact
```
