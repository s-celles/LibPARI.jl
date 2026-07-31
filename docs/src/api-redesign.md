```@meta
CurrentModule = LibPARI
```

# API redesign — the road to 1.0.0

M0–M10 built a *complete* PARI/GP wrapper. The redesign described here
makes it an *honest* one: it fixes the public contracts that cannot be
changed once LibPARI reaches 1.0.

This page is the narrative front door to Part II of the roadmap
(`ROADMAP.md`, milestones M11–M21). The roadmap remains the plan of
record — deliverable lists, requirement IDs (`REQ-TYPE-*`, `REQ-PROM-*`,
…) and exit criteria live there. This page states the problem, the
proposed contracts, the consolidated breaking changes, and what is still
undecided.

!!! warning "Describes an API that is still being built"
    Every code block below is illustrative, not executable. The "after"
    snippets describe the surface planned for 0.16.0 … 1.0.0; none of it
    is available in `0.15.1`, and the items marked **M11** have since
    landed on the development branch but are not released. Nothing on this
    page is run at documentation build time.

Two commitments frame the whole redesign:

- **Correctness outranks backward compatibility while the package is
  pre-1.0.** A deprecation shim is added only where it is cheap and
  unambiguous. A shim that would preserve semantics a milestone
  classifies as *incorrect* is rejected, not written.
- **The two-layer architecture is kept.** Nothing here rewrites PARI,
  replaces the generated layer with hand-maintained wrappers, or edits
  `src/bindings.jl` by hand.

The observations in section 1 describe the API **as of `0.15.1`**, before
Part II began, and their `file:line` references are to that tag. The M11
items have since landed on the development branch and are no longer true
of that branch — `Gen` is a `PariObject`, the mixed operators are explicit,
a `t_REAL` converts through PARI's mantissa, and `hash` is total. Each
observation is pinned by a test before its milestone closes.

---

## 1. The problems with the current API

### 1.1 `Gen` claims to be a Julia `Number`, but wraps everything

`mutable struct Gen <: Number` (`src/gen.jl:46`) is a single concrete
type for *every* PARI object — the type tag is a runtime word read from
the GEN header (`src/gen.jl:167`). Matrices, strings and closures
therefore all claim to be Julia numbers:

```julia
gp_eval("[1,2;3,4]") isa Number   # true — a matrix
gp_eval("\"abc\"")   isa Number   # true — a string
```

The `Number` supertype is also load-bearing in ways that are easy to miss:
mixed arithmetic (`Gen(6) + 1`), broadcasting as a scalar, `float`,
`abs2`, `adjoint` and several constructors exist *only* because Base's
`Number` fallbacks apply.

The ordering claim is already overstated. Only `isless(::Gen, ::Gen)` is
defined (`src/numeric.jl:203`), so:

```julia
sort(Any[Gen(2), 1])   # MethodError today
```

### 1.2 Promotion is a catch-all, and it recurses

```julia
Base.promote_rule(::Type{Gen}, ::Type{<:Number}) = Gen  # src/numeric.jl:143
Base.convert(::Type{Gen}, x::Number) = Gen(x)           # src/numeric.jl:145
```

These two lines promise support for *every* Julia `Number`. The promise
cannot be kept, and failing to keep it is not graceful:

```julia
Gen(1) + π                     # StackOverflowError
promote_type(Gen, typeof(π))   # StackOverflowError
Gen(MyFloat(1))                # MethodError: no method matching
                               # Float64(::MyFloat) — raised inside Gen
```

Because `Gen <: Number`, Base also donates constructors nobody designed:

```julia
Gen('a') == 97                      # inherited, and lossy
convert(Gen, CartesianIndex(3))     # == 3
Gen(Base.TwicePrecision(1.0, 0.0))  # silently narrows
```

`convert(::Type{Gen}, x::Integer)` (`src/conversions.jl:120`) is a second,
overlapping conversion path.

### 1.3 Real conversions go through decimal text

`Float64(::Gen)` and `BigFloat(::Gen)` re-parse PARI's printed decimal
representation (`src/conversions.jl:213` and `src/conversions.jl:235`,
entry point `src/conversions.jl:228`):

```julia
Float64(Gen(1e-10))
# ArgumentError: cannot parse "1.0000000000000000364 E-10"

Float64(gp_eval("1.0*10^400"))
# ArgumentError — PARI prints a space before the exponent
```

Any magnitude outside roughly `[1e-5, 1e19)` is affected. This violates
REQ-CONV-04, and it makes `hash` *partial*: `hash(::Gen)` routes a
`T_REAL` through `Float64` (`src/numeric.jl:217`), so hashing a large real
throws. It is also lossy in the other direction — two 1024-bit reals that
differ beyond 53 bits hash equal while `gequal` may call them distinct.

Typed outward conversions are missing outright:

```julia
Float32(Gen(1))                # MethodError
Float16(Gen(1))                # MethodError
Rational{Int}(Gen(1)/Gen(2))   # MethodError
Complex{BigFloat}(Gen(1))      # MethodError
```

while `(::Type{T})(g::Gen) where {T<:Integer}` (`src/conversions.jl:181`)
is far *too* wide.

### 1.4 Precision is undocumented, mis-labelled and lossy

- `const _DEFAULT_PREC = Int(4)` (`src/numeric.jl:8`) is an unexplained
  magic number, read by `Gen^Gen` (`src/numeric.jl:80`).
- The generator's comment `DEFAULT_PREC = 4 # word precision (prototype
  code p)` (`gen/generate.jl:19`) is wrong for PARI ≥ 2.15, where the
  prototype codes `p` and `b` are **bit** counts. 142 generated bindings
  carry `prec::Integer = 4` as a result.
- `Gen(x::AbstractFloat)` calls `dbltor(Cdouble(x))` (`src/numeric.jl:111`),
  so a `BigFloat` collapses to 53 bits with no diagnostic.
- There is no `precision(::Gen)`, no way to set a working precision, and
  no documented unit anywhere — `docs/src/api.md:28` says "pass a `prec`
  keyword" without naming what `prec` counts.
- The generator emits `Class: default` records whose empty `Prototype:`
  produces 0-argument bindings for C functions declared
  `(const char *, long)`. Calling `LibPARI.PARI.sd_realprecision()` today
  reads two argument registers the binding never sets.

### 1.5 The public surface is unfrozen, and conversion has no front door

`names(LibPARI)` is `[:LibPARI]` — nothing is exported, so every use site
is fully qualified, and there is no single documented way to turn a Julia
value into a PARI one. Complex construction goes through the GP parser on
every call:

```julia
Gen(z::Complex) = Gen(real(z)) + Gen(imag(z)) * gp_eval("I")
# src/numeric.jl:179
```

This is *correct* (GP refuses `I = 5`, so `I` cannot be shadowed), but it
ties a core constructor to the evaluator and runs a parser per value.

### 1.6 Generated bindings accept only `Gen`

```julia
LibPARI.PARI.nextprime(1000)    # MethodError
```

Every `G` slot in the 1241 generated bindings is typed `::LibPARI.Gen`,
and the ~189 optional `D<G>` keywords are untyped:

```julia
function alggroupcenter(x1::LibPARI.Gen; x2 = nothing)  # src/bindings.jl:6042
```

so an unsupported keyword value fails late, with `type Int64 has no field
ptr`. Two further defects sit in the same generated code: ~86 G-taking
bindings on the scalar/void return branch never capture and restore
`avma` (`protected_call` restores it only on error), and `Gen` arguments
are rooted across the `ccall` only implicitly, through closure captures,
with no `GC.@preserve` region.

### 1.7 `gp_eval` has hidden, undocumented persistent state

`gp_eval(s::AbstractString)` (`src/evaluator.jl:27`) mutates a GP
environment that is never named in the API. What that environment *is*
under the per-thread PARI contexts (`src/concurrency.jl:93` onward,
`pari_thread_alloc`) is currently unverified: whether the variable table
is process-global or per-context, and whether a variable assigned on one
worker is visible from another, are open questions rather than documented
facts.

### 1.8 PARI's container types have no Julia interface

A `t_VEC`, `t_COL`, `t_VECSMALL` or `t_MAT` `Gen` supports no `length`,
`size`, `getindex` or `iterate`. Reaching an element means going back
through `gp_eval` or a generated binding.

### 1.9 `show` and `print` are the same call

```julia
Base.show(io::IO, g::Gen)  = print(io, _genrepr(g))  # src/conversions.jl:252
Base.print(io::IO, g::Gen) = print(io, _genrepr(g))  # src/conversions.jl:254
```

so `repr(g)` is bare PARI text, and a `Gen` wrapping a `t_STR` is
indistinguishable in `repr` from a Julia `String`. Every rendering is also
real PARI work (`GENtostr` under `protected_call`) plus a hop onto the
PARI worker, with no truncation policy for very large values.

---

## 2. The proposed contracts at 1.0

LibPARI offers **three levels of access**. They carry different stability
promises, and the difference is deliberate.

### Layer 1 — the idiomatic Julia core (**promised stable**)

This is the only layer covered by LibPARI's SemVer promise at 1.0.

**Type contract.** `abstract type PariObject end`; `Gen <: PariObject`.
`Gen` stays concrete, mutable, single-field and unparameterised — a
parametric `Gen{tag}` is rejected, because the tag is a runtime word and a
parametric return type would make every generated binding uninferable.
`Gen` is *not* a Julia `Number`, and LibPARI never claims a `Gen` is a
drop-in for one.

**Conversion contract.** One documented accepted-input set,
`LibPARI.PariConvertible`, and one conversion entry point,
`LibPARI.gen_convert(x)::Gen`. `Gen(x)`, `convert(Gen, x)`, `pari(x)` and
every mixed operator route through it; no second path exists. Anything
outside the set raises `LibPARI.ConversionError` at the boundary, naming
the offending type. Guaranteed inward: `Bool`, `Int8`…`Int128`,
`UInt8`…`UInt128`, `BigInt`, `Rational{<:Integer}`, `Float16`, `Float32`,
`Float64`, `BigFloat`, and `Complex{T}` over those. Guaranteed outward:
`BigInt`, `Bool`, `Base.BitInteger`, `Float16`/`Float32`/`Float64`,
`BigFloat`, `Rational{T}`, `Complex{T}` — each raising `InexactError`
rather than a parse failure.

**Operator contract.** `+ - * / ^ \ == < <= isless` exist as explicit
two-argument methods on `(Gen, PariConvertible)` and
`(PariConvertible, Gen)`, generated from one operator table, each calling
`gen_convert` exactly once. Promotion plays no role and `promote_rule` is
removed.

**Precision contract.** Precision is counted in **bits**, everywhere.
`Base.precision(g::Gen)::Int`, `LibPARI.isexact(g)`,
`LibPARI.default_precision()`, and a caller-side scope
`setprecision(f, Gen, bits)` / `setprecision(Gen, bits)` that nests and
restores. The scope is read in the *caller* task and captured into the
closure marshalled onto the PARI worker; it never writes PARI's global
`precreal`.

**Facade.** A deliberately small set of Base extensions where the
semantics match exactly (`gcd`, `gcdx`, `numerator`, `denominator`,
`factorial`, `powermod`, `invmod`, a sign-corrected `mod`), plus an
unexported number-theory and polynomial facade (`isprime`, `nextprime`,
`prevprime`, `factor`, `factors`, `Mod`, `lift`, `degree`, `coeff`,
`subst`, `polroots`). These exist because they add semantics — a Julia
`Int` return, a domain check, Julia's sign convention — never to rename a
generated binding.

**Containers.** `length`, `size`, `axes`, `getindex`, `iterate`,
`eltype`, `collect`, `Vector{Gen}` and `Matrix{Gen}` for `T_VEC`, `T_COL`,
`T_VECSMALL` and `T_MAT`, one-based, with `BoundsError` out of range and a
typed error naming the PARI type for a non-container `Gen`. `Gen` does
**not** subtype `AbstractArray`: a runtime-tagged value cannot honestly
promise a static array interface. Element access clones — documented and
tested.

**Display.** `show(io, g)` is compact and self-identifying;
`show(io, MIME"text/plain"(), g)` keeps PARI notation for the REPL;
`print(io, g)` stays PARI's own text, so string interpolation is
unaffected.

**Exported surface.** Exactly four names — `Gen`, `pari`, `gp_eval`,
`PariError` — locked by a test that fails CI if `names(LibPARI)` changes.
Supported-but-unexported names (`PARI`, `PariType`, `PariErr`, `gentype`,
`is_initialized`, `library_state`, `stack_size`, `serve_mcp`) are marked
`public` behind a `VERSION >= v"1.11"` guard.

**Unchanged invariants.** Every result is cloned off PARI's transient
stack and `avma` is restored; PARI errors stay catchable `PariError`s;
libpari calls stay marshalled onto the per-thread workers; the public
surface stays `@inferred`-clean; no exported or public signature mentions
`Ptr`.

### Layer 2 — the generated `LibPARI.PARI` bindings (**shape stable**)

One method per eligible PARI function, keeping PARI's own name and
docstring. Each binding returns a `Gen` (or the scalar Julia type its
prototype calls for) and routes through the same safe, leak-free,
thread-safe boundary as the core.

The redesign widens this layer's inputs: a `G` slot accepts
`PariConvertible`, an optional `D<G>` keyword becomes
`Union{Nothing,PariConvertible} = nothing`, and a `p`/`b` precision
keyword defaults to `LibPARI.default_precision()` in bits. Exactly one
conversion happens per argument; an existing `Gen` is never copied; every
binding still has exactly one method. Parameters stay named `x1, x2, …`
because `pari.desc` carries no argument-name field — a limitation
documented, not papered over with invented names.

**Stability promise:** the *shape* and the calling conventions of this
layer are stable at 1.0. Individual signatures are not: they are derived
from PARI's `pari.desc`, so a PARI upgrade may add, remove or retype
bindings without a LibPARI major bump. Code that must be immune to that
should go through Layer 1.

### Layer 3 — `gp_eval` and GP sessions (**escape hatch**)

`gp_eval(str)` keeps its signature and becomes documented as *the default
session*; `GPSession` and `gp_eval(session, str)` make the persistent
state explicit, with `reset!(session)` clearing an explicitly documented
set. If truly independent GP environments turn out not to be reachable
through libpari as embedded here, LibPARI will say so and ship the safest
honest abstraction instead of pretending to isolation it cannot provide.

`gp_eval` stays documented as the escape hatch — in particular for the
PARI functions taking GP closure arguments (`E`/`I`/`V`/`C`), which have
no other route — and never as the primary API. It follows PARI's
process-global `precreal`, **not** the `setprecision(Gen, …)` scope, and
the documentation states this explicitly.

---

## 3. Breaking changes

Consolidated across M11–M18. "Shim" records whether a deprecation path
ships.

### 3.1 `Gen` is no longer a Julia `Number` (M11)

*No shim is possible — a Julia type's supertype is fixed at definition.*
Code dispatching on `::Number` — LinearAlgebra methods bounded by
`T<:Number`, generic numeric packages, `x isa Number` guards — stops
accepting `Gen`.

```julia
# before
Gen(2) isa Number                 # true
gp_eval("[1,2;3,4]") isa Number   # true  (a matrix!)

# after
Gen(2) isa Number                 # false
Gen(2) isa LibPARI.PariObject     # true
gp_eval("[1,2;3,4]") isa Number   # false
```

### 3.2 Mixed arithmetic and comparison become explicit methods (M11, M12)

Behaviour is preserved for the documented type set; the mechanism changes
from promotion to explicit two-argument methods.

```julia
# before — resolved by Base's op(::Number, ::Number) + promote_rule
Gen(6) + 1
Gen(2) == 2
Dict(Gen(7) => "s")[7]

# after — resolved by +(::Gen, ::PariConvertible) etc.; same results
Gen(6) + 1
Gen(2) == 2
Dict(Gen(7) => "s")[7]
```

Only the *outcome for unsupported types* changes:

```julia
# before
Gen(1) + π                    # StackOverflowError
promote_type(Gen, typeof(π))  # StackOverflowError

# after
Gen(1) + π                    # LibPARI.ConversionError: Irrational{:π}
                              # is not PariConvertible (see gen_convert)
```

### 3.3 `promote_rule` and the `convert` catch-all are removed (M12)

*No shim: restoring the catch-all restores the failures it caused.*

```julia
# before
Base.promote_rule(::Type{Gen}, ::Type{<:Number}) = Gen
Base.convert(::Type{Gen}, x::Number) = Gen(x)
convert(Gen, 2.5) isa Gen     # via the catch-all

# after — no promote_rule at all
convert(Gen, 2.5) isa Gen     # via convert(::Type{Gen}, ::PariConvertible)
convert(Gen, MyFloat(1))      # LibPARI.ConversionError
```

### 3.4 Constructors inherited from `Number` are withdrawn (M12)

*No shim — blessing an unintended, partly lossy API.*

```julia
# before
Gen('a') == 97                       # true
convert(Gen, CartesianIndex(3)) == 3 # true
Gen(Base.TwicePrecision(1.0, 0.0))   # silently narrows

# after
Gen('a')                             # LibPARI.ConversionError
convert(Gen, CartesianIndex(3))      # LibPARI.ConversionError
Gen(Base.TwicePrecision(1.0, 0.0))   # LibPARI.ConversionError
```

### 3.5 `T(g::Gen)` narrows to `BitInteger`/`BigInt`/`Bool` (M12)

*Deprecation-warning shim shipped* — an unknown `T<:Integer` is routed
through `T(BigInt(g))` behind a warning; semantics are unchanged for
well-behaved `T`.

```julia
# before
MyInt(Gen(5))   # silently resolved by the T<:Integer catch-all

# after
MyInt(Gen(5))   # same value, with a deprecation warning
Int(Gen(5))     # unchanged
```

### 3.6 Real conversions stop parsing decimal text (M11, M12, M13)

*No shim: the old path is a defect.*

```julia
# before
Float64(Gen(1e-10))              # ArgumentError: cannot parse
                                 # "1.0000000000000000364 E-10"
Float64(gp_eval("1.0*10^400"))   # ArgumentError
hash(gp_eval("1.0*10^400"))      # throws, via Float64

# after
Float64(Gen(1e-10)) === 1.0e-10  # true
Float64(gp_eval("1.0*10^400"))   # a finite Float64, or Inf
hash(gp_eval("1.0*10^400"))      # an ordinary UInt
```

### 3.7 `BigFloat` no longer round-trips through 53 bits (M13)

*No shim — a shim would preserve the silent crush.* Opt in to doubles
explicitly with `pari(Float64(x))`.

```julia
# before
x = BigFloat(π; precision = 512)
BigFloat(Gen(x)) == x            # false — Gen(x) held 53 bits

# after
BigFloat(Gen(x); precision = 512) == x   # true
precision(Gen(x)) >= precision(x)        # true
```

### 3.8 Precision defaults change unit and value (M13)

*No shim: results become more accurate and slightly larger. Callers
passing `prec=` explicitly are unaffected — but the unit they pass is now
documented as bits.*

```julia
# before — 142 bindings, unexplained
PARI.mppi()               # emitted as prec::Integer = 4 (words? bits?)

# after
PARI.mppi()               # prec::Integer = LibPARI.default_precision()
LibPARI.default_precision()          # bits, with documented provenance
setprecision(Gen, 1024) do
    PARI.mppi()                      # 1024-bit π
end
```

### 3.9 Zero-argument `Class: default` bindings are replaced by stubs (M13)

*Throwing shim shipped* — the same-named method raises an `ArgumentError`
naming the replacement. Keeping the old call is undefined behaviour: the
C function reads two argument registers the binding never set.

```julia
# before
PARI.sd_realprecision()   # undefined behaviour

# after
PARI.sd_realprecision()   # ArgumentError: use
                          # LibPARI.set_global_precision!(bits)
LibPARI.set_global_precision!(256)
```

### 3.10 `Inf`/`NaN` acquire a stated policy (M12)

Both old and new behaviours are catchable; only the exception changes.

```julia
# before
Gen(Inf)   # PariError(e_OVERFLOW), from dbltor

# after
Gen(Inf)   # the REQ-PROM-10 policy — working assumption: InexactError
```

### 3.11 LibPARI exports four names (M14)

*No shim can exist for a new export.* A script that also uses a package
exporting any of `Gen`, `pari`, `gp_eval` or `PariError` gets an
ambiguous-binding error at first use. Mitigation: the list stays at four,
and a lock test fails CI if it grows.

```julia
# before
names(LibPARI)                 # [:LibPARI]
using LibPARI
LibPARI.Gen(2)                 # qualification required

# after
names(LibPARI)                 # [:Gen, :LibPARI, :PariError, :gp_eval, :pari]
using LibPARI
pari(2)                        # unqualified
```

### 3.12 `Rational(g)` fails earlier; complex construction skips GP (M14)

Same exception type, different message; values identical.

```julia
# before
Rational(gp_eval("x/2"))   # InexactError from inside BigInt(PARI.numerator(g))
Gen(3 + 4im)               # runs the GP parser, via gp_eval("I")

# after
Rational(gp_eval("x/2"))   # InexactError from numerator(::Gen), before
                           # any PARI call
pari(3 + 4im)              # direct PARI construction; gentype === T_COMPLEX
```

### 3.13 Generated-binding signatures widen (M15)

Purely widening — every existing call still compiles. Only code relying
on a `MethodError` breaks.

```julia
# before
PARI.nextprime(x1::LibPARI.Gen)
PARI.nextprime(1000)                  # MethodError
PARI.alggroupcenter(x1::Gen; x2 = nothing)   # untyped keyword

# after
PARI.nextprime(x1::LibPARI.PariConvertible)
PARI.nextprime(1000)                  # works
PARI.alggroupcenter(x1; x2::Union{Nothing,PariConvertible} = nothing)
```

The same milestone adds `avma` capture/restore to the ~86 scalar- and
void-returning G-taking bindings and an explicit `GC.@preserve` region
around every `_trap_call`. Neither changes an API; the first stops
leaking every converted temporary, the second closes a rare
use-after-free window.

### 3.14 `gp_eval`'s contract is named (M16)

Source-compatible: the break is in the documented contract, not the
signature.

```julia
# before — one hidden global GP environment
gp_eval("v = 42")
gp_eval("v")

# after — the same call, now documented as the default session
gp_eval("v = 42")
gp_eval("v")

s = LibPARI.GPSession()
gp_eval(s, "v = 42")
LibPARI.reset!(s)
```

### 3.15 `repr(g)` changes (M18)

Any test or doctest comparing `repr` or `string` output changes.
`print`/`string` keep PARI's text, so interpolation is unaffected.

```julia
# before
repr(Gen(42))          # "42" — indistinguishable from a String's content
repr(gp_eval("\"a\""))  # "a"

# after
repr(Gen(42))          # a compact, self-identifying LibPARI form
print(Gen(42))         # 42  — unchanged
"$(Gen(42))"           # "42" — unchanged
```

M17 (structured objects) adds methods to a type that currently has none of
them, and is expected to break nothing.

---

## 4. Migration examples

Runnable before/after pairs for the changes a user actually hits. (A
complete per-change guide ships as the migration page in M21.)

**Guarding on the type.** Replace `Number` guards with `PariObject`, or
better, with `gentype`:

```julia
# before
f(x) = x isa Number ? x + 1 : error("not numeric")

# after
f(x::LibPARI.Gen)  = x + 1
f(x::Number)       = x + 1
# or, when the PARI type matters:
isnum(g::LibPARI.Gen) =
    LibPARI.gentype(g) in (LibPARI.PariType.T_INT,
                           LibPARI.PariType.T_REAL,
                           LibPARI.PariType.T_FRAC)
```

**Building PARI values.** Prefer the new front door; it is one name and
one documented input set:

```julia
# before
using LibPARI
g = LibPARI.Gen(2)^LibPARI.Gen(100)

# after
using LibPARI
g = pari(2)^pari(100)
g = pari(2)^100        # mixed arithmetic, explicit method
```

**Feeding a generated binding.** Wrapping is no longer required:

```julia
# before
using LibPARI
LibPARI.PARI.nextprime(LibPARI.Gen(1000))
LibPARI.PARI.gmodulo(LibPARI.Gen(5), LibPARI.Gen(7))

# after
using LibPARI
LibPARI.PARI.nextprime(1000)
LibPARI.PARI.gmodulo(5, 7)
```

**High-precision reals.** The lossy round-trip becomes exact, and the
working precision is set with a scope:

```julia
# before
x = BigFloat(π; precision = 512)
y = LibPARI.Gen(x)                       # crushed to 53 bits
BigFloat(y)                              # parse of PARI's decimal text

# after
x = BigFloat(π; precision = 512)
y = pari(x)                              # exact to 512 bits
BigFloat(y; precision = 512) == x        # true

setprecision(Gen, 1024) do
    LibPARI.PARI.mppi()                  # 1024-bit π
end
```

Note that `gp_eval` and `show` follow PARI's process-global precision, not
the scope:

```julia
setprecision(Gen, 1024) do
    gp_eval("Pi")            # still the global-precision value
end
LibPARI.set_global_precision!(1024)   # global, thread-visible
```

**Converting out.** Text parsing is gone, and the typed constructors
exist:

```julia
# before
Float64(LibPARI.Gen(1e-10))          # ArgumentError
Float32(LibPARI.Gen(1))              # MethodError

# after
Float64(pari(1e-10)) === 1.0e-10     # true
Float32(pari(1))                     # 1.0f0
Rational{Int}(pari(1)/pari(2))       # 1//2
```

**Unsupported inputs.** One named error, at the boundary:

```julia
# before
LibPARI.Gen(1) + π       # StackOverflowError — not catchable in practice

# after
try
    pari(1) + π
catch e
    e isa LibPARI.ConversionError    # true
end
```

**Reading a container.** No round trip through `gp_eval`:

```julia
# before
m = gp_eval("[1,2;3,4]")
gp_eval("[1,2;3,4][1,2]")            # back through the parser

# after
m = gp_eval("[1,2;3,4]")
size(m)                              # (2, 2)
m[1, 2]                              # a fully owned Gen (element access clones)
collect(gp_eval("[1,2,3]"))          # Vector{Gen}
```

**Display.** If you compared `repr` output, compare `print`/`string`
instead:

```julia
# before
@test repr(g) == "42"

# after
@test string(g) == "42"      # print/string keep PARI's text
```

---

## 5. Implementation phases

```
M10 (0.11.0, done)
  └─> M11 type contract ── M12 conversion & promotion
                                   └─> M13 precision ──┬─> M14 pari(x) + facade
                                                       └─> M15 binding args
        M11 ─────────────> M16 GP sessions
        M11 ─────────────> M17 structured objects
        M11 ─────────────> M18 display contract
  M11+M13+M14+M17 ──────> M19 Symbolics bridge ─> M20 Giac bridge
  all ───────────────────> M21 documentation, migration, 1.0.0
```

| ID  | Milestone                                    | Target | Depends on |
|-----|----------------------------------------------|--------|------------|
| M11 | Honest type contract for `Gen`               | 0.16.0 | M10        |
| M12 | Conversion & promotion contracts             | 0.17.0 | M11        |
| M13 | Precision-safe reals, bit-based precision API| 0.18.0 | M11, M12   |
| M14 | `pari(x)`, public surface, small facade      | 0.19.0 | M11–M13    |
| M15 | Generated-binding argument ergonomics        | 0.20.0 | M12, M13   |
| M16 | Explicit GP evaluation sessions              | 0.21.0 | M11        |
| M17 | Structured PARI objects                      | 0.22.0 | M11        |
| M18 | Display contract                             | 0.23.0 | M11        |
| M19 | Symbolics.jl bridge (optional extension)      | 0.24.0 | M11, M13, M14, M17 |
| M20 | Giac.jl bridge (optional extension)           | 0.25.0 | M19        |
| M21 | Documentation, migration & the 1.0.0 release | 1.0.0  | M11–M20    |

`M16`, `M17` and `M18` are independent of each other and of `M12`–`M15`,
and may be reordered freely once `M11` has landed.

!!! warning "M13 and M15 must not be in flight together"
    Both regenerate `src/bindings.jl` — M13 replaces the precision
    constants at every `p`/`b` site and removes the zero-argument
    `Class: default` records; M15 retypes the `G` slots and the `D<G>`
    keywords, and rewrites the `avma`/`GC.@preserve` scaffolding. Two
    concurrent regenerations cannot both satisfy the byte-identical
    reproducibility gate (NFR-04) or the "every generated-file change
    traces to a `gen/generate.jl` diff in the same commit" rule. Land one,
    regenerate, verify `git diff --exit-code src/bindings.jl` is clean,
    then start the other.

Two further sequencing rules apply throughout:

- **Tests before code.** Each milestone's first deliverable is the failing
  `@testitem` that pins the observation it fixes. The observations quoted
  on this page come from an analysis pass at `0.15.1` that was not
  adversarially re-verified; the test is what turns each into a fact.
- **M15 depends on M12 and M13, not on M14.** If `pari(x)` slips, the
  generated layer can still widen — it needs the accepted-input set and
  the float policy, not the facade.

M14 is also the one milestone in the sequence that must leave
`src/bindings.jl` byte-identical to its pre-milestone content.

---

## 6. Unresolved design questions

Each question carries the current working assumption. None is settled
until its milestone closes.

### Type contract (M11)

- **`Gen(::Irrational)`** — refuse, or convert at a default precision?
  *Working assumption: refuse*, with an error pointing at `PARI.mppi` and
  friends. There is no lossless conversion, and PARI needs an explicit
  precision.
- **`PariNumber <: Number`**, a second wrapper for the numeric PARI tags —
  *discuss, do not schedule.* All 1241 generated bindings return a plain
  `Gen`, so a second type adds a conversion at every boundary and doubles
  the operator matrix. Implement only behind a tested consumer.
- **Which LinearAlgebra paths are bounded by `T<:Number`?** `[Gen(1)
  Gen(2); Gen(3) Gen(4)] * I` works today. *Working assumption: unknown* —
  an explicit sweep must run before any claim is made in the docs.

### Conversion & promotion (M12)

- **Is `gen_convert` a 1.0 public commitment or an internal seam?**
  *Working assumption: public.* It is the extension point by which a
  downstream package adds its own numeric type without pirating
  `Base.convert`. If public, its name, signature and error contract freeze
  in M12.
- **`Inf`/`NaN`** — reject with `InexactError`, or map `±Inf` onto PARI's
  `t_INFINITY`? `isfinite`/`isinf` already key on `PariType.T_INFINITY`
  (`src/numeric.jl:230`), which makes the mapping tempting, but
  `t_INFINITY` does not participate in general PARI arithmetic. *Working
  assumption: reject.*
- **`Gen(::Float16)` / `Gen(::Float32)`** — a `t_REAL` of source-matched
  precision, or today's widening to PARI's default? (`Gen(Float16(1.5))`
  currently prints 19 significant digits.) *Working assumption:
  undecided; whichever is chosen is documented and tested.*
- **A closed union excludes working third-party types.** `Rational{Int8}`,
  `UInt128` and `typemax(UInt)` all work today through the generic
  word/string path. *Working assumption: the closed union is the
  guaranteed set, `gen_convert` is the documented extension point.*
- **`Complex` is value-preserving but not tag-preserving** — PARI
  normalises a zero imaginary part, so `gentype(Gen(Complex(1,0)))` is
  `T_INT`. *Working assumption: guarantee `Complex(Gen(z)) == z` in value
  only, never the tag.*

### Precision (M13)

- **`precision(g)` on an exact `Gen`** — PARI's `bitprecision` answers
  `+oo`. Throw, return `typemax(Int)`, or 0? *Working assumption: throw
  `ArgumentError`*, paired with `LibPARI.isexact` — it keeps the `::Int`
  return stable, at the cost of generic code that calls `precision`
  blindly.
- **Scope mechanism.** Julia 1.10 LTS has no `Base.ScopedValues`.
  Task-local storage nests correctly but is *not* inherited by `@spawn`ed
  children. *Working assumption: ship task-local now*, revisit at a 1.11
  floor rather than take a `ScopedValues.jl` compat dependency.
- **Is `default_precision()` 128 bits (GP parity, `realbitprecision`) or
  256 (Julia parity with `precision(BigFloat)`)?** The two give different
  answers for the same expression. *Working assumption: undecided —
  decided once, in M13, and then frozen.*
- **Series precision (prototype code `P`)** — its own scope, a separate
  setter, or a plain keyword default? It is a term count, not bits.
  *Working assumption: a plain keyword default, kept separate from the
  bit-precision machinery.*
- **Where does the `hash`/`T_REAL` fix land?** Two 1024-bit reals
  differing beyond 53 bits hash equal today. *Working assumption: fix in
  M11 (REQ-TYPE-09)*, because a precision API makes it reachable in
  practice.

### Public surface (M14)

- **`pari(::AbstractString)` is deliberately left undefined.** GP-parsing
  a string would quietly promote `gp_eval` to the primary API; building a
  `t_STR` is defensible. *Working assumption: define neither at 1.0* —
  adding either later is non-breaking.
- **Scope of `LibPARIPrimesExt`.** `Primes.isprime(::Gen)` is a clean
  match, but `Primes.nextprime(n, i)` and PARI's `nextprime` ("smallest
  pseudoprime ≥ x") differ in guarantee and arity. *Working assumption: an
  optional weakdep extension, not a hard dependency*, with a CI job that
  loads Primes.
- **Which factorization shape leads the docs** — PARI's 2-column `t_MAT`,
  a `Vector{Pair{Gen,Gen}}`, or Primes.jl's `Factorization`? *Working
  assumption: ship both `factor` (the `t_MAT`) and `factors` (the pairs),
  and lead with the pairs.*
- **Raise the compat floor above 1.10 so `public` can be written
  literally?** That drops the current Julia LTS. *Working assumption: no —
  keep 1.10 and guard `public` on `VERSION >= v"1.11"`.*
- **`LibPARI.Mod` mirrors GP's spelling but reads oddly as a Julia
  function.** *Working assumption: keep the GP spelling*, unexported.

### Generated-binding arguments (M15)

- **Do any scalar- or void-returning G-taking bindings retain their GEN
  argument in PARI global state?** This is the milestone's main risk: a
  retained pointer into the transient stack would dangle once `avma` is
  restored. *Working assumption: some may* — the audit produces a
  generator deny-list keeping `::LibPARI.Gen`, with the reason emitted
  into the generated header.
- **Should `_argptr(::AbstractFloat)` honour the binding's `prec`
  keyword** rather than a fixed precision? *Working assumption: it follows
  whatever M13 sets as policy.*
- **`AbstractVector`/`AbstractMatrix` in a `G` slot** — *deferred past
  1.0.* `t_VEC` vs `t_COL` is genuinely ambiguous for a Julia `Vector` and
  should stay an explicit user choice (see M17).
- **`AbstractString` in a `G` slot** — *rejected.* It collides with the
  `s`/`r` prototype codes and makes `f("x")` ambiguous between a string
  value and a variable name.
- **Should codes `L`/`U` (today `::Integer`) also accept a `Gen`?**
  Symmetry says yes; a lossy `Gen`→`long` narrowing says no. *Working
  assumption: deferred past 1.0.0.*

### GP sessions (M16)

The analysis pass for this milestone did not complete, so its central
facts are unverified and REQ-GPS-01 is deliberately an investigation.

- **Are truly independent GP environments reachable at all through libpari
  as embedded here?** If not, is a variable-namespacing session an honest
  abstraction or a misleading one? *Working assumption: unknown —
  investigate first, and if isolation is infeasible, document the
  non-isolation and assert it in a test rather than claim isolation.*
- **Does a session belong to a task, a thread, or the process?** *Working
  assumption: determined by REQ-GPS-01's finding, then documented.*
- **Should `reset!` also reset PARI's global precision and variable
  priorities, or only user variables?** *Working assumption: only what the
  session demonstrably owns, with the cleared set written down.*

### Structured objects (M17)

Same caveat: the ownership and layout deliverables must be verified
against PARI's headers before any accessor is written.

- **Is `T_LIST` stable enough to expose,** given it is mutable in PARI?
  *Working assumption: excluded from the first pass*, with the reason
  recorded.
- **Should `getindex` on a `T_MAT` return a column (PARI's own semantics)
  or an element?** *Working assumption: the element*, with `x[:, j]` for
  the column — Julia convention wins, and the column-major mapping is
  spelled out and tested rather than assumed.
- **Does `iterate` on a large vector need a chunked strategy** to avoid
  one clone per element? *Working assumption: start unchunked*, and let
  the NFR-02/NFR-03-style allocation tests decide.

### Display (M18)

- **Should the compact form show the PARI type tag** (e.g.
  `Gen(t_MAT, …)`) or a truncated value? *Working assumption: the tag* —
  it is what makes a `t_STR` unmistakable.
- **Is a truncation threshold needed, and does it belong to `show` only
  or to `text/plain` as well?** Every rendering is real PARI work plus a
  worker hop. *Working assumption: a documented threshold on `show`, none
  on `text/plain`*, which the user asked for explicitly.

### Release (M21)

- **Does 1.0.0 freeze the generated layer's signatures too, or only the
  hand-written core?** The generated layer changes whenever PARI's
  `pari.desc` changes. *Working assumption: promise stability on the
  hand-written surface plus the* shape *of the generated one* — which is
  the three-layer promise stated in section 2.
