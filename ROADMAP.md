# LibPARI — Roadmap

This roadmap sequences the implementation of `LibPARI`, a Julia wrapper for
the PARI/GP number-theory library, from the requirements stated in
[`spec-ears.md`](spec-ears.md) (Software Requirements Specification, EARS
notation, Draft v0.3).

Every requirement in the SRS is assigned to exactly one milestone below.
Section [Traceability](#traceability) maps each requirement ID to the
milestone that delivers it.

The roadmap is in two parts. **Part I (M0–M10)** built the wrapper and is
delivered. **Part II (M11–M21)** redesigns the public API for 1.0 — it is
not derived from `spec-ears.md` but introduces its own requirement families.

## How to read this roadmap

- **Milestones** are ordered by dependency. Each one is shippable: it ends
  in a release with a green CI run.
- **Scope** lists the requirement IDs the milestone delivers.
- **Exit criteria** are the verifiable conditions for closing the milestone.
- **Cross-cutting workstreams** (testing, formatting, docs) advance inside
  *every* milestone rather than waiting for a dedicated phase.
- Status legend: `[ ]` not started · `[~]` in progress · `[x]` done.

## Current status (2026-07-31, package version 0.16.0)

**Part I (M0–M10) is complete.** Every deliverable shipped, in milestone
order, in releases `0.1.0` … `0.11.0`; the work that followed
(`0.12.0` … `0.15.1`) is listed under
[Delivered beyond Part I](#delivered-beyond-part-i-0120--0151).

**Part II (M11–M21) is in progress.** M11, M12, M13 and most of M14
shipped together as **`0.16.0`** (2026-07-31). M15–M21 are not started;
M14 keeps three deliverables open (modular arithmetic, the polynomial
facade, the optional Primes.jl extension). M13 keeps one deliverable
open — REQ-PREC-13, which collides with NFR-01; see the milestone. It is the
API redesign that must land
before 1.0: an honest type contract for `Gen`, precise conversion and
promotion rules, precision-safe reals, `pari(x)`, ergonomic generated
bindings, explicit GP state, idiomatic access to structured PARI objects,
and — as optional extensions — the Symbolics.jl and Giac.jl bridges.

One deviation from the exit criteria, recorded here rather than silently
ticked: the per-milestone tags `v0.1.0` … `v0.11.0` were **never created**.
Tagging was deferred milestone after milestone (the suite was not reliably
green until M9/M10), and once the package was registered in the General
registry the repository switched to TagBot, which tags from registry
merges. The only tag in the repository is `v0.15.1`. Each milestone's
release is therefore identified by its `CHANGELOG.md` entry, not by a tag.

# Part I — building the wrapper (M0–M10, delivered)

## Dependency overview

```
M0 scaffolding
   └─> M1 lifecycle
          └─> M2 Gen + memory
                 └─> M3 error handling
                        └─> M4 binding generator ──┐
                                                   ├─> M5 conversions
                                                   │       └─> M6 numeric API
                                                   └─> M7 GP evaluator
M4/M5/M6/M7 ─> M8 type stability + precompilation
M1 ──────────> M9 platform + concurrency
all ─────────> M10 documentation + 0.11.0 release
```

## Milestone summary — Part I

| ID  | Milestone                                | Target version | Status |
|-----|------------------------------------------|----------------|--------|
| M0  | Project scaffolding & packaging baseline | 0.1.0          | done — released `0.1.0` |
| M1  | Library lifecycle                        | 0.2.0          | done — released `0.2.0` |
| M2  | `Gen` value type & memory management     | 0.3.0          | done — released `0.3.0` |
| M3  | Error handling & the C-call boundary     | 0.4.0          | done — released `0.4.0` |
| M4  | Binding generator & function invocation  | 0.5.0          | done — released `0.5.0` |
| M5  | Type conversions                         | 0.6.0          | done — released `0.6.0` |
| M6  | Idiomatic numeric API                    | 0.7.0          | done — released `0.7.0` |
| M7  | GP expression evaluator                  | 0.8.0          | done — released `0.8.0` |
| M8  | Type stability & precompilation          | 0.9.0          | done — released `0.9.0` |
| M9  | Platform & concurrency hardening         | 0.10.0         | done — released `0.10.0` |
| M10 | Documentation & 0.11.0 release           | 0.11.0         | done — released `0.11.0` |

---

## M0 — Project scaffolding & packaging baseline

**Goal:** a registrable, CI-ready package skeleton with the quality gates
wired in before any wrapper code exists.

**Scope:** REQ-PKG-01, REQ-PKG-02, REQ-PKG-03, REQ-PKG-04, REQ-PKG-05,
REQ-QA-04, REQ-QA-05, REQ-QA-06, REQ-PLT-02.

**Deliverables**

- [x] `Project.toml` with a fresh UUID and a `[compat]` section. (REQ-PKG-01)
- [x] `[compat]` bound on `PARI_jll`. (REQ-PKG-02)
- [x] `[compat]` bound `julia = "1.10"` (LTS and later). (REQ-PLT-02)
- [x] Package named `LibPARI` per General registry Rule 6 (wrappers).
      (REQ-PKG-05)
- [x] `src/LibPARI.jl` module stub.
- [x] `CHANGELOG.md` in "Keep a Changelog" format; SemVer adopted.
      (REQ-PKG-03, REQ-PKG-04)
- [x] `.JuliaFormatter.toml` with an 80-character margin. (REQ-QA-04,
      REQ-QA-05)
- [x] Pre-commit hooks running formatting and quality checks. (REQ-QA-06)
- [x] `test/` skeleton driven by `TestItemRunner` (`@run_package_tests`),
      with the `test/package/` directory reserved. (cross-cutting:
      REQ-QA-01, REQ-QA-02)
- [x] CI workflow stub (test matrix + docs job placeholders).

**Exit criteria**

- `using LibPARI` succeeds; `Pkg.test()` runs an empty-but-green suite.
- `JuliaFormatter` reports no diff; pre-commit hooks pass locally.
- Tag `v0.1.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.1.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M1 — Library lifecycle

**Goal:** PARI initializes once per process, from the JLL artifact, and
shuts down cleanly.

**Depends on:** M0.

**Scope:** REQ-INI-01 … REQ-INI-07.

**Deliverables**

- [x] `libpari` resolved exclusively from the `PARI_jll` artifact.
      (REQ-INI-01)
- [x] `pari_init` called exactly once, from the module `__init__`, never
      during precompilation. (REQ-INI-02, REQ-INI-03)
- [x] Configurable stack size honoured when set before module load.
      (REQ-INI-04)
- [x] `pari_close` registered to run at process exit (`atexit`).
      (REQ-INI-05)
- [x] Guard preventing any `libpari` call before initialization.
      (REQ-INI-06)
- [x] `pari_init` failure raises a Julia exception, leaving the library
      uninitialized. (REQ-INI-07)

**Exit criteria**

- Tests confirm single init, exit-time close, custom stack size, and the
  failure path.
- Tag `v0.2.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.2.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M2 — `Gen` value type & memory management

**Goal:** a concrete, GC-safe Julia type wrapping PARI's `GEN`, with
leak-free stack discipline.

**Depends on:** M1.

**Scope:** REQ-MEM-01 … REQ-MEM-08.

**Deliverables**

- [x] `Gen` represents every PARI object exposed to Julia. (REQ-MEM-01)
- [x] `Gen` is a **concrete** type (prerequisite for type stability).
      (REQ-MEM-02)
- [x] Results moved off the PARI stack with `gclone` before return.
      (REQ-MEM-03)
- [x] GC finalizer frees the clone via `gunclone`. (REQ-MEM-04)
- [x] `avma` (stack pointer) restored to its pre-call value after each
      call. (REQ-MEM-05)
- [x] Idempotent finalizer: at most one `gunclone` per object.
      (REQ-MEM-06)
- [x] Module-scoped enum for PARI value types (`t_INT`, `t_REAL`, `t_POL`,
      `t_VEC`, …). (REQ-MEM-07)
- [x] Type-query API returning that enum. (REQ-MEM-08)

**Exit criteria**

- Stress test allocating/freeing many `Gen` values shows stable `avma`
  and no heap growth (early evidence toward NFR-02).
- Tag `v0.3.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.3.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M3 — Error handling & the C-call boundary

**Goal:** a safe Julia/C boundary — no PARI `longjmp` escapes, every PARI
error becomes a Julia exception.

**Depends on:** M2.

**Scope:** REQ-ERR-01 … REQ-ERR-04.

**Deliverables**

- [x] PARI errors translated into Julia exceptions carrying PARI's
      message. (REQ-ERR-01)
- [x] PARI `longjmp` trapped so it cannot unwind past the Julia/C
      boundary. (REQ-ERR-02)
- [x] PARI stack restored to a consistent state on error before raising.
      (REQ-ERR-03)
- [x] Module-scoped enum of PARI error categories, included in every
      raised exception. (REQ-ERR-04)

**Exit criteria**

- Tests deliberately trigger PARI errors and assert exception type,
  message, category, and stack consistency afterwards.
- Tag `v0.4.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.4.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M4 — Binding generator & function invocation

**Goal:** generate the bulk of the API automatically from `pari.desc`.

**Depends on:** M3 (bindings need the safe boundary and `Gen`).

**Scope:** REQ-GEN-01 … REQ-GEN-10, REQ-CALL-01 … REQ-CALL-04.

**Deliverables**

- [x] Generator derives bindings from the RFC-822 records of `pari.desc`.
      (REQ-GEN-01)
- [x] `pari.desc` read from `PARI_jll.pari_desc` (version-matched).
      (REQ-GEN-02)
- [x] Records with a `C-Name` field emit a `ccall` binding. (REQ-GEN-03)
- [x] `Prototype` codes mapped to `ccall` argument/return types.
      (REQ-GEN-04)
- [x] `Help` text attached as the binding docstring. (REQ-GEN-05)
- [x] All bindings written to a single, committed, header-marked
      auto-generated source file. (REQ-GEN-06, REQ-GEN-07)
- [x] Generated file conforms to JuliaFormatter. (REQ-GEN-08)
- [x] Records without `C-Name` omitted. (REQ-GEN-09)
- [x] Unrecognized prototype codes skip the function with a diagnostic.
      (REQ-GEN-10)
- [x] Precision args (`p`/`b`/`P`): auto-supplied, `prec` keyword
      override. (REQ-CALL-01)
- [x] Optional args (`D...`): exposed with declared defaults.
      (REQ-CALL-02)
- [x] Output args (`&`): returned alongside the primary result as a
      tuple. (REQ-CALL-03)
- [x] GP-closure args (`E`/`I`/`V`/`C`): excluded from generated
      bindings. (REQ-CALL-04)

**Exit criteria**

- Generator runs reproducibly; generated file is committed and formatted.
- Generated binding count recorded toward NFR-01 (≥ 1200 functions).
- Tag `v0.5.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.5.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M5 — Type conversions

**Goal:** seamless conversion between Julia numeric values and `Gen`.

**Depends on:** M4.

**Scope:** REQ-CONV-01 … REQ-CONV-04.

**Deliverables**

- [x] Julia `Integer` → integer-valued PARI `GEN`. (REQ-CONV-01)
- [x] `Gen` integer → exact `BigInt`. (REQ-CONV-02)
- [x] Textual representation equal to PARI's `GENtostr`. (REQ-CONV-03)
- [x] Lossy `Gen` → Julia numeric conversion raises `InexactError`.
      (REQ-CONV-04)

**Exit criteria**

- Round-trip and lossy-conversion tests pass.
- Tag `v0.6.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.6.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M6 — Idiomatic numeric API

**Goal:** `Gen` behaves like a first-class Julia number.

**Depends on:** M5.

**Scope:** REQ-API-01 … REQ-API-05.

**Deliverables**

- [x] `Gen <: Number`. (REQ-API-01)
- [x] Operators `+`, `-`, `*`, `/`, `^` overloaded for `Gen`.
      (REQ-API-02)
- [x] Mixed `Gen`/`Number` arithmetic promotes the Julia operand to
      `Gen`. (REQ-API-03)
- [x] `==` returns PARI's equality result. (REQ-API-04)
- [x] Display uses PARI's textual representation. (REQ-API-05)

**Exit criteria**

- Arithmetic, promotion, comparison, and display tests pass.
- Tag `v0.7.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.7.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M7 — GP expression evaluator

**Goal:** an escape hatch for functions not covered by generated bindings.

**Depends on:** M4 (and M2/M3 for `Gen` results and error handling).

**Scope:** REQ-GP-01, REQ-GP-02.

**Deliverables**

- [x] Function evaluating an arbitrary GP expression string, returning a
      `Gen`. (REQ-GP-01)
- [x] Syntactically invalid expressions raise a Julia exception
      describing the parse error. (REQ-GP-02)

**Exit criteria**

- Evaluator handles valid and malformed expressions; covers a
  GP-closure-argument function unreachable via bindings.
- Tag `v0.8.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.8.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M8 — Type stability & precompilation

**Goal:** SciML-grade inference and fast first call.

**Depends on:** M4, M5, M6, M7.

**Scope:** REQ-PERF-01, REQ-PERF-02, REQ-PERF-03.

**Deliverables**

- [x] Every generated binding is type-stable: return inferable as `Gen`
      or the scalar Julia type required by the prototype. (REQ-PERF-01)
- [x] PrecompileTools.jl workload exercising a representative subset of
      bindings. (REQ-PERF-02)
- [x] `@code_warntype` audit: any inferred `Any` on a public function is
      treated as non-conforming and fixed. (REQ-PERF-03)

**Exit criteria**

- Inference tests (e.g. `@inferred`) pass across the public surface.
- Tag `v0.9.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.9.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M9 — Platform & concurrency hardening

**Goal:** correct behaviour on every supported platform and under
multi-threaded Julia.

**Depends on:** M1.

**Scope:** REQ-PLT-01, REQ-PLT-03. (REQ-PLT-02 delivered in M0.)

**Deliverables**

- [x] Support every platform for which `PARI_jll` provides an artifact.
      (REQ-PLT-01)
- [x] Single global lock serializing all `libpari` calls under
      multi-threaded Julia. (REQ-PLT-03) — delivered in `0.10.0` as a
      dedicated sticky PARI worker task (equivalent to the lock: every
      `libpari` call is confined to one task), then **superseded in
      `0.13.0`** by one PARI context per Julia OS thread, which keeps
      REQ-PLT-03 and additionally lets calls run in parallel.

**Exit criteria**

- Multi-threaded stress test passes with no data races or stack
  corruption — `test/concurrency_tests.jl`, run as its own
  `--threads=auto` CI step on all three OSes.
- Tag `v0.10.0` — **not created**; the release is identified by its
  `CHANGELOG.md` [0.10.0] entry (2026-05-20). See
  [Current status](#current-status-2026-07-30-package-version-0151).

---

## M10 — Documentation & 0.11.0 release

**Goal:** publishable documentation, full CI matrix, non-functional
acceptance — the 0.11.0 release.

**Depends on:** all prior milestones.

**Scope:** REQ-DOC-01 … REQ-DOC-06, REQ-QA-07, REQ-QA-08, NFR-01 … NFR-04.

**Deliverables**

- [x] Documentation built with Documenter.jl. (REQ-DOC-01)
- [x] Hand-written public functions/types carry DocStringExtensions
      docstrings. (REQ-DOC-02)
- [x] Each hand-written public function docstring has a `jldoctest`.
      (REQ-DOC-03)
- [x] `jldoctest` examples executed and verified at build time.
      (REQ-DOC-04)
- [x] Documentation builds with **no warnings**. (REQ-DOC-05)
- [x] CI deploys docs to GitHub Pages from the default branch.
      (REQ-DOC-06)
- [x] CI test matrix runs on Linux, macOS, and Windows. (REQ-QA-07)
- [x] CI fails the build if the suite fails on any platform. (REQ-QA-08)
      — the matrix landed in `0.11.0` but carried `continue-on-error`
      while `PARI_jll` was unregistered; it became a true hard gate in
      `0.15.0`, and the last three failing test items were fixed in
      `0.15.1`.
- [x] Acceptance: ≥ 1200 GP-accessible functions covered. (NFR-01)
      — 1241 generated bindings in `src/bindings.jl`.
- [x] Acceptance: no PARI heap leak across repeated calls. (NFR-02)
- [x] Acceptance: no allocation beyond the `Gen` result + its clone.
      (NFR-03)
- [x] Acceptance: generator output byte-identical across two runs.
      (NFR-04)

**Exit criteria**

- All NFR acceptance checks pass; docs deploy; CI green on all three OSes.
- Tag `v0.11.0` — **not created** (see above); registration in the General
  registry landed later, in `0.15.0`, once `PARI_jll` was itself
  registered.

---

---

# Part II — API redesign, 0.16.0 → 1.0.0

M0–M10 built a *complete* wrapper. This second part makes it an *honest*
one: it fixes the public contracts that cannot be changed after 1.0.

The two-layer architecture is kept as is — a hand-written Julia core and the
generated `LibPARI.PARI` layer of 1241 bindings. Nothing here rewrites PARI,
replaces the generated layer with hand-maintained wrappers, or edits
`src/bindings.jl` by hand.

**Because the package is pre-1.0, correctness outranks backward
compatibility.** Every milestone below therefore carries an explicit
*Breaking changes* list. A deprecation shim is added only where it is cheap
and unambiguous; a shim that would preserve semantics a milestone classifies
as *incorrect* is rejected, not written.

**Evidence status.** The observations quoted below (marked *observed*) come
from an analysis pass over the working tree at `0.15.1`; the adversarial
re-verification pass did not run. Each one must be pinned by a failing test
before its milestone is closed — that is what the first deliverable of each
milestone buys.

## Dependency overview — Part II

```
M10 (0.11.0, done)
  └─> M11 type contract ── M12 conversion & promotion
                                   └─> M13 precision ──┬─> M14 pari(x) + facade
                                                       └─> M15 binding ergonomics
        M11 ─────────────> M16 GP sessions
        M11 ─────────────> M17 structured objects
        M11 ─────────────> M18 display contract
  M11+M13+M14+M17 ──────> M19 Symbolics bridge ─> M20 Giac bridge
  all ───────────────────> M21 documentation, migration, 1.0.0
```

`M13` and `M15` both regenerate `src/bindings.jl`; they must not be in
flight at the same time. `M16`, `M17` and `M18` are independent of each
other and of `M12`–`M15`, and may be reordered freely after `M11`.

**Version targets are targets.** The per-milestone versions below were the
plan; milestones that ship together collapse into one release. M11–M14 plus
REQ-PREC-13 shipped as **`0.16.0`** on 2026-07-31 — `0.17.0` and `0.18.0`
never existed, and the remaining milestones will renumber the same way.

## Milestone summary — Part II

| ID  | Milestone                                  | Target version | Status |
|-----|--------------------------------------------|----------------|--------|
| M11 | Honest type contract for `Gen`             | 0.16.0         | **released** in `0.16.0` |
| M12 | Conversion & promotion contracts           | 0.17.0         | **released** in `0.16.0` |
| M13 | Precision-safe reals & a bit-based precision API | 0.18.0    | **released** in `0.16.0` |
| M14 | `pari(x)`, the public surface, and a small facade | 0.19.0  | **released** in `0.16.0`; facade completed since |
| M15 | Generated-binding argument ergonomics      | 0.20.0         | **done** (unreleased) |
| M16 | Explicit GP evaluation sessions            | 0.21.0         | not started |
| M17 | Structured PARI objects                    | 0.22.0         | **done** (unreleased) |
| M18 | Display contract                           | 0.23.0         | not started |
| M19 | Symbolics.jl bridge (optional extension)   | 0.24.0         | not started |
| M20 | Giac.jl bridge (optional extension)        | 0.25.0         | not started |
| M21 | Documentation, migration & the 1.0.0 release | 1.0.0        | not started |

---

## M11 — Honest type contract for `Gen`

**Goal:** stop `Gen` claiming to be a Julia `Number` when one concrete `Gen`
wraps *every* PARI object — matrices, strings and closures included — and
re-implement, as explicit two-argument methods, each mixed `Gen`/Julia-number
operation that Base's `Number` fallbacks silently provide today.

**Depends on:** M10 (nothing unshipped).

**Scope:** REQ-TYPE-01 … REQ-TYPE-13.

**Deliverables**

- [x] `abstract type PariObject end`; `mutable struct Gen <: Number`
      (was `src/gen.jl:46`) becomes `Gen <: PariObject`. `Gen` stays concrete,
      mutable, single-field, unparameterised (REQ-MEM-02). (REQ-TYPE-01)
      - No `Gen{T}` per PARI tag: the tag is a runtime word read from the
        GEN (`src/gen.jl:167-170`), so a parametric `Gen` would make every
        generated binding's return type uninferable and break REQ-PERF-01.
- [x] Explicit `+ - * / ^ \` methods on `(Gen, Number)` and `(Number, Gen)`,
      generated from one operator table, each building a `Gen` operand and
      calling the existing `Gen`/`Gen` operator. (REQ-TYPE-02)
      - Base's `op(::Number, ::Number)` promotion (`src/numeric.jl:140-145`)
        is the *only* reason `Gen(6) + 1` works today; it disappears with
        the supertype and cannot be recovered short of re-subtyping.
- [x] Explicit `==(::Gen, ::Number)` / `==(::Number, ::Gen)` over `gequal`.
      Without them Base's `==(x, y) = x === y` fallback returns `false`
      silently — a wrong answer, not an error. (REQ-TYPE-03)
- [x] `isless(::Gen, ::Number)` and `isless(::Number, ::Gen)`; keep the
      mixed `<` / `<=` methods (`src/numeric.jl:199-202`). (REQ-TYPE-04)
      - *Observed:* only `isless(::Gen, ::Gen)` exists today, so
        `sort(Any[Gen(2), 1])` already raises a `MethodError` — the 0.14.0
        ordering claim is already overstated.
- [x] `Base.broadcastable(g::Gen) = Ref(g)`. A `Gen` broadcasts as a scalar
      today only because `Number` is on Base's whitelist; the generic
      fallback is `collect(x)`, which a non-iterable `Gen` cannot satisfy.
      (REQ-TYPE-05)
- [x] Re-implement directly on `Gen` the Base-`Number` conveniences that
      would otherwise be lost — unary `+`, `\`, `float`, `abs2`,
      `adjoint`/`transpose` — and document every one deliberately *not*
      re-implemented. (REQ-TYPE-06)
- [x] Break the `convert(::Type{Gen}, x::Number) = Gen(x)` cycle
      (`src/numeric.jl:145`): an operand with no `Gen` constructor must
      raise a catchable exception. (REQ-TYPE-07)
      - *Observed:* `Gen(1) + π` raises `StackOverflowError` today.
- [x] Convert a `t_REAL` through PARI instead of `parse(_genrepr(g))`
      (`src/conversions.jl:213,235`). (REQ-TYPE-08)
      - *Observed:* `Float64(gp_eval("1.0*10^400"))` raises
        `ArgumentError: cannot parse "1.0000…0 E400"` — PARI prints a space
        before the exponent. This is a REQ-CONV-04 violation.
- [x] Make `hash` total over every PARI type; it routes `T_REAL` through
      `Float64` (`src/numeric.jl:216`) and therefore throws on a large real.
      Property-test `a == b ⟹ hash(a) == hash(b)`. (REQ-TYPE-09)
- [x] **Replace** the tests encoding the old contract —
      `test/numeric_tests.jl:4-8,77-84` and all of
      `test/number_interface_tests.jl` — with assertions that
      `Gen <: PariObject`, `!(Gen <: Number)`, `isconcretetype(Gen)`, and
      that a `t_MAT`/`t_STR`/`t_CLOSURE` `Gen` is not a `Number`.
      (REQ-TYPE-10)
      - *Observed:* `gp_eval("[1,2;3,4]") isa Number` and
        `gp_eval("\"abc\"") isa Number` are both `true` today — the concrete
        dishonesty this milestone removes.
- [x] A method-matrix test: {`+`,`-`,`*`,`/`,`^`,`==`,`<`,`<=`,`isless`} ×
      {`Int`, `BigInt`, `Float64`, `BigFloat`, `Rational`, `Complex`} ×
      both operand orders, asserting *computed values*, not merely
      `isa Gen`. (REQ-TYPE-11)
- [x] Correct the "complete Julia `Number`" claim in `docs/src/api.md:89-96`,
      `docs/src/index.md:23`, `docs/src/getting-started.md:47` and
      `README.md:31`; the 0.14.0 CHANGELOG entry stays as written and the
      0.16.0 entry records its supersession. (REQ-TYPE-12)
- [ ] Re-enable Aqua's `ambiguities` check
      (`test/package/aqua_tests.jl`, deferred pending M9 — shipped in
      0.10.0/0.13.0) and extend `test/inference_tests.jl` with `@inferred`
      over every new method. (REQ-TYPE-13)
      - **Partly done, deliberately left open.** The `@inferred` extension
        shipped; the Aqua check is still disabled. Evidence for whoever
        flips it: with M11 in place both `Aqua.test_ambiguities(LibPARI)`
        and `Test.detect_ambiguities(LibPARI; recursive = true)` are clean
        locally. It is left off because the check spawns a subprocess that
        loads PARI, which is an untested risk on the macOS and Windows
        runners — flip it in its own change, not inside M11.

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `Gen <: Number`; `gp_eval("[1,2;3,4]") isa Number == true` | `Gen <: PariObject`; `isa Number == false` | **Impossible** — a Julia type's supertype is fixed at definition. Code dispatching on `::Number` (LinearAlgebra methods bounded by `T<:Number`, generic numeric packages, `x isa Number` guards) stops accepting `Gen`. |
| `Gen(6) + 1` via `promote` | explicit `+(::Gen, ::Number)` pair | Behaviour preserved for the documented type set; types with no `Gen` constructor go from `StackOverflowError` to a clean error. |
| `Gen(2) == 2 == true` via promotion | explicit `==` pair | **Exit-gated, no partial shim**: without the explicit methods Base's `===` fallback makes `Gen(2) == 2` silently `false` and `Dict(Gen(7)=>"s")[7]` a `KeyError`. |
| `float`, `abs2`, `adjoint`, `\`, broadcasting via `Number` fallbacks | explicit methods (REQ-TYPE-05/06) | Anything not re-implemented is a genuine, documented loss. |
| `Float64(gp_eval("1.0*10^400"))` → `ArgumentError` | a finite `Float64`, or `Inf` | None: the old behaviour violates REQ-CONV-04 and makes `hash` partial. |
| REQ-API-01 "`Gen <: Number`" (M6/0.7.0) | superseded by REQ-TYPE-01 | Documentation-level break; the traceability table records the supersession rather than rewriting history. |

**Exit criteria**

- `Gen <: PariObject`, `!(Gen <: Number)` and `isconcretetype(Gen)` are
  asserted by tests; the suite is green on the 3-OS × 2-Julia matrix.
- The method matrix passes with no `MethodError` and no `===`-fallback
  result: `Gen(2) == 2`, `2 == Gen(2)`, `Dict(Gen(7)=>"s")[7]` and
  `sort(Any[Gen(2), 1])` all behave as before the change.
- `Gen(1) + π` raises a catchable exception; no run produces a
  `StackOverflowError`.
- `Float64`, `BigFloat` and `hash` succeed on every PARI real, including
  `gp_eval("1.0*10^400")`; a non-real `Gen` raises `InexactError`.
- No file under `docs/`, `README.md`, or the 0.16.0 CHANGELOG entry states
  that `Gen` is a Julia `Number`; docs build with zero warnings.

**Open questions**

- `Gen(::Irrational)`: refuse with an error pointing at `PARI.mppi`, or
  convert at a default precision? Refusing is proposed — there is no
  lossless conversion, PARI needs an explicit precision.
- Keep `promote_rule`/`convert` for array-literal element typing
  (`[Gen(1), 2]::Vector{Gen}`), or delete them outright? They are half of
  the `Gen(1) + π` recursion. Resolved in M12 — see REQ-PROM-05.
- `PariNumber <: Number`: **discuss, do not schedule.** All 1241 generated
  bindings return a plain `Gen`, so a second wrapper adds a conversion at
  every boundary and doubles the operator matrix. Implement only behind a
  tested consumer.
- Which LinearAlgebra paths are bounded by `T<:Number`? `[Gen(1) Gen(2);
  Gen(3) Gen(4)] * I` works today; an explicit sweep must run before any
  claim is made in the docs.

---

## M12 — Conversion & promotion contracts

**Goal:** replace the blanket `promote_rule`/`convert` promises for every
Julia `Number` with one explicitly enumerated, documented and tested
accepted-input set, reused by conversions, operators and (in M15) the
generated bindings. Every unsupported input fails at the conversion
boundary with one named error.

**Depends on:** M11.

**Scope:** REQ-PROM-01 … REQ-PROM-11.

**Deliverables**

- [x] One canonical accepted-input set: a documented union alias
      `LibPARI.PariConvertible`, plus a single conversion entry point
      `LibPARI.gen_convert(x)::Gen`. `Gen(x)`, `convert(Gen, x)` and every
      mixed operator call it; no second conversion path exists.
      (REQ-PROM-01)
- [x] Coverage-matrix `@testitem`: `Bool`, `Int8`…`Int128`,
      `UInt8`…`UInt128`, `BigInt`, `Rational{<:Integer}` (including
      `Rational{Int8}`), `Float16`, `Float32`, `Float64`, `BigFloat`, and
      `Complex{T}` for every supported `T` — each asserting the resulting
      `gentype` and a value round-trip. (REQ-PROM-02)
      - `Bool` maps to `t_INT` 0/1 (`Bool <: Integer`, and PARI has no
        boolean type); the test pins the decision rather than leaving it
        accidental.
- [x] One `LibPARI.ConversionError` raised at the boundary for every input
      outside the set — foreign `AbstractFloat`, `Irrational`, `Missing`,
      foreign `Number` — naming the offending type and the `gen_convert`
      hook. (REQ-PROM-03)
      - *Observed:* a foreign `AbstractFloat` fails today as
        `MethodError: no method matching Float64(::MyFloat)` raised *inside*
        `Gen`; `promote_type(Gen, typeof(π))` raises `StackOverflowError`.
- [x] Delete the catch-alls `promote_rule(::Type{Gen}, ::Type{<:Number})`
      and `convert(::Type{Gen}, x::Number)` (`src/numeric.jl:143,145`);
      `convert(::Type{Gen}, ::Integer)` (`src/conversions.jl:120`) is
      subsumed by the `PariConvertible` method. (REQ-PROM-04)
- [x] Mixed arithmetic no longer relies on promotion: emit explicit
      `op(::Gen, ::PariConvertible)` and `op(::PariConvertible, ::Gen)`
      methods for `+ - * / ^ == < <=` from one operator list, each calling
      `gen_convert` exactly once. (REQ-PROM-05)
      - This is the replacement mechanism once M11 removes `Gen <: Number`;
        `promote_rule` then plays no role at all, so it is *removed* rather
        than narrowed. If M11 slips, ship this anyway — explicit methods are
        strictly more specific than promotion and take precedence.
- [x] Neutralise the constructors `Gen` inherits from `Number`: `Gen('a')`,
      `convert(Gen, 'a')`, `convert(Gen, CartesianIndex(3))` and
      `Gen(::Base.TwicePrecision)` must raise `ConversionError`; a test
      asserts each. (REQ-PROM-06)
      - *Observed:* all four resolve today through Base methods that apply
        only because `Gen <: Number`; two of them are lossy.
- [x] `Float64(::Gen)` / `BigFloat(::Gen)` stop parsing PARI's decimal text
      and read the `t_REAL` numerically; regression test over magnitudes
      `1e-500` … `1e434`. (REQ-PROM-07)
      - Delivered early, in M11 as REQ-TYPE-08: the same defect blocked
        `hash`, so it could not wait for this milestone.
      - *Observed:* `Float64(Gen(1e-10))` raises `ArgumentError: cannot
        parse "1.0000000000000000364 E-10"`. Any magnitude outside roughly
        `[1e-5, 1e19)` is affected. Shares its fix with REQ-TYPE-08.
- [x] Add the missing typed outward conversions `Float16`, `Float32`,
      `Rational{T}`, `Complex{T}`, each raising `InexactError` outside `T`;
      `Rational(g)::Rational{BigInt}` and `Complex(g)::ComplexF64` keep
      their current return types. (REQ-PROM-08)
      - *Observed:* `Float32(Gen(1))`, `Float16(Gen(1))`,
        `Rational{Int}(Gen(1)/Gen(2))` and `Complex{BigFloat}(Gen(1))` are
        all `MethodError`s today.
- [x] Narrow `(::Type{T})(g::Gen) where {T<:Integer}`
      (`src/conversions.jl:181`) to `Base.BitInteger`, `BigInt` and `Bool`,
      keeping `Integer(g)::BigInt` explicit. (REQ-PROM-09)
      - Cheap unambiguous shim **accepted** here: route an unknown
        `T<:Integer` through `T(BigInt(g))` behind a deprecation warning —
        the semantics are unchanged for well-behaved `T`.
- [x] Pin the `Inf`/`NaN` policy, replacing today's
      `PariError(e_OVERFLOW)` from `dbltor`. (REQ-PROM-10)
- [x] `docs/src/api.md` gains a conversion-contract table (accepted inward
      type → PARI tag; `Gen` → Julia type and its failure mode), with
      jldoctests. (REQ-PROM-11)

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `promote_rule(::Type{Gen}, ::Type{<:Number})` + `convert(::Type{Gen}, ::Number)` | explicit methods over `PariConvertible` | None: a shim restoring the catch-all restores the `MethodError`/`StackOverflowError` failures it caused. |
| `Gen('a') == 97`; `convert(Gen, CartesianIndex(3)) == 3`; `Gen(TwicePrecision(...))` | each raises `ConversionError` | None — blessing an unintended, partly lossy API. |
| `T(g::Gen)` for any `T<:Integer` | `BitInteger`/`BigInt`/`Bool` only | **Deprecation warning shim shipped** (semantics unchanged). |
| `Float64(Gen(1e-10))` → `ArgumentError` | `=== 1.0e-10` | None: the old path is a defect. |
| `Gen(Inf)` → `PariError(e_OVERFLOW)` | conversion error per REQ-PROM-10 | Documented in the CHANGELOG; both are catchable. |

**Exit criteria**

- The coverage matrix is green, and a test enumerating `methods(Gen)`,
  `methods(convert, Tuple{Type{Gen},Any})` and `methods(promote_rule)`
  finds no method admitting a type outside `PariConvertible`.
- `Gen(1) == π`, `promote_type(Gen, typeof(π))`, a foreign float, and
  `Gen(missing)` each raise `LibPARI.ConversionError` — no
  `StackOverflowError`, no `MethodError` naming a Base function.
- `Float64(Gen(x)) === x` over `1e-300` … `1e300`; no `ArgumentError` is
  raised anywhere in the suite.
- Aqua stays green; every new public symbol has a docstring with a
  jldoctest (REQ-DOC-02/03).

**Open questions**

- Is `gen_convert` a 1.0 public-API commitment — it becomes the third-party
  extension point, which is how a downstream package adds support for its
  own numeric type without pirating `Base.convert` — or an internal seam?
  If public, its name, signature and error contract freeze here.
- `Inf`/`NaN`: reject both with `InexactError`, or map `±Inf` onto PARI's
  `t_INFINITY`? `isfinite`/`isinf` already key on `PariType.T_INFINITY`
  (`src/numeric.jl:230-231`), which makes the mapping tempting, but
  `t_INFINITY` does not participate in general PARI arithmetic. Rejecting
  is the working assumption.
- Should `Gen(::Float16)` / `Gen(::Float32)` produce a `t_REAL` of
  source-matched precision, or keep today's widening to PARI's default?
  (*Observed:* `Gen(Float16(1.5))` prints 19 significant digits.)
- A closed union excludes legitimate third-party numeric types that the
  current `Gen(x::Integer)` word/string path already handles correctly
  (*observed:* `Rational{Int8}`, `UInt128`, `typemax(UInt)` all work). The
  proposed answer is: closed union as the *guaranteed* set, `gen_convert`
  as the documented extension point.
- `Complex` is value-preserving but not tag-preserving — PARI normalises a
  zero imaginary part, so *observed:* `gentype(Gen(Complex(1,0))) ===
  T_INT`. Guarantee `Complex(Gen(z)) == z` in value only, never the tag.

---

## M13 — Precision-safe reals & a bit-based precision API

**Goal:** make every Julia↔PARI real conversion precision-preserving, and
give users one documented, bit-based way to set the working precision —
replacing the undocumented `prec = 4` defaults with a single explained
constant and a caller-side scope that survives the hop onto the per-thread
PARI worker.

**Depends on:** M11, M12.

**Scope:** REQ-PREC-01 … REQ-PREC-13.

**Deliverables**

- [x] `docs/src/precision.md` fixing the units, with a requested→allocated
      bits table. (REQ-PREC-01)
      - *Observed:* in PARI ≥ 2.15 the prototype codes `p` and `b` are
        **bit** counts (`p` rounded up to a multiple of 64), and
        `prec2nbits(x) { return x; }` — so the generator's comment
        "word precision (prototype code `p`)" (`gen/generate.jl:20`) is
        wrong. Verify against the shipped `pariinl.h` before writing the
        page.
- [x] `Base.precision(g::Gen)::Int` in bits, plus `LibPARI.isexact(g)`. No
      new type parameter — precision is a runtime property of the GEN
      header. (REQ-PREC-02)
- [x] Delete `_DEFAULT_PREC = Int(4)` (`src/numeric.jl:8`); add
      `LibPARI.default_precision()::Int` **in bits** with documented
      provenance; `Gen^Gen` (`src/numeric.jl:80`) reads it. (REQ-PREC-03)
- [x] Generator: replace `DEFAULT_PREC`/`DEFAULT_BITPREC` with one
      documented bit constant emitting `LibPARI.default_precision()` at
      every `p` and `b` site; keep `seriesprec` separate — it is a term
      count, not bits. (REQ-PREC-04)
- [x] `setprecision(f, Gen, bits)` / `setprecision(Gen, bits)` and a
      `precision(Gen)` getter, backed by task-local storage with
      `try`/`finally` restore so scopes nest. It must never write PARI's
      `precreal`. (REQ-PREC-05)
      - `setprecision(f, ::Module, n)` is **rejected**: every argument type
        would be owned by Base, so Aqua's piracy check would flag it.
        `Gen` is ours.
- [x] Document and test the worker-boundary rule: precision is read in the
      **caller** task and captured into the closure `_run_on_pari`
      marshals. One positive test from a non-primary thread, one negative
      test proving task-local state in the worker is *not* consulted.
      (REQ-PREC-06)
      - Keyword defaults in generated bindings are evaluated in the caller
        frame, so `prec = LibPARI.default_precision()` crosses correctly
        with no extra plumbing.
- [x] Rewrite `BigFloat(::Gen)` (`src/conversions.jl:228`) on the exact
      mantissa/exponent — `m / 2^e`, rounded once — with signature
      `BigFloat(g; precision = precision(BigFloat))`. Delete the
      `parse(BigFloat, _genrepr(g))` branch. (REQ-PREC-07)
- [x] Rewrite `Gen(::AbstractFloat)` (`src/numeric.jl:111`): `IEEEFloat`
      keeps `dbltor` (exact); `BigFloat` builds its exact integer mantissa
      then scales; any other `AbstractFloat` goes via `BigFloat(x;
      precision = precision(x))`. (REQ-PREC-08)
      - `Cdouble(x)` must not appear on any path reachable from a
        `BigFloat`; enforce with a source-grep test.
- [x] Convert the `T_REAL` branch of `Float64(::Gen)` to `rtodbl`/
      `gtodouble`: one rounding, independent of PARI's global output
      precision. (REQ-PREC-09)
- [x] `@testitem` round-tripping `BigFloat`↔`Gen` at 64, 113, 256, 512,
      1024 and 4096 bits, asserting bit-exact equality **both ways** and
      `precision(Gen(x)) >= precision(x)`. (REQ-PREC-10)
- [x] `@testitem` sweeping `setprecision(Gen, b)` for b ∈ {64, 128, 256,
      1024} over `PARI.mppi()`, `Gen(2)^Gen(1//2)` and `PARI.gexp`, against
      a BigFloat reference, to a **measured** guard margin; nested scopes
      restore. (REQ-PREC-11)
      - *Observed:* `mppi(prec=64)` is correct to only ~44 bits, so the
        margin must be measured and written down, not assumed to be zero.
- [x] Document that `gp_eval` and `show(::Gen)` follow PARI's process-global
      `precreal`, **not** the scope; add `LibPARI.set_global_precision!`
      labelled global and thread-visible; test that a scope leaves
      `gp_eval("Pi")` unchanged. (REQ-PREC-12)
- [x] Generator: stop emitting the
      `Class: default` records whose empty
      `Prototype:` produces 0-argument bindings for C functions declared
      `(const char *, long)`; replace with throwing stubs. (REQ-PREC-13)
      - *Observed:* calling `LibPARI.PARI.sd_realprecision()` today is
        undefined behaviour — the C function reads two argument registers
        the binding never sets. **Confirm this reading of `pari.desc`
        before acting**; it is the single most dangerous claim in Part II.

### REQ-PREC-13 — resolved: option 1, the bindings are removed

The defect is **confirmed** against the shipped headers, not merely
suspected:

- `pari.desc` holds **47** `Class: default` records (`_def_realprecision`,
  `_def_seriesprecision`, …), each with an empty `Prototype:` and a
  `C-Name:` of the form `sd_*`.
- The generator therefore emits 47 **zero-argument** bindings, while
  `paridecl.h:3150` declares `GEN sd_realprecision(const char *v, long
  flag)`. Calling `LibPARI.PARI.sd_realprecision()` makes the C function
  read two argument registers the caller never set — undefined behaviour,
  not a catchable error.
- They are not computational functions. They are GP's `default()` setters,
  reachable properly through `gp_eval("default(realprecision, 100)")`.

**The collision:** removing them takes the binding count from 1241 to
**1194**, below NFR-01's `≥ 1200`. Three ways out, and lowering an accepted
non-functional threshold silently is not one of them:

1. **Remove them and restate NFR-01.** The requirement says "≥ 1200
   *GP-accessible functions*"; these 47 are not that, so the old count
   over-counted. Recommended — it is the honest reading, and it deletes
   undefined behaviour from the public surface.
2. **Emit them with the real `(const char *, long)` signature.** 45 of the
   50 `sd_*` declarations have exactly that shape, but 5 diverge
   (`sd_sopath` is `(char *, int)`), and the generator does not read C
   headers — this would hard-code a family rule that cannot be verified
   for all 47 from `pari.desc` alone.
3. **Emit throwing stubs.** The count survives and the undefined behaviour
   goes, but 47 entries of that count become deliberately unusable — a
   number that no longer means what it says.

**Decision taken: option 1.** The 47 records are excluded by the generator,
which now counts them in their own diagnostic category, and NFR-01's
threshold is restated as `≥ 1190` (observed 1194) with the reason recorded
in `test/acceptance_tests.jl`. The useful capability behind them — setting
PARI's global precision — is exposed as the correctly-typed
`LibPARI.set_global_precision!`, and the acceptance test asserts the unsafe
names stay gone.

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `Gen(::BigFloat)` collapses to 53 bits | exact to `precision(x)` bits | None — a shim would preserve the silent crush. Opt in to doubles with `pari(Float64(x))`. |
| `BigFloat(g)` zero-pads past PARI's 38 decimal digits | correctly rounded once from the exact value | None: the old result is a truncation, not a rounding. |
| `prec = 4` on 142 `p` bindings | `prec = default_precision()` | None: results get *more* accurate and slightly larger; explicit `prec=` callers are unaffected. |
| `Float64(g)` via decimal text (double rounding) | `rtodbl`/`gtodouble` | None: the old path is the double-rounding one. |
| `PARI.sd_realprecision()` and siblings | `LibPARI.set_global_precision!(bits)` | **Throwing shim shipped**: same-named method raising `ArgumentError` naming the replacement. Keeping the call is undefined behaviour. |

**Exit criteria**

- `grep -c 'prec::Integer = 4' src/bindings.jl` is 0; `_DEFAULT_PREC` is
  gone; two consecutive generator runs are byte-identical (NFR-04) and the
  count stays ≥ 1200 (NFR-01).
- `BigFloat`↔`Gen` round-trips bit-exactly from 64 to 4096 bits on all
  three OSes; no `parse(BigFloat, …)` or `parse(Float64, …)` remains in
  `src/conversions.jl`.
- Two threads holding different `setprecision(Gen, …)` scopes concurrently
  each observe their own value; nested scopes restore the outer one.
- `setprecision(Gen, 1024) do; gp_eval("Pi"); end` still returns the
  global-precision value, and the docs say so explicitly.
- `docs/src/precision.md` builds with zero warnings; the "pass a `prec`
  keyword" sentence in `docs/src/api.md:28-29` names the unit.

**Open questions**

- `precision(g)` on an *exact* `Gen`: PARI's `bitprecision` answers `+oo`.
  Throw `ArgumentError` (proposed, paired with `isexact`), return
  `typemax(Int)`, or 0? Throwing keeps the `::Int` return stable but breaks
  generic code that calls `precision` blindly.
- Julia 1.10 LTS has no `Base.ScopedValues`. Task-local storage nests
  correctly but is **not** inherited by `@spawn`ed children, whereas a
  `ScopedValue` would be. Ship task-local now and revisit at a 1.11 floor,
  or take a `ScopedValues.jl` compat dependency?
- Is `default_precision()` 128 bits (GP parity, `realbitprecision`) or
  `precision(BigFloat)` = 256 (Julia parity)? The two give different
  answers for the same expression; decide once, here.
- Series precision (`P`): its own scope, a separate setter, or a plain
  keyword default?
- `hash(::Gen)` routes `T_REAL` through `Float64`, so two 1024-bit reals
  differing beyond 53 bits hash equal while `gequal` may call them
  distinct. A precision API makes this reachable in practice — fix in M11
  (REQ-TYPE-09) or here?

---

## M14 — `pari(x)`, the public surface, and a small facade

**Goal:** give LibPARI one compact conversion entry point, `pari(x)`, freeze
the exported surface at four names so `using LibPARI` is safe for 1.0, and
add a deliberately small high-level facade — extending Base only where the
semantics match exactly.

**Depends on:** M11, M12, M13.

**Scope:** REQ-PUB-01 … REQ-PUB-13.

**Deliverables**

- [x] `pari(x)` as a facade over the `Gen` constructors, covering `Integer`,
      `Rational`, `AbstractFloat`, `Complex`; `@inferred pari(x)::Gen` for
      every documented input. (REQ-PUB-01)
- [x] `pari(g::Gen) = g` — return the argument, never re-clone; test
      `pari(g) === g`, and document why aliasing is safe. (REQ-PUB-02)
      - Safe because `ptr` is written only by the idempotent `_finalize!`
        (`src/gen.jl:68-79`), there is no mutation API on `Gen`, and one
        object means one finalizer, hence one `gunclone`. It matches
        `convert(Gen, g) === g`, which already holds.
- [x] Construct complex `Gen`s with a direct PARI call instead of
      `Gen(imag(z)) * gp_eval("I")` (`src/numeric.jl:179`). Assert
      `gentype(pari(3+4im)) === PariType.T_COMPLEX` and that the path calls
      no `gp_eval`. (REQ-PUB-03)
      - The current route is *correct* (GP refuses `I = 5`, so `I` cannot be
        shadowed) but runs the GP parser on every complex construction and
        ties a core constructor to the evaluator.
- [x] `export Gen, pari, gp_eval, PariError` — nothing else. A lock test in
      `test/package/` asserts `names(LibPARI)` equals exactly that set, so
      any new export fails CI. (REQ-PUB-04)
- [x] Mark the supported-but-unexported names public — `PARI`, `PariType`,
      `PariErr`, `gentype`, `is_initialized`, `library_state`,
      `stack_size`, `serve_mcp` — behind a `VERSION >= v"1.11"` guard, since
      `public` does not parse on the 1.10 LTS floor. (REQ-PUB-05)
- [x] Extend Base only where semantics match exactly: `gcd`, `gcdx`,
      `numerator`, `denominator`, `factorial` on `Gen`, with explicit
      mixed-argument methods rather than promotion. (REQ-PUB-06)
      - `Base.factorial(::Integer)::Gen` is **rejected** as piracy that
        would change Base's return type.
- [x] Pin the exact semantics: `gcdx` returns Julia's `(d, u, v)` from
      PARI's `[u, v, d]`; `numerator`/`denominator` accept only
      `T_INT`/`T_FRAC`; `factorial` validates a non-negative integer `Gen`
      first. (REQ-PUB-07)
      - *Observed:* PARI 2.17 answers `denominator(x/2 + 1/3) == 1`, so the
        polynomial domain has no Base meaning and must be refused.
- [~] Unexported number-theory facade: `isprime(::Gen)::Bool`, `nextprime`,
      `prevprime`, `factor(::Gen)::Gen` and
      `factors(::Gen)::Vector{Pair{Gen,Gen}}`. (REQ-PUB-08)
      - The five functions shipped. The optional `LibPARIPrimesExt` weakdep
        extension supplying `Primes.isprime(::Gen)`, and its CI job, did
        **not** — it is a separate package-extension change, not a facade
        one. Reach them as `LibPARI.isprime` meanwhile.
      - Not exported: `isprime`/`factor` are Primes.jl's names. A hard
        dependency on Primes.jl is **rejected**; ship an optional
        `LibPARIPrimesExt` weakdep extension instead, with a CI job that
        loads Primes.
- [x] Modular arithmetic: `Mod(a, n)` and `lift`, `Base.powermod`,
      `Base.invmod`; `Base.mod(::Gen, ::Gen)` restricted to integer-valued
      `Gen`s and corrected to Julia's sign convention. (REQ-PUB-09)
      - *Observed:* PARI's `%` is not Julia's `mod` — `(-7)%3 == 2`,
        `7%(-3) == 1`, `(1/2)%3 == 2`. Wrapping `gmod` verbatim as
        `Base.mod` would be wrong; PARI's operator stays reachable as
        `PARI.gmod`.
- [x] Selected polynomial facade, unexported: `degree(::Gen)::Int`,
      `coeff`, `subst`, `polroots(::Gen; prec)`. `degree` throws
      `DomainError` on the zero polynomial, where PARI returns `-oo`.
      (REQ-PUB-10)
      - These exist because they add semantics (a Julia `Int` return,
        domain checks), **not** to rename `gppoldegree`.
- [x] Every facade docstring states accepted Julia *and* PARI inputs, the
      exact return type, the error behaviour and the precision behaviour.
      (REQ-PUB-11)
- [x] `docs/src/api.md` gains an exported / public / internal surface table;
      README and getting-started switch to `pari(x)`. (REQ-PUB-12)
- [ ] Re-check Aqua's `ambiguities` and `undocumented_names` for every newly
      exported or public name — adding ~15 Base methods on `Gen` is exactly
      the change that introduces ambiguities. (REQ-PUB-13)

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `using LibPARI` exports nothing (`names(LibPARI) == [:LibPARI]`) | four names exported | **No shim can exist for a new export.** Scripts using a package that exports any of the four get an ambiguous-binding error at first use. Mitigation: keep the list at four, plus the lock test. |
| `Rational(g)` throws `InexactError` from inside `BigInt(PARI.numerator(g))` | throws from the restricted `numerator(::Gen)` before any PARI call | Same exception type, different message; CHANGELOG only. |
| `Gen(3+4im)` runs the GP parser | direct PARI construction | Values identical; only timing and allocation change. |

**Exit criteria**

- `names(LibPARI)` is exactly `[:Gen, :LibPARI, :PariError, :gp_eval,
  :pari]`; the lock test fails if it changes.
- `@inferred pari(x)::Gen` for `Int`, `BigInt`, `Rational{BigInt}`,
  `Float64`, `BigFloat`, `Complex{Int}`; `pari(g) === g`;
  `BigFloat(pari(x)) == x` at 256 bits.
- `src/bindings.jl` is byte-identical to its pre-milestone content — M14
  touches no generated code — and no exported or public signature mentions
  `Ptr`.
- Every facade function has a jldoctest naming inputs, return type, error
  behaviour and precision; docs build warning-free.

**Open questions**

- `pari(::AbstractString)` is deliberately left undefined: GP-parsing a
  string would quietly promote `gp_eval` to the primary API, while building
  a `t_STR` is defensible. Adding either later is non-breaking.
- Scope of `LibPARIPrimesExt`: `Primes.isprime(::Gen)` is a clean match, but
  `Primes.nextprime(n, i)` and PARI's `nextprime` ("smallest pseudoprime
  ≥ x") differ in guarantee and arity.
- Which factorization shape leads the docs — PARI's 2-column `t_MAT`, a
  `Vector{Pair{Gen,Gen}}`, or Primes.jl's `Factorization`?
- Raise the compat floor above 1.10 so `public` can be written literally?
  That drops the current Julia LTS — a packaging decision beyond this
  milestone.
- `LibPARI.Mod` mirrors GP's spelling but reads oddly as a Julia function.

---

## M15 — Generated-binding argument ergonomics

**Goal:** let every generated binding accept plain Julia scalars wherever
PARI's prototype expects a `GEN` — `PARI.nextprime(1000)`,
`PARI.factorial(100)`, `PARI.gmodulo(5, 7)` — through `gen/generate.jl`
changes only. Exactly one conversion per argument, no copy of an existing
`Gen`, one method per binding.

**Depends on:** M12 (the accepted-input set), M13 (the float policy).
Extends M4.

**Scope:** REQ-ARG-01 … REQ-ARG-12.

**Deliverables**

- [x] Hand-written `src/argconv.jl`, included before `bindings.jl`, exposing
      M12's `PariConvertible` to the generated layer. (REQ-ARG-01)
      - One alias naming the accepted **input** set only. Not a type
        parameter, not a per-PARI-tag type: every binding still returns
        `Gen`.
- [x] Internal `_argptr(x)::Ptr{Int}`, one method per admitted type:
      `_argptr(g::Gen) = g.ptr` (no clone, no copy); a scalar builds a raw
      GEN on the PARI stack under `_trap_call`. (REQ-ARG-02)
      - `_argptr` stays unexported and undocumented: it returns a
        **transient** GEN valid only inside the caller's `avma` frame, so it
        must never appear in a public signature.
- [x] Generator emits `x$(np)::LibPARI.PariConvertible` for prototype code
      `G`, plus exactly one `_argptr` call per argument, **inside** the
      `gen_from` producer — same worker, same `avma` frame as the call.
      (REQ-ARG-03)
- [x] Generator: the optional `D<G>` keyword becomes
      `x::Union{Nothing,PariConvertible} = nothing`, replacing the ~189
      untyped `x = nothing` keywords. (REQ-ARG-04)
- [x] Generator: wrap the scalar-return and void-return branches in
      `av = _avma()` … `_set_avma(av)` so converted temporaries are
      reclaimed. (REQ-ARG-05)
      - Without this, `PARI.gsigne(5)` leaves its converted `t_INT` on the
        PARI stack — `protected_call` restores `avma` only on error.
        *Observed:* ~86 G-taking bindings sit in that branch.
- [x] Generator: emit one `GC.@preserve` region around every `_trap_call`,
      merged with the existing `Cstring` block, so no `Gen` or `Ref` is
      reachable only as a raw `Int` across the call. (REQ-ARG-06)
      - This also closes a **pre-existing latent hole**: today a `Gen`
        argument is rooted only implicitly, through the
        `protected_call`/`gen_from` closure captures.
- [x] Audit the scalar/void G-taking bindings for PARI functions that retain
      their argument in global state; any found go on a generator deny-list
      keeping `::LibPARI.Gen`, with the reason emitted into the generated
      header. (REQ-ARG-07)
      - **Dissolved by the design, not performed.** A converted argument is
        a *persistent clone* (`gen_convert`), exactly like a `Gen` the
        caller passes, so nothing points into the transient stack and no
        function can be left holding a dangling pointer. The deny-list
        existed only for the stack-temporary design the milestone
        originally assumed. Cost: one allocation per scalar argument.
      - A retained pointer into the transient stack would dangle once
        REQ-ARG-05 restores `avma`. A `Gen` argument is a persistent clone
        and is unaffected.
- [x] Agreement test: for every admitted argument type,
      `PARI.f(x) == PARI.f(pari(x))` with matching `gentype`, over a sample
      covering all four return conventions (`Gen`, scalar, void,
      `&`-tuple). (REQ-ARG-08)
- [x] No-method-explosion test: every callable binding in `LibPARI.PARI` has
      exactly **one** method, including those with combined G-arity 4.
      (REQ-ARG-09)
- [x] `@inferred` over scalar-argument calls for all four return conventions
      and each admitted argument type; `@code_warntype` shows no `Any` on a
      sampled binding per convention. (REQ-ARG-10)
- [x] Leak/allocation test: 10⁵ scalar-argument calls leave `get_avma()` at
      its pre-loop value and PARI's heap within the NFR-02 bound;
      `@allocated` on the scalar path is bounded and independent of the
      value's size. Record first-call latency as the compilation-overhead
      gate. (REQ-ARG-11)
- [x] Document in `docs/src/api.md` and the getting-started guide: the
      accepted union, what is **not** accepted (`Vector`, `AbstractString`),
      and that parameters stay `x1, x2, …` **because `pari.desc` has no
      argument-name field** — a limitation to document, not to paper over
      with invented names. (REQ-ARG-12)

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `nextprime(x1::LibPARI.Gen)` | `nextprime(x1::LibPARI.PariConvertible)` | Purely widening; every existing call still compiles. Breaks only code relying on a `MethodError`. |
| `alggroupcenter(x1::Gen; x2 = nothing)` (untyped keyword) | `x2::Union{Nothing,PariConvertible} = nothing` | An unsupported type now fails at dispatch instead of late with `type Int64 has no field ptr`. A shim would preserve the late failure — rejected. |
| scalar/void bindings with no `avma` capture | capture + restore | ~86 bindings; bounded by the REQ-ARG-07 deny-list. No shim: the old form leaks every converted temporary. |
| implicit rooting of `Gen` arguments | explicit `GC.@preserve` | No API change; closes a rare use-after-free window. |

**Exit criteria**

- `PARI.nextprime(1000)`, `PARI.factorial(100)` and `PARI.gmodulo(5, 7)`
  appear in a jldoctest and equal their `pari`-wrapped forms.
- Two generator runs yield byte-identical `src/bindings.jl` (NFR-04); the
  count is unchanged (NFR-01); `git diff --exit-code src/bindings.jl` is
  clean after regeneration.
- Every callable binding has exactly one method; `@inferred` is green for
  all four return conventions called with scalar arguments.
- 10⁵ scalar-argument calls leave `avma` unchanged and the heap within the
  NFR-02 bound.
- No hand edit to `src/bindings.jl`: every change in the generated file
  traces to a `gen/generate.jl` diff in the same commit.

**Open questions**

- Do any scalar/void G-taking bindings retain their GEN argument in PARI
  global state? This gates REQ-ARG-07 and is the milestone's main risk.
- Should `_argptr(::AbstractFloat)` honour the binding's `prec` keyword
  rather than a fixed precision? That is M13's policy to set.
- `AbstractVector`/`AbstractMatrix` in a `G` slot: deferred — `t_VEC` vs
  `t_COL` is genuinely ambiguous for a Julia `Vector` and should stay an
  explicit user choice (see M17).
- `AbstractString` in a `G` slot: **rejected** — it collides with the `s`/`r`
  prototype codes and makes `f("x")` ambiguous between a string value and a
  variable name.
- Should codes `L`/`U` (today `::Integer`) also accept a `Gen`? Symmetry
  says yes; a lossy `Gen`→`long` narrowing says no. Deferred past 1.0.0.

---

## M16 — Explicit GP evaluation sessions

**Goal:** make `gp_eval`'s hidden persistent state explicit, without
pretending to an isolation libpari may not provide.

**Depends on:** M11.

**Scope:** REQ-GPS-01 … REQ-GPS-08.

> **Authoring note.** The analysis pass for this milestone did not complete,
> so its deliverables are written from the source alone and the central
> facts are **not yet verified**. REQ-GPS-01 is deliberately an
> investigation: the design that follows it may have to change.

**Deliverables**

- [ ] **Investigate and write down** what GP state actually is here, before
      any API is designed: whether PARI's variable table and GP environment
      are process-global or part of a per-thread context; what
      `pari_thread_alloc` snapshots of the calling thread's state
      (`src/concurrency.jl:93-105`); and whether a variable assigned on one
      worker is visible from another. Record the answer in the milestone
      before proceeding. (REQ-GPS-01)
- [ ] `GPSession` type and `gp_eval(session, str)`, with the existing
      `gp_eval(str)` (`src/evaluator.jl:27`) retained as a documented
      **default session**. (REQ-GPS-02)
- [ ] `reset!(session)` clearing exactly what the session owns — with the
      cleared set *documented*, not implied. (REQ-GPS-03)
- [ ] An honest isolation statement in the docstring and in
      `docs/src/api.md`: if independent GP environments are not feasible
      with libpari as embedded, say so and implement the safest honest
      abstraction (for example a session owning a named variable list it can
      kill) instead of pretending. (REQ-GPS-04)
- [ ] Documented thread/task behaviour, consistent with the finding of
      REQ-GPS-01 and with the sticky per-thread worker model. (REQ-GPS-05)
- [ ] `PariError` behaviour is unchanged: a syntax or runtime error inside a
      session stays catchable and leaves both the session and the library
      usable. (REQ-GPS-06)
- [ ] Tests: assignment persists **within** a session; state does **not**
      leak between sessions (or the documented leakage is asserted
      explicitly, if isolation proves infeasible); `reset!` does what it
      claims; concurrent sessions behave as documented. (REQ-GPS-07)
- [ ] `gp_eval` stays documented as the escape hatch for GP-closure-argument
      functions — never as the primary API. (REQ-GPS-08)

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `gp_eval(str)` mutates one hidden global GP environment | same call, now documented as *the default session* | Source-compatible. The break is in the documented contract, not the signature. |

**Exit criteria**

- REQ-GPS-01's finding is written into the milestone and into
  `docs/src/api.md`, with the test that demonstrates it.
- Persistence, isolation (or documented non-isolation), reset and
  concurrency each have a passing `@testitem`.
- No test asserts an isolation property the implementation does not
  actually provide.

**Open questions**

- Are truly independent GP environments reachable at all through libpari as
  embedded here? If not, is a variable-namespacing session an honest
  abstraction or a misleading one?
- Does a session belong to a task, a thread, or the process?
- Should `reset!` also reset PARI's global precision and variable
  priorities, or only user variables?

---

## M17 — Structured PARI objects

**Goal:** idiomatic Julia access to PARI's container types, dispatching on
`gentype`, without claiming a static array interface a runtime-tagged value
cannot honour.

**Depends on:** M11.

**Scope:** REQ-IDX-01 … REQ-IDX-09.

> **Investigation done (REQ-IDX-01).** Verified before any accessor was
> written: a `t_MAT` is a list of COLUMNS (`glength` counts columns,
> component `j` is the `j`-th column as a `t_COL`, and GP's `matsize` gives
> `[rows, cols]`); and reading a component through PARI's `compo` returns an
> **owned** value, because the generated binding wraps it in `gen_from`,
> which `gclone`s. Element access therefore clones, and an element outlives
> its parent — verified by dropping the parent and forcing GC. No manual
> re-cloning is needed and no pointer is exposed.

**Deliverables**

- [ ] **Verify and document the layout and ownership rules** before writing
      any accessor: how a component is read from a `GEN`, and the fact that
      a component pointer points *into* the parent's cloned block — so an
      element must be re-cloned through `gen_from` to own its memory.
      (REQ-IDX-01)
- [x] `length`, `size`, `axes`, `getindex(x, i)`, `getindex(x, i, j)`,
      `iterate`, `eltype`, `collect`, `Vector{Gen}(x)`, `Matrix{Gen}(x)` —
      each defined only for the PARI types where it is meaningful.
      (REQ-IDX-02)
- [ ] Coverage: `T_VEC`, `T_COL`, `T_VECSMALL`, `T_MAT`; `T_LIST` only if
      its semantics prove stable enough — otherwise excluded, with the
      reason recorded. (REQ-IDX-03)
- [x] One-based Julia indexing throughout, with a `BoundsError` outside the
      range, and a clear error — naming the PARI type — for indexing a
      `Gen` that is not a container. (REQ-IDX-04)
- [x] `size` for `T_MAT` agrees with Julia conventions; PARI's `t_MAT` is a
      column-major list of columns, so the mapping is spelled out and
      tested, not assumed. (REQ-IDX-05)
- [x] No pointer and no transient stack memory is exposed; every returned
      element is a fully owned `Gen`. Document explicitly **that element
      access clones**. (REQ-IDX-06)
- [x] Iteration leaks no PARI heap objects; allocation and leak tests match
      the NFR-02/NFR-03 style already used in
      `test/acceptance_tests.jl`. (REQ-IDX-07)
- [x] `Gen` does **not** subtype `AbstractArray`; the relevant Base methods
      are implemented directly. An explicit wrapper type is introduced only
      if a concrete need appears. (REQ-IDX-08)
- [x] `eltype` and the `collect`/`Vector{Gen}` conversions are type-stable
      and `@inferred`-clean. (REQ-IDX-09)

**Breaking changes**

None expected: these are new methods on a type that currently has none of
them. Any that turn out to be breaking are recorded when they appear.

**Exit criteria**

- Indexing, iteration and conversion work for `T_VEC`, `T_COL`,
  `T_VECSMALL` and `T_MAT`, with one-based semantics and Julia-conventional
  `size`.
- Indexing a non-container `Gen` raises a clear, typed error naming the
  PARI type.
- The allocation and leak tests pass, and `collect`/`Vector{Gen}` are
  `@inferred`-clean.
- The docstrings state whether element access clones — and the answer is
  tested.

**Open questions**

- Is `T_LIST` stable enough to expose, given it is mutable in PARI?
- Should `getindex` on a `T_MAT` return a column (PARI's own semantics) or
  an element? Julia convention argues for the element and `x[:, j]` for the
  column.
- Does `Base.iterate` on a large vector need a chunked strategy to avoid
  one clone per element?

---

## M18 — Display contract

**Goal:** separate a `repr` useful for Julia debugging from a pleasant
PARI-notation REPL rendering, and keep display cheap.

**Depends on:** M11.

**Scope:** REQ-SHOW-01 … REQ-SHOW-06.

> **Authoring note.** Same caveat as M16/M17.

**Deliverables**

- [ ] `show(io, g)` becomes a compact representation that makes clear the
      value is a LibPARI object; `show(io, ::MIME"text/plain", g)` keeps the
      PARI notation for the REPL; `print(io, g)` stays PARI's own text.
      (REQ-SHOW-01)
      - Today `show` and `print` are the same call
        (`src/conversions.jl:252-255`), so `repr(g)` is bare PARI text —
        indistinguishable from the content of a `String`.
- [ ] A `t_STR` must not be confusable with a Julia `String` in `repr`.
      (REQ-SHOW-02)
- [ ] Display must not become unexpectedly expensive: `_genrepr` calls
      `GENtostr` through `protected_call` on the PARI worker, so every
      rendering is real PARI work plus a task hop. Decide and document a
      truncation policy for very large values. (REQ-SHOW-03)
- [ ] Tests for integers, rationals, polynomials, vectors, matrices and
      strings. (REQ-SHOW-04)
- [ ] Tests for nested display — a vector of vectors, and a `Gen` inside a
      Julia `Array`, which uses `show`, not `text/plain`. (REQ-SHOW-05)
- [ ] The doctests in the existing docstrings and guides are updated to the
      new output, and the docs still build with zero warnings
      (REQ-DOC-05). (REQ-SHOW-06)

**Breaking changes**

| Before | After | Shim |
|--------|-------|------|
| `repr(g)` is bare PARI text | a compact, self-identifying representation | Any test or doctest comparing `repr`/`string` output changes. `print`/`string` keep PARI's text, so string interpolation is unaffected. |

**Exit criteria**

- `repr(g)` identifies the value as a LibPARI object; `print(io, g)` is
  unchanged; the REPL rendering stays close to PARI notation.
- A `Gen` wrapping a `t_STR` is visually distinguishable from a Julia
  `String`.
- Displaying a large value does not perform unbounded work; the policy is
  documented and tested.
- Every doctest in the repository passes with the new output.

**Open questions**

- Should the compact form show the PARI type tag (e.g. `Gen(t_MAT, …)`) or
  a truncated value?
- Is a truncation threshold needed, and if so, does it belong to `show`
  only or to `text/plain` as well?

---

## Interoperability bridges — M19 and M20

Two conversion bridges to other Julia computer-algebra ecosystems, **in
scope for 1.0**. Each depends on contracts M11-M18 freeze, so they are
sequenced last before the release milestone.

Both ship as **package extensions** (`[weakdeps]` + `[extensions]`), the
pattern already used for the MCP connector (`ext/LibPARIMCPExt.jl`,
0.12.0): installing LibPARI must not install Symbolics or Giac, and a
process that does not load them must pay nothing — no dependency, no code,
no precompilation. That is what makes them affordable before 1.0: they add
surface to the *extensions*, not to the core the release freezes.

**Depends on:** M11 (a `Gen` that does not lie about being a `Number`),
M13 (a documented precision policy for `t_REAL`), M14 (`pari(x)` as the
single inward entry point), M17 (indexing, needed for `t_VEC`/`t_MAT`).

The two are **not** symmetric in where they live: M19 must be hosted here,
M20 probably should not. See *Which package owns which bridge* under M20.

---

## M19 — Symbolics.jl bridge

**Goal:** convert between PARI objects and Symbolics.jl expressions over a
documented, tested subset — `to_symbolics(g)` outward, `pari(x)` inward —
without a hard dependency and without pretending to a fidelity the two
representations do not share.

**Depends on:** M11, M13, M14, M17 (all of Part II in practice).

**Scope:** REQ-SYM-01 … REQ-SYM-10.

**Deliverables**

- [ ] **Investigate and write down the mapping table first**, before any
      code: which PARI type tag maps to which Symbolics/SymbolicUtils node,
      and — the hard direction — which Symbolics expressions have **no**
      PARI counterpart. Publish it as a table in the docs; it is the
      contract. (REQ-SYM-01)
- [ ] `ext/LibPARISymbolicsExt.jl` as a weakdep extension; `Project.toml`
      gains `Symbolics` under `[weakdeps]`/`[extensions]` only. A test
      asserts that loading LibPARI alone pulls in neither the package nor
      its load time. (REQ-SYM-02)
- [ ] Inward conversion: extend M14's `pari(x)` with methods for
      `Num`/`BasicSymbolic`, so there is **one** inward entry point for
      every foreign type. (REQ-SYM-03)
      - See the open question on `to_pari`: a separate inward name is
        proposed by the request, but a second entry point that does the
        same job as `pari(x)` is a contract to maintain twice.
- [ ] Outward conversion `to_symbolics(g::Gen)`, defined as a LibPARI
      generic with its methods supplied by the extension. (REQ-SYM-04)
- [ ] **Variable identity** — the central difficulty, and the deliverable
      most likely to reshape this milestone: a PARI `t_POL` carries a
      variable *number* with a priority ordering, while a Symbolics variable
      is a named symbol. Define and test the name↔number mapping,
      round-trip preservation of names, and what happens on a collision or
      on PARI's variable-priority reordering. (REQ-SYM-05)
- [ ] Documented supported subset — at minimum `t_INT`, `t_FRAC`, `t_REAL`,
      `t_COMPLEX`, `t_POL`, `t_RFRAC`, and (via M17) `t_VEC`/`t_COL`/
      `t_MAT`. Everything outside it raises a clear error naming the PARI
      type; `t_SER`, `t_PADIC`, `t_INTMOD`, `t_FFELT` and `t_CLOSURE` are
      explicitly out unless a deliverable adds them. (REQ-SYM-06)
- [ ] Exactness and precision policy: what a `t_REAL` becomes on the
      Symbolics side, and what a Julia `Float64`/`BigFloat` literal becomes
      as a `Gen`, consistent with M13. Any unavoidable rounding is
      documented. (REQ-SYM-07)
- [ ] Round-trip tests in **both** directions over a fixed corpus, plus a
      property test on randomly generated polynomials asserting
      `pari(to_symbolics(g))` equals `g` on the supported subset — and an
      explicit list of the cases where it deliberately does not.
      (REQ-SYM-08)
- [ ] No type piracy: every method has a LibPARI type in its signature, or
      is a method on a Symbolics function that LibPARI's extension legally
      owns. Aqua stays green. (REQ-SYM-09)
- [ ] A CI job loading Symbolics, kept separate from the main matrix
      because of its compile cost, plus a docs page with runnable examples.
      (REQ-SYM-10)

**Exit criteria**

- The mapping table is published, and every row is exercised by a test.
- `Pkg.add("LibPARI")` installs neither Symbolics nor its dependency tree;
  a session that never loads Symbolics shows no extension code loaded.
- Round-trip holds over the corpus and the property test; every documented
  exception is itself tested.
- Variable names survive a `Gen → Symbolics → Gen` round trip, or the
  documented loss is asserted by a test.
- Aqua reports no piracy and no ambiguity.

**Open questions**

- `to_pari` vs `pari(x)`: the request names `to_pari`/`to_symbolics` as a
  symmetric pair. But M14 makes `pari(x)` **the** inward entry point, and
  two names for one job is two contracts to keep. Recommendation: extend
  `pari(x)` inward, keep `to_symbolics` outward, and — if symmetry is
  wanted — ship `to_pari` as a documented one-line alias rather than a
  second implementation. Decide before REQ-SYM-03.
- Does the bridge convert **structurally** (walking the `GEN`) or through a
  **string** round trip? Structural is the only honest answer for anything
  that must preserve exactness and variable identity; a string path is
  simpler but goes through two parsers and quietly loses precision and
  variable priority. Structural is the working assumption.
- What is the natural Symbolics counterpart of a `t_FRAC` — a `Rational`
  literal, or a division node? They differ under simplification.
- Should `t_INTMOD`/`t_FFELT` map onto anything at all, or stay refused?

---

## M20 — Giac.jl bridge

**Goal:** the same bridge against Giac, over whatever exchange the Julia
Giac interface actually offers.

**Depends on:** M19 (which establishes the bridge pattern, the mapping-table
discipline and the extension layout).

**Scope:** REQ-GIAC-01 … REQ-GIAC-08.

> **Authoring note.** This milestone's design is **not yet decidable**. It
> depends entirely on what the Julia Giac package exposes — a native value
> type, or a string-level interface to the CAS. REQ-GIAC-01 exists to settle
> that before anything else is written.

**Deliverables**

- [ ] **Establish the target first:** which Julia Giac package (name,
      registry status, maintenance, value type, API surface), and whether it
      exposes a structured value or only strings. The answer decides the
      whole milestone; record it in the roadmap before proceeding.
      (REQ-GIAC-01)
- [ ] **Decide which side hosts the bridge** — see *Which package owns
      which bridge* below — and record the decision with its reason before
      writing the extension. Either way it is a weakdep extension with no
      hard dependency and no cost when unloaded: `ext/LibPARIGiacExt.jl`
      here, or `ext/GiacLibPARIExt.jl` in Giac.jl. (REQ-GIAC-02)
- [ ] Inward conversion through `pari(x)` and outward `to_giac(g::Gen)`,
      mirroring M19's naming decision exactly — the two bridges must not
      diverge in spelling. (REQ-GIAC-03)
- [ ] A published mapping table with the same discipline as REQ-SYM-01,
      including what Giac has that PARI does not and vice versa.
      (REQ-GIAC-04)
- [ ] If — and only if — the exchange proves to be **string-based**,
      document that plainly as a limitation, pin the exact notation used in
      each direction, and test the fragile cases explicitly: the imaginary
      unit (`I` vs `i`), variable names, precedence and parenthesisation,
      floating-point literal precision, and matrix/vector bracket syntax.
      (REQ-GIAC-05)
- [ ] Round-trip tests in both directions over a fixed corpus, with the
      lossy cases enumerated rather than hidden. (REQ-GIAC-06)
- [ ] No piracy; Aqua green; a separate CI job that loads Giac.
      (REQ-GIAC-07)
- [ ] A docs page with runnable examples, and an honest statement of which
      of the three systems owns which semantics when they disagree.
      (REQ-GIAC-08)

**Exit criteria**

- REQ-GIAC-01's finding is written down, with the design it implies.
- The extension is optional and costs nothing when unloaded.
- Round-trip holds over the corpus; every lossy case is documented **and**
  tested.
- Naming is identical to M19's — one convention across both bridges.

**Open questions**

- Which Julia Giac package, and is it registered and maintained? Without a
  stable target this milestone should not start.
- Is a PARI↔Giac bridge better served *directly*, or through a common
  neutral representation — plausibly Symbolics, once M19 exists? A direct
  bridge is faster and loses less; a hub avoids writing N² bridges. With
  two systems, direct is the working assumption.
- If Giac.jl hosts the bridge, LibPARI still owns the `pari` generic and
  the mapping table. Does the table live here (and the code there), or does
  the whole thing move? Proposed: the *rules* stay documented here, next to
  M19's, so the two bridges cannot drift apart.

### Which package owns which bridge

Technically either side works: an extension can be declared by either
package, and neither direction is type piracy — LibPARI owns `pari`, so
`pari(::GiacExpr)` written in Giac.jl is legal; Giac.jl owns `to_giac`, so
`to_giac(::Gen)` written here is legal. The decision is therefore about
**maintenance direction**, not legality, and it resolves differently for
the two bridges:

- **M19 (Symbolics) must live in LibPARI.** Symbolics.jl is a large
  third-party package that will not take a weak dependency on LibPARI. You
  host the bridges to packages that will not host them for you.
- **M20 (Giac) should live in Giac.jl**, if that package is under the same
  maintainer. LibPARI is heading for a frozen 1.0; hosting the bridge here
  ties that release to a foreign API's breaking changes, and a break in
  Giac.jl would redden LibPARI's CI at the worst moment. The dependency
  should point from the faster-moving package to the frozen one, not the
  reverse.

The reasons to override that and host it here anyway: LibPARI is where the
structural knowledge of a `GEN` lives (type tags, variable priorities,
`t_REAL` precision), so a *structural* bridge is easier to write here; and
one home for both bridges keeps the naming and the mapping-table discipline
from diverging. If the exchange turns out to be string-based (REQ-GIAC-01),
that argument weakens considerably — a string bridge needs Giac's parser
quirks more than PARI's internals.

A third option, a separate glue package depending on both, is the right
answer only if a third system appears: it costs discoverability and another
registration, and buys isolation neither package needs at two systems.

---

## M21 — Documentation, migration & the 1.0.0 release

**Goal:** ship the redesign as a documented, migratable 1.0.0.

**Depends on:** M11 … M20.

**Scope:** REQ-REL-01 … REQ-REL-08.

**Deliverables**

- [ ] `docs/src/api-redesign.md` — the issue-style plan: current API
      problems, proposed contracts, breaking changes, migration examples,
      implementation phases, unresolved design questions. (REQ-REL-01)
- [ ] `docs/src/migration.md` — a before/after example for **every**
      breaking change listed in M11–M18. (REQ-REL-02)
- [ ] The getting-started guide is rewritten around `pari(x)` and gains the
      **three levels of access** section — idiomatic Julia operations; the
      comprehensive `PARI` bindings; dynamic GP through `gp_eval` — stating
      which layer is promised stable at 1.0. (REQ-REL-03)
- [ ] README, API reference, docstrings and examples updated; no surviving
      claim that `Gen` is a drop-in Julia number. (REQ-REL-04)
- [ ] A detailed CHANGELOG entry per release 0.16.0 … 1.0.0, each listing
      its breaking changes with before/after. (REQ-REL-05)
- [ ] The full test list required by the redesign is green: lifecycle,
      memory safety, stack restoration, error trapping, generator
      reproducibility and count, inference, thread safety, scalar
      round-trips, high-precision `BigFloat`, mixed arithmetic, supported
      *and unsupported* promotion, direct Julia arguments to bindings,
      `pari(x)`, precision scopes, GP sessions, structured indexing and
      iteration, display, both bridge extensions with their round-trips,
      and the migration examples themselves. (REQ-REL-06)
- [ ] No existing performance, allocation, leak or reproducibility test has
      been weakened to make the redesign pass; every test replaced because
      it encoded a withdrawn contract is replaced by a **stronger** test,
      and the substitution is explained in the CHANGELOG. (REQ-REL-07)
- [ ] Version 1.0.0 tagged and registered; the stability promise of each
      layer is stated in the README. (REQ-REL-08)

**Exit criteria**

- CI green on the 3-OS × 2-Julia matrix; docs deploy with zero warnings.
- Every breaking change in Part II appears in the migration guide with a
  runnable before/after.
- `Pkg.add("LibPARI")` at 1.0.0 installs and the getting-started examples
  run verbatim.

**Open questions**

- Does 1.0.0 freeze the generated layer's signatures too, or only the
  hand-written core? The generated layer changes whenever PARI's
  `pari.desc` changes, which argues for promising stability only on the
  hand-written surface plus the *shape* of the generated one.

---

## Cross-cutting workstreams

These advance continuously inside each milestone, not as separate phases.

| Workstream            | Requirements                | Practice                                              |
|-----------------------|-----------------------------|-------------------------------------------------------|
| Testing               | REQ-QA-01, REQ-QA-02        | `@testitem` blocks; tests written first (TDD); package-quality tests under `test/package/`. |
| Package quality       | REQ-QA-03                   | Aqua.jl suite kept green from M0 onward.              |
| Formatting & hooks    | REQ-QA-04, REQ-QA-05, REQ-QA-06 | JuliaFormatter (80-col) + pre-commit on every commit. |
| Changelog & SemVer    | REQ-PKG-03, REQ-PKG-04      | "Keep a Changelog" entry per notable change; SemVer tags. |
| Documentation         | REQ-DOC-02, REQ-DOC-03      | Docstrings authored alongside each new public symbol. |

## Traceability

Every SRS requirement, mapped to its delivering milestone. Part II
introduces its own families; they are not in `spec-ears.md`.

| Area                              | Requirement IDs            | Milestone |
|-----------------------------------|----------------------------|-----------|
| Library lifecycle                 | REQ-INI-01 … REQ-INI-07    | M1        |
| Binding generation                | REQ-GEN-01 … REQ-GEN-10    | M4        |
| `Gen` and memory                  | REQ-MEM-01 … REQ-MEM-08    | M2        |
| Function invocation               | REQ-CALL-01 … REQ-CALL-04  | M4        |
| Type conversions                  | REQ-CONV-01 … REQ-CONV-04  | M5        |
| Error handling                    | REQ-ERR-01 … REQ-ERR-04    | M3        |
| GP evaluator                      | REQ-GP-01 … REQ-GP-02      | M7        |
| Idiomatic API                     | REQ-API-01 … REQ-API-05    | M6        |
| Platform / concurrency            | REQ-PLT-02                 | M0        |
| Platform / concurrency            | REQ-PLT-01, REQ-PLT-03     | M9        |
| Type stability / precompilation   | REQ-PERF-01 … REQ-PERF-03  | M8        |
| Testing and code quality          | REQ-QA-01 … REQ-QA-06      | M0 (cross-cutting) |
| Testing and code quality          | REQ-QA-07, REQ-QA-08       | M10       |
| Documentation                     | REQ-DOC-01 … REQ-DOC-06    | M10       |
| Packaging and release             | REQ-PKG-01 … REQ-PKG-05    | M0        |
| Non-functional                    | NFR-01 … NFR-04            | M10 (acceptance) |
| Non-functional — NFR-01 restated   | `≥ 1190`, was `≥ 1200`     | M13 (REQ-PREC-13) |
| **Part II** — `Gen` type contract | REQ-TYPE-01 … REQ-TYPE-13  | M11       |
| Conversion & promotion            | REQ-PROM-01 … REQ-PROM-11  | M12       |
| Precision                         | REQ-PREC-01 … REQ-PREC-13  | M13       |
| Public surface & facade           | REQ-PUB-01 … REQ-PUB-13    | M14       |
| Generated-binding arguments       | REQ-ARG-01 … REQ-ARG-12    | M15       |
| GP sessions                       | REQ-GPS-01 … REQ-GPS-08    | M16       |
| Structured objects                | REQ-IDX-01 … REQ-IDX-09    | M17       |
| Display                           | REQ-SHOW-01 … REQ-SHOW-06  | M18       |
| Symbolics.jl bridge               | REQ-SYM-01 … REQ-SYM-10    | M19       |
| Giac.jl bridge                    | REQ-GIAC-01 … REQ-GIAC-08  | M20       |
| Release, docs & migration         | REQ-REL-01 … REQ-REL-08    | M21       |

**Superseded.** REQ-API-01 (`Gen <: Number`, delivered in M6/0.7.0 and
extended in 0.14.0) is withdrawn by REQ-TYPE-01 in M11. The 0.7.0 and
0.14.0 CHANGELOG entries stand as historical record; the 0.16.0 entry
records the supersession.

## Out of scope for Part I (0.11.0) — historical

Carried from SRS §8.2 — explicitly *not* on the M0–M10 plan:

- [ ] Native Julia closures for PARI functions taking GP-closure arguments
      (`E`/`I`/`V`/`C`) — still reachable only via the GP evaluator (M7).
- [ ] The interactive `gp` REPL.
- [ ] The MPI (`--mt=mpi`) parallel engine; only `pthread` is assumed.
- [ ] PARI optional data packages (`elldata`, `galdata`, `seadata`,
      `galpol`, `nflistdata`).
- [x] Per-thread PARI stack contexts; 0.11.0 serialized calls
      (REQ-PLT-03). **Delivered after the roadmap, in `0.12.0`–`0.13.0`.**

## Out of scope for 1.0.0

Carried into Part II — explicitly *not* on the path to 1.0:

- [ ] Native Julia callback support for GP-closure-argument functions.
- [ ] Optional data-package integration.
- [ ] The interactive `gp` REPL; the MPI parallel engine.
- [ ] A `PariNumber <: Number` wrapper — discussed in M11, scheduled only
      behind a tested consumer.
- [ ] `Gen <: AbstractArray` for container types — rejected in M17: a
      runtime-tagged value cannot honestly promise a static array
      interface.
- [ ] Accepting `AbstractVector`/`AbstractMatrix` in a generated binding's
      `G` slot — deferred in M15 (`t_VEC` vs `t_COL` is ambiguous).
- [ ] Idiomatic aliases for the ~1200 remaining generated functions; M14
      ships a deliberately small facade instead.

## Delivered beyond Part I (0.12.0 – 0.15.1)

Work shipped after M10, not part of the M0–M10 plan:

- [x] `0.12.0` — optional **MCP connector** as a package extension
      (`ext/LibPARIMCPExt.jl`, `serve_mcp`, `docs/src/mcp.md`).
- [x] `0.13.0` — **parallel `libpari` calls** and concurrency-safe error
      handling (see above).
- [x] `0.14.0` — a **complete Julia `Number` interface** for `Gen`:
      ordering, `hash`, identities, predicates, and conversions to/from
      `Float64`, `BigFloat`, `Rational`, and `Complex`.
      - **Partly withdrawn by M11.** `Gen <: Number` is the contract Part II
        removes; the operations themselves are kept and re-implemented as
        explicit methods. The entry's "drop-in Julia number" claim does not
        survive 0.16.0.
- [x] `0.15.0` — **General registry release**: `PARI_jll` registered, so
      `Pkg.add("LibPARI")` works; CI `test` and `Documentation` jobs
      became hard gates.
- [x] `0.15.1` — cold-runner fix for the three generator subprocess test
      items; TagBot and CompatHelper workflows added.
