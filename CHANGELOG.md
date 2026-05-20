# Changelog

All notable changes to LibPARI are documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.10.0] - 2026-05-20

Milestone **M9 — Platform & concurrency hardening**. LibPARI is now safe to
use from multi-threaded Julia.

### Added

- A dedicated **PARI worker task** that owns the library: every `libpari`
  call is marshalled onto one sticky worker task and executed there. PARI's
  working state (`avma`, the stack, the recursion-depth base) is
  thread-local, so confining all `libpari` work to the single task that
  initialized PARI makes concurrent use from any number of Julia threads
  correct — no data race, no PARI stack corruption (REQ-PLT-03). `Gen`
  results stay type-stable across the marshalling boundary, and `Gen`
  finalization is marshalled to the worker too.
- `test/concurrency_tests.jl` — a multi-threaded stress test, run as its own
  step: `julia --project=. --threads=auto test/concurrency_tests.jl`.

### Changed

- LibPARI's hand-written code is confirmed free of platform-specific
  assumptions, so it is correct on every platform `PARI_jll` provides an
  artifact for (REQ-PLT-01).

### Known limitations

- The `@testitem` test suite runs **single-threaded**. This is no longer a
  PARI limitation — LibPARI's `libpari` calls are thread-safe — but a
  separate one: the TestItemRunner harness on Julia 1.12 crashes under the
  multi-threaded concurrent compilation of the suite. M9's multi-threaded
  correctness is instead verified by the dedicated
  `test/concurrency_tests.jl` stress test, run as its own `--threads=auto`
  step.
- With the suite now reliably green, the `v0.2.0`–`v0.10.0` release tags
  (deferred since M1) become createable; tagging is part of the M10 release.

## [0.9.0] - 2026-05-20

Milestone **M8 — Type stability & precompilation**. SciML-grade inference and
a fast first call. M8 adds no new user-facing API — it hardens M0–M7.

### Added

- A type-stability audit — `test/inference_tests.jl` — with `@inferred`
  checks over a representative generated binding of each return convention
  and over every hand-written public function (the conversions, the
  arithmetic operators and `==`, `gp_eval`, the lifecycle/introspection
  API). The whole audited surface infers a concrete return type, never
  `Any` (REQ-PERF-01, REQ-PERF-03).
- A `PrecompileTools.jl` precompilation workload (`src/precompile.jl`) that
  exercises a representative subset of the API while the package
  precompiles, so the first call in a fresh session is fast (REQ-PERF-02).
- `PrecompileTools` added as a package dependency.

### Known limitations

- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.9.0` tag is
  deferred (with `v0.2.0`–`v0.8.0`) until the suite is reliably green.

## [0.8.0] - 2026-05-20

Milestone **M7 — GP expression evaluator**. An escape hatch: evaluate an
arbitrary GP-language expression string and get a `Gen` back.

### Added

- `gp_eval(s::AbstractString)` — evaluate a GP-language expression string
  with PARI's GP engine, returning the result as a `Gen` (REQ-GP-01). It
  reaches every PARI capability, including the GP-closure-argument functions
  (`sum`, `prod`, `intnum`, …) that the generated bindings do not expose.
  GP variable assignments persist across `gp_eval` calls — one shared GP
  environment.
- A syntactically invalid GP string raises a catchable `PariError` with
  category `e_SYNTAX` describing the parse error; a runtime failure during
  evaluation raises a `PariError` too (REQ-GP-02). The library stays usable
  after a failed evaluation.

### Known limitations

- `gp_eval` is a developer escape hatch — it runs whatever GP code it is
  given; it is not sandboxed.
- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.8.0` tag is
  deferred (with `v0.2.0`–`v0.7.0`) until the suite is reliably green.

## [0.7.0] - 2026-05-20

Milestone **M6 — Idiomatic numeric API**. `Gen` is now a first-class Julia
number: it computes with ordinary operators, mixes with Julia numbers, and
compares with `==`.

### Added

- `Gen <: Number` — `Gen` is a subtype of Julia's `Number`.
- Arithmetic operators `+`, `-`, `*`, `/`, `^` and unary `-` on `Gen`
  operands, each computing the PARI result
  (`gadd`/`gsub`/`gmul`/`gdiv`/`gpowgs`/`gpow`/`gneg`) and returning a
  `Gen`. `/` is PARI's exact division — a rational result when the operands
  do not divide evenly.
- Mixed `Gen` / Julia-number arithmetic: the Julia operand is promoted to a
  `Gen`, in either operand order, via `promote_rule` and `convert`.
- Floating-point → `Gen` and rational → `Gen` construction — extending M5's
  integer-only conversions — so promotion covers every Julia `Number`.
- `==` on `Gen` values returns PARI's mathematical-equality result
  (`gequal`); mixed `Gen`/number `==` works through promotion.

### Known limitations

- M6 delivers the operators of REQ-API-02 and the equality of REQ-API-04;
  ordering comparisons (`<`, `<=`), integer-division operators, and a
  consistent `hash` for `Gen` are not included.
- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.7.0` tag is
  deferred (with `v0.2.0`–`v0.6.0`) until the suite is reliably green.

## [0.6.0] - 2026-05-20

Milestone **M5 — Type conversions**. Julia integers and PARI `Gen` values now
convert into and out of each other, every `Gen` renders as text, and a
conversion that cannot be exact fails loudly.

### Added

- `Gen(x::Integer)` and `convert(Gen, x)` — convert a Julia integer of any
  magnitude to an integer-valued `Gen` (`stoi`/`utoi` for the machine-word
  range, `strtoi` over a decimal string for arbitrary magnitude)
  (REQ-CONV-01).
- `BigInt(g::Gen)` — convert an integer-valued `Gen` to an exact Julia
  `BigInt`, for integers of unbounded size (REQ-CONV-02).
- `T(g::Gen)` and `convert(T, g)` for `T <: Integer` — convert a `Gen` to a
  fixed-width Julia integer type.
- Textual representation: `show`, `print`, `string`, and string interpolation
  render any `Gen` exactly as PARI's own `GENtostr` does (REQ-CONV-03).
- Lossy `Gen → Julia` integer conversion raises Julia's standard
  `InexactError` — a non-integral value, or an integer outside a fixed-width
  type's range, is rejected rather than silently truncated (REQ-CONV-04).

### Known limitations

- M5's value conversions are **integer-only**; rational and floating-point
  conversion is deferred to a later milestone. The textual representation
  covers every `Gen` regardless.
- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.6.0` tag is
  deferred (with `v0.2.0`–`v0.5.0`) until the suite is reliably green.

## [0.5.0] - 2026-05-20

Milestone **M4 — Binding generator & function invocation**. PARI's function
database is turned into a callable binding layer — the `LibPARI.PARI`
submodule now exposes the bulk of PARI's library functions.

### Added

- `LibPARI.PARI` — an auto-generated submodule of 1241 bindings, one per
  eligible PARI library function. Each binding `ccall`s the `libpari` C
  symbol through M3's `protected_call` over M2's `gen_from`, returns a `Gen`
  (or the matching scalar / `nothing`), and carries the function's
  `pari.desc` help text as its docstring (FR-003/004/005/010).
- A development-time binding generator (`gen/generate.jl`, run in its own
  `gen/` environment) that reads PARI's machine-readable `pari.desc` from the
  `PARI_jll` artifact and writes `src/bindings.jl`. The output is a single
  committed, header-marked, JuliaFormatter-conformant file; two runs on the
  same PARI version are byte-identical (FR-001/002/006/007/008/009).
- Calling conventions on the generated bindings: a precision-taking function
  auto-supplies the working precision and accepts a `prec` (`bitprec` /
  `seriesprec`) keyword override; optional arguments are exposed as keyword
  arguments carrying the defaults declared in `pari.desc`; output (`&`)
  arguments are returned with the primary result as a tuple
  (REQ-CALL-01/02/03).
- Robust generation: records with no C entry point are omitted, GP-closure
  -argument functions are excluded, and unrecognized prototypes are skipped
  — each reported in a diagnostic. The generator never emits a broken
  binding or fails silently (FR-014/015/016).

### Known limitations

- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.5.0` tag is
  deferred (with `v0.2.0`–`v0.4.0`) until the suite is reliably green.

## [0.4.0] - 2026-05-20

Milestone **M3 — Error handling & the C-call boundary**. PARI errors are
trapped at the Julia/C boundary and surfaced as catchable Julia exceptions.
No PARI computational functions are exposed yet.

### Added

- `PariError <: Exception` — the catchable Julia exception raised when a
  `libpari` call signals a PARI error; carries PARI's message text and an
  error category (REQ-ERR-01).
- Module-scoped `LibPARI.PariErr` enum of PARI's error categories
  (`e_SYNTAX` … `e_NONE`, PARI's `numerr_t`) (REQ-ERR-04).
- `protected_call` — runs `libpari` work inside the error-trapping boundary:
  a PARI `longjmp` is trapped (via the `cb_pari_err_recover` callback) and
  cannot escape the Julia/C boundary; on error the PARI stack is restored to
  a consistent state so the library stays usable (REQ-ERR-02, REQ-ERR-03).
  This is the boundary the M4 binding generator will route every call
  through.

### Known limitations

- Carried from M1/M2: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local.
  Thread serialization is milestone M9 (REQ-PLT-03). The `v0.4.0` tag is
  deferred (with `v0.2.0`/`v0.3.0`) until the suite is reliably green.

## [0.3.0] - 2026-05-20

Milestone **M2 — `Gen` value type & memory management**. Introduces the
concrete Julia type wrapping a PARI object, with leak-free stack discipline.
No Julia↔`Gen` conversions or PARI computational functions yet.

### Added

- `Gen` — a concrete `mutable struct` wrapping a PARI object. Each `Gen` owns
  a clone of its object in PARI's persistent storage; a GC finalizer frees
  that clone exactly once, idempotently (REQ-MEM-01/02/03/04/06).
- `gen_from` — the capture-`avma` → produce → `gclone` → restore-`avma`
  discipline that keeps PARI's transient stack leak-free (REQ-MEM-05); the
  pattern the M4 binding generator will reuse.
- Module-scoped `LibPARI.PariType` enum of PARI's value types (`T_INT`,
  `T_REAL`, `T_POL`, `T_VEC`, …) and `gentype`, which reports a `Gen`'s PARI
  type (REQ-MEM-07/08).

### Known limitations

- Carried from M1: the test suite must run single-threaded
  (`Pkg.test(julia_args=`--threads=1`)`) — PARI's state is thread-local and
  `Gen` finalizers may run on any thread. Thread serialization is milestone
  M9 (REQ-PLT-03). The `v0.3.0` tag is deferred (with `v0.2.0`) until the
  suite is reliably green.

## [0.2.0] - 2026-05-20

Milestone **M1 — Library lifecycle**. PARI now initializes and shuts down
automatically; no PARI computational functions are exposed yet.

### Added

- Automatic PARI initialization: loading `LibPARI` initializes PARI exactly
  once, from the module `__init__`, never during precompilation
  (REQ-INI-01/02/03). Uses `pari_init_opts` with PARI's signal handlers and
  pthread engine disabled so they do not clobber the Julia runtime.
- `pari_close` registered with `atexit` so PARI's resources are released at
  normal process exit (REQ-INI-05).
- Module-scoped `LibPARI.LibraryState` enum (`UNINITIALIZED`, `INITIALIZED`,
  `CLOSED`) and the introspection API `is_initialized`, `library_state`, and
  `stack_size`.
- Configurable PARI main-stack size via the `LIBPARI_STACK_SIZE` environment
  variable (bytes), with an 8 MiB default (REQ-INI-04).
- Safe initialization failures: an invalid `LIBPARI_STACK_SIZE` raises a
  catchable Julia exception and leaves the library uninitialized
  (REQ-INI-06/07).
- `DocStringExtensions` dependency; the public lifecycle API carries
  DocStringExtensions docstrings with `jldoctest` examples.

### Known limitations

- The full `Pkg.test()` suite can intermittently crash with `SIGSEGV`:
  PARI's working state is thread-local and PARI is not yet safe to drive
  from a multi-threaded Julia process. Run tests single-threaded —
  `Pkg.test(julia_args=`--threads=1`)`. Proper call serialization is
  milestone M9 (REQ-PLT-03). The `v0.2.0` tag is deferred until the suite
  is reliably green.

## [0.1.0] - 2026-05-20

Milestone **M0 — Project scaffolding & packaging baseline**. A registrable,
CI-ready package skeleton with the quality gates wired in before any PARI
wrapper code exists. No PARI functionality is exposed yet.

### Added

- `Project.toml` with a UUID, `version = "0.1.0"`, and `[compat]` bounds on
  `PARI_jll` (`"2.17"`) and `julia` (`"1.10"`).
- `src/LibPARI.jl` module stub importing `PARI_jll` (no `pari_init` — PARI
  lifecycle begins in M1).
- TestItemRunner test harness (`test/runtests.jl`) with `test/package/`
  reserved for package-quality tests; smoke, Aqua, formatting, and metadata
  test items.
- `.JuliaFormatter.toml` with an 80-column margin.
- `.pre-commit-config.yaml` running file-hygiene hooks and JuliaFormatter.
- GitHub Actions CI workflow: a `format` hard gate, plus a `test` job and a
  docs job present as documented stubs.
- `upstream-bugs.md` log for bugs found in PARI / `PARI_jll` / Yggdrasil.
- `CHANGELOG.md` in "Keep a Changelog" format; Semantic Versioning adopted.

### Notes

- `PARI_jll` is not yet in the Julia General registry (Yggdrasil PR #13771);
  it is resolved from a local development build. Registering LibPARI is
  therefore deferred to a later milestone.

[Unreleased]: https://github.com/s-celles/LibPARI.jl/compare/v0.10.0...HEAD
[0.10.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.9.0...v0.10.0
[0.9.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.8.0...v0.9.0
[0.8.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/s-celles/LibPARI.jl/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/s-celles/LibPARI.jl/releases/tag/v0.1.0
