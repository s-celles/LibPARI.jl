# Changelog

All notable changes to LibPARI are documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project
adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- **TagBot workflow** (`.github/workflows/TagBot.yml`) to automatically
  create Git tags and GitHub releases when versions are merged into the
  Julia General registry.
- **CompatHelper workflow** (`.github/workflows/CompatHelper.yml`) to keep
  `[compat]` entries current via automated pull requests.

### Changed

- **BREAKING — `Gen` is a `PariObject`, not a Julia `Number`** (M11,
  REQ-TYPE-01, superseding REQ-API-01). One concrete `Gen` wraps *every*
  PARI object — matrices, strings and closures included — so the `Number`
  supertype was a false claim: `gp_eval("[1,2;3,4]") isa Number` answered
  `true`. The new `abstract type LibPARI.PariObject` names what a `Gen`
  actually is. No shim is possible — a type's supertype is fixed at
  definition — so code dispatching on `::Number` (LinearAlgebra methods
  bounded by `T<:Number`, `x isa Number` guards) no longer accepts a `Gen`.
- **Every mixed `Gen`/Julia-number operation is now an explicit method.**
  `+ - * / ^ \`, `==`, `<`, `<=` and `isless` are generated from one
  operator table over `(Gen, x)` and `(x, Gen)`, each building a `Gen` and
  calling the `Gen`/`Gen` operator, so behaviour is unchanged for the
  documented operand set — `Integer`, `AbstractFloat`, `Rational`,
  `Complex` (REQ-TYPE-02, REQ-TYPE-03, REQ-TYPE-04). `isless` is new: it
  previously existed only for `Gen`/`Gen`, so `sort(Any[Gen(2), 1])` raised
  a `MethodError`.
- **The `Number` conveniences are re-declared on `Gen`**: `broadcastable`
  (as `Ref`, keeping a `Gen` a broadcast scalar), unary `+`, `\`, `float`,
  `abs2`, `adjoint` and `transpose` (REQ-TYPE-05, REQ-TYPE-06). Anything
  not listed — `widen`, `signbit`, `divrem`, `fma`, `angle` and the other
  `Number` fallbacks — is a deliberate, documented loss. (`cmp` and
  `muladd` keep working: Base defines them generically, over `isless` and
  over `*`/`+`, not over `Number`.) `transpose`, `adjoint` and `\` are
  **corrected** rather than merely re-declared: the `Number` fallbacks were
  silently wrong for a `t_MAT`/`t_VEC`/`t_COL` — `transpose` returned the
  value unchanged, `adjoint` conjugated without transposing, and `a \ b`
  computed `b·a⁻¹`. Each now dispatches on the PARI type. `abs2` refuses a
  container instead of answering elementwise.
- **`promote_rule`/`convert` narrowed** from every `Number` to the same
  enumerated operand set. They no longer drive arithmetic (the table does);
  they remain so that `[Gen(1), 2]` types as a `Vector{Gen}`.

### Fixed

- **The JuliaFormatter version is pinned to one minor series** in
  `Project.toml`, `gen/Project.toml` and the CI `format` job, and
  `src/bindings.jl` is regenerated with it. `src/bindings.jl` is *written*
  by the `gen/` environment and *checked* by the root one; both declared
  `JuliaFormatter = "1, 2"`, so each resolved whatever 2.x was current and
  the two disagreed about the trailing `;` in a `let` header — 42 sites.
  That turned `test/package/format_tests.jl` and the byte-identical
  reproducibility gate (`test/generator_tests.jl`, NFR-04) red with no
  source change, on CI as well as locally. The CI job also asked for
  `version = "2"`, i.e. the newest release at run time, so the gate could
  break on any JuliaFormatter publication. The binding count is unchanged
  (1241) and two consecutive generator runs are byte-identical.
- **An operand with no `Gen` constructor raises a catchable exception.**
  `Gen(1) + π` recursed through `promote_type`/`convert` and died with a
  `StackOverflowError`, which corrupts program state; it is now a plain
  `MethodError` (REQ-TYPE-07).
- **A `t_REAL` converts through PARI instead of parsing its printed form.**
  `Float64` and `BigFloat` read PARI's own mantissa and exponent
  (`mantissa_real`), so `Float64(Gen(1e-10))` and
  `BigFloat(gp_eval("1.0*10^400"))` succeed; both previously raised
  `ArgumentError: cannot parse …` because PARI prints a space before the
  exponent (REQ-TYPE-08, a REQ-CONV-04 violation). A real too large for
  `Float64` now converts to `Inf`.
- **`hash` is total over every PARI type** (REQ-TYPE-09). It routed a
  `t_REAL` through `Float64` and so threw on a large-exponent real, making
  such a `Gen` unusable as a `Dict`/`Set` key; it now routes through
  `BigFloat`, preserving `a == b ⟹ hash(a) == hash(b)`.

### Documented

- **`ROADMAP.md` gains Part II — the API redesign for 1.0.0.** The roadmap
  is now split into Part I (M0–M10, delivered) and **Part II (M11–M21)**:
  M11 honest type contract for `Gen` (`Gen <: PariObject`,
  withdrawing `Gen <: Number`), M12 conversion and promotion contracts,
  M13 precision-safe reals and a bit-based precision API, M14 `pari(x)`
  plus a four-name export surface and a small facade, M15 generated-binding
  argument ergonomics, M16 explicit GP sessions, M17 structured PARI
  objects, M18 display contract, M21 documentation, migration and the
  1.0.0 release. Each milestone carries its deliverables with requirement
  ids, a **Breaking changes** table stating whether a deprecation shim is
  possible, exit criteria, and open questions. Two interoperability
  bridges are scheduled **before** 1.0, as optional package extensions on
  the `ext/LibPARIMCPExt.jl` pattern: **M19** Symbolics.jl
  (`to_symbolics` outward, `pari(x)` inward) and **M20** Giac.jl — each
  gated on an investigation deliverable, since variable identity
  (PARI variable numbers versus named symbols) and the Giac package's
  actual exchange format decide both designs. The traceability table gains
  the nine new requirement families and records that **REQ-API-01
  (`Gen <: Number`) is superseded by REQ-TYPE-01**; the 0.7.0 and 0.14.0
  entries below stand as historical record.
- **`ROADMAP.md` marked up to date.** Every M0–M10 deliverable is now
  ticked, the milestone summary carries a status column, and a
  `Current status` section records the one deviation from the exit
  criteria: the per-milestone tags `v0.1.0`–`v0.11.0` were never created
  (only `v0.15.1` exists, now produced by TagBot). M9's "single global
  lock" deliverable is annotated as superseded by the per-thread PARI
  contexts of `0.13.0`, REQ-QA-08 as a true hard gate only from `0.15.0`,
  and a new `Delivered beyond the roadmap` section lists the
  `0.12.0`–`0.15.1` work.

## [0.15.1] - 2026-06-04

Restores the 3-OS × 2-Julia CI hard gate that turned red on commit
`e6cfcb4` (0.15.0). The three failing test items and the
`Documentation` job are addressed in one patch release.

### Fixed

- **Generator-related tests on a cold runner.** The three `@testitem`s
  that spawn `gen/generate.jl` as a subprocess
  (`regenerating the bindings is byte-for-byte reproducible` and
  `the generator omits, skips, and excludes — never silently` in
  `test/generator_tests.jl`; `NFR-04 — the binding generator is
  byte-identical across runs` in `test/acceptance_tests.jl`) now
  instantiate the `gen/` environment before launching the
  subprocess. CI runners (which never carry a `gen/Manifest.toml`,
  since it is excluded by the `**/Manifest.toml` glob) can now run
  the generator successfully on every cell of the matrix. The
  instantiation subprocess is launched with `JULIA_LOAD_PATH=@:@stdlib`
  via `addenv` to override `Pkg.test()`'s `@`-only LOAD_PATH
  inheritance, which would otherwise hide the `Pkg` stdlib from the
  child process.

### Changed

- **`gen/Project.toml`** — `PrecompileTools` is now a direct dep with
  a defensive `[compat]` bound of `"1.0 - 1.2"`, capping the gen
  environment at the last Julia-1.10-safe series. The bound stops a
  `gen/Manifest.toml` resolved under Julia 1.12 from re-using
  PrecompileTools 1.3.4 on Julia 1.10 (see `upstream-bugs.md`
  2026-06-04 entry).
- **`docs` job in `.github/workflows/CI.yml`** — declares
  `permissions: contents: write`. `deploydocs` needs that scope on the
  workflow-issued `GITHUB_TOKEN` to push to the `gh-pages` branch when
  no repository `DOCUMENTER_KEY` is configured.

### Documented

- New `upstream-bugs.md` entry for the
  `Base.StaticData`-on-Julia-1.10 defect in PrecompileTools 1.3.4 —
  `src/invalidations.jl:15` references the symbol unguarded; the
  defect is shielded for LibPARI by the new `gen/Project.toml`
  compat bound.

### Fixed (follow-up — CI runs `26941877211`, `26944653380`, `26965046659`)

- **Windows 64-bit (LLP64) ABI — the whole `ccall` boundary.** PARI
  redefines `long` to `long long` (64-bit) on Windows 64-bit
  (`parigen.h`: `#ifdef _WIN64 / #define long long long`), so the PARI
  word is pointer-sized on every platform. LibPARI, however, marshalled
  every PARI word and `GEN` as Julia's `Clong`/`Culong`, which are only
  **32-bit on Windows** — truncating `GEN` pointers and reading 32-bit
  type-tag words. This made `windows-latest` fail at precompilation
  (`bitcast: argument size does not match size of target type`, then a
  `_trap_reinterpret` `MethodError`); Windows had never actually
  passed, only been masked by the former `continue-on-error`. The fix
  replaces `Clong`→`Int` and `Culong`→`UInt` across the entire ccall
  boundary — the hand-written core (`trap.jl`, `conversions.jl`,
  `errors.jl`, `gen.jl`, `numeric.jl`, `evaluator.jl`, `concurrency.jl`,
  `lifecycle.jl`), the binding generator (`gen/generate.jl`), and the
  ~11 200 regenerated bindings in `src/bindings.jl`. `Int`/`UInt` are
  pointer-sized on every platform (Int64 on 64-bit, including Win64) and
  identical to `Clong`/`Culong` on Linux/macOS LP64, so the change is a
  no-op there (verified: 311/311 on both Julia 1.10 and Julia release).
  The C trap shim now returns `intptr_t`. The binding generator's output
  remains byte-identical across runs (reproducibility contract intact).
  The test suite's own raw PARI `ccall`s (`test/error_tests.jl`,
  `test/gen_tests.jl`, `test/gen_memory_tests.jl`,
  `test/conversions_tests.jl`, `test/bindings_tests.jl`) were updated the
  same way — they had the identical `Ptr{Clong}` truncation.
- **Windows path separator in the gen-instantiate test prelude.** The
  prelude added in this release set `JULIA_LOAD_PATH=@:@stdlib`; the
  `LOAD_PATH` separator is `;` on Windows, so the value was malformed
  there and the instantiate subprocess could not find the `Pkg` stdlib.
  The separator is now chosen per platform
  (`Sys.iswindows() ? ';' : ':'`).
- **Reproducibility tests vs. git CRLF on Windows.** The generator
  always writes `src/bindings.jl` with LF, but git's `core.autocrlf`
  checks the committed (LF) file out as CRLF on the Windows runner, so
  the working-tree copy and the freshly generated file differed only by
  line endings — failing the byte-equality check in NFR-04
  (`test/acceptance_tests.jl`) and the M4 reproducibility item
  (`test/generator_tests.jl`). Both comparisons now normalize `\r\n` to
  `\n` before comparing; generator determinism itself is unchanged
  (verified by the two-run check on Linux/macOS).
- **Concurrent-error stress crash on Windows.** Concurrency-safe PARI
  error handling requires LibPARI's C trap shim (a PARI error must
  `longjmp` across C frames only). The shim is not active on the Windows
  runner, so raising a PARI error concurrently from many threads routed
  through PARI's cross-thread `mt_err_recover` and segfaulted
  (`EXCEPTION_ACCESS_VIOLATION`) — the documented upstream limitation
  (`upstream-bugs.md`). The multi-threaded concurrent-error testsets in
  `test/concurrency_tests.jl` are now gated on `LibPARI._TRAP_AVAILABLE[]`
  and skipped with a logged notice where the shim is unavailable; they
  re-enable automatically if a future toolchain makes the shim work on
  Windows. The other concurrency guarantees (cross-thread correctness,
  leak-safety, parallelism) still run on every platform, and
  single-threaded error handling is covered unconditionally by
  `test/error_tests.jl`.

### Known limitations

- On platforms without LibPARI's C trap shim (currently the Windows CI
  runner), error handling is **single-threaded-safe only**: a PARI error
  raised concurrently from multiple Julia threads is not guaranteed safe.
  Single-threaded use — the default — is fully supported on every
  platform. Linux and macOS validate the concurrent-error guarantees in
  CI.
- **`test/concurrency_tests.jl` "concurrent calls run in parallel
  across threads".** A timing-based speedup floor is flaky by
  construction on shared CI runners: run `26941877211` measured
  `speedup = 1.21` (macOS, 3 threads) and run `26944653380` measured
  `speedup = 0.84` (ubuntu, 4 threads — parallel *slower* than
  serial, from vCPU oversubscription). Under `CI=true` the
  parallelism assertion is now advisory (the measured speedup is
  logged, only run-completion is asserted); a local developer still
  gets the strict `speedup > 1.3` gate. The correctness,
  leak-safety, and error-safety concurrency tests continue to gate
  on every cell.

## [0.15.0] - 2026-06-04

`PARI_jll` is now registered in the Julia General registry — LibPARI
installs with a plain `Pkg.add("LibPARI")` on Linux, macOS, and Windows.

### Added

- **Cross-platform CI hard gate.** The GitHub Actions `test` job is now a
  hard 3-OS matrix (Ubuntu, macOS, Windows × Julia 1.10 and 1) — any
  platform failure fails the build (REQ-QA-07, REQ-QA-08). `Documentation`
  is likewise a hard gate (REQ-DOC-01, REQ-DOC-06) and auto-deploys the
  Documenter.jl site to GitHub Pages from the default branch.

### Changed

- **Installation is now `Pkg.add("LibPARI")`.** The previous `Pkg.develop`
  workaround for the unregistered `PARI_jll` is no longer needed. README
  and the documentation `Getting started` page are updated accordingly.
- The CI workflow's `continue-on-error` lines and the stub
  `Resolve PARI_jll` steps — placeholders that existed only until
  PARI_jll was registered — have been removed from both the `test` and
  `docs` jobs.
- LibPARI's `Manifest.toml` now resolves `PARI_jll` 2.17.3+0 from the
  registry instead of a local development path.

## [0.14.0] - 2026-05-21

`Gen` is now a complete Julia `Number`.

### Added

- **A complete `Number` interface for `Gen`.** `Gen` now carries the full
  Julia `Number` contract: it mixes with every standard Julia numeric type
  (`Int`, `BigInt`, `Float64`, `BigFloat`, `Rational`, `Complex`) in
  arithmetic and comparison; it provides the `zero`/`one` identities,
  ordering (`<`, `<=`, `isless`) and `hash` — so `Gen`s sort and serve as
  `Dict`/`Set` keys interchangeably with equal Julia numbers; the standard
  predicates (`iszero`, `isone`, `isinteger`, `isfinite`, `isreal`, …); the
  elementary operations (`abs`, `sign`, `inv`, `conj`, `real`, `imag`); and
  conversions to and from `Float64`, `BigFloat`, `Rational`, and `Complex`.
  A `Gen` is now a drop-in Julia number in generic numeric code.

### Changed

- An operation that does not apply to a `Gen`'s underlying PARI type (for
  example, ordering a polynomial, or `Float64` of a vector) raises a
  catchable `PariError` or `InexactError`. The change is purely additive —
  no public API change, and `Gen <: Number` is unchanged.

## [0.13.0] - 2026-05-21

LibPARI is now **fully parallel** — concurrent `libpari` calls *and*
concurrency-safe PARI error handling.

### Added

- **Parallel `libpari` calls.** LibPARI now runs **one PARI context per
  Julia OS thread** — PARI's per-thread context API (`pari_thread_*`),
  behind a pool of sticky worker tasks, one pinned to each thread.
  Concurrent `libpari` calls issued from different Julia threads execute in
  parallel on multiple cores, instead of serializing onto the single
  worker of milestone M9. Single-threaded behaviour and the public API are
  unchanged.
- **Concurrency-safe PARI error handling.** A PARI error raised on any
  thread — including simultaneously from many threads — is caught as a
  catchable `PariError`, with no crash, hang, or corruption. Every
  error-prone call path (the generated bindings, the GP evaluator, the
  conversion layer) routes through a small per-thread C error trap. The
  trap is optional: where no C compiler is available LibPARI degrades
  gracefully to the single-threaded-safe path — installation never fails
  and no new hard prerequisite is introduced.

### Changed

- PARI's transient-stack pointer `avma` is read through `get_avma()` (a
  thread-local read, correct on every worker context); cloned-object
  bookkeeping (`gclone` / `gunclone`) is funnelled to the primary worker,
  since PARI's clone list is per-context.
- The generated bindings, the GP evaluator, and the conversion layer call
  `libpari` through the concurrency-safe error trap instead of a raw
  `ccall`. The `PariError` type, the error model, and the public API are
  unchanged.

## [0.12.0] - 2026-05-21

An **optional MCP connector** — the first feature beyond the M0–M10 roadmap.

### Added

- An optional **MCP (Model Context Protocol) connector**, delivered as a
  Julia package extension (`ext/LibPARIMCPExt.jl`). When a user loads
  [`ModelContextProtocol`](https://github.com/JuliaSMLM/ModelContextProtocol.jl)
  alongside LibPARI, `LibPARI.serve_mcp()` starts an MCP server that exposes
  PARI/GP to MCP clients (AI assistants) through three tools: `pari_eval`
  (evaluate a GP expression — reaches every PARI function), `pari_functions`
  (list/search PARI functions), and `pari_help` (a function's help text).
- A documentation page for the connector (`docs/src/mcp.md`).
- `test/mcp_tests.jl` — `@testitem`s covering activation, the three tools,
  optionality, and structured error handling.

### Changed

- `Project.toml` declares `ModelContextProtocol` as a **weak dependency**
  with a `LibPARIMCPExt` extension — the connector is strictly optional.
  Installing LibPARI does **not** install `ModelContextProtocol`, and a
  process that does not load it pays no cost: no dependency, no connector
  code. Calling `serve_mcp` without it raises a `MethodError` whose hint
  tells the user what to load.

## [0.11.0] - 2026-05-20

Milestone **M10 — Documentation & 0.11.0 release**. The release milestone:
LibPARI is now documented, verified across platforms, and shippable. M10 adds
no new wrapper functionality — every computational capability landed in
M1–M9.

### Added

- A **documentation website** built with [Documenter.jl](https://documenter.juliadocs.org/)
  (REQ-DOC-01): an introduction, a getting-started guide, and an API
  reference for the hand-written public surface. Sources live in the `docs/`
  sub-project; build with `julia --project=docs docs/make.jl`.
- The documentation build is **strict** — it executes every `jldoctest`
  example and verifies its output, and completes with **no warnings**; any
  warning or doctest mismatch fails the build (REQ-DOC-04, REQ-DOC-05).
- A **`docs` CI job** that builds the site and deploys it to GitHub Pages
  from the default branch (REQ-DOC-06).
- `test/acceptance_tests.jl` — the four **non-functional acceptance checks**,
  one `@testitem` per NFR: ≥ 1200 generated bindings (NFR-01, observed 1241+),
  no PARI heap leak across repeated calls (NFR-02), bounded constant
  per-call allocation (NFR-03), and byte-identical generator output
  (NFR-04).
- `jldoctest` examples for the `gen_from` and `protected_call` public
  functions (REQ-DOC-03).

### Changed

- CI runs the test suite on a **cross-platform matrix** — Linux, macOS, and
  Windows (REQ-QA-07).
- The stale M1-era `LibPARI` module docstring now describes the complete
  library.

### Known limitations

- The CI `test` and `docs` jobs both keep `continue-on-error` for now:
  until `PARI_jll` is registered (Yggdrasil PR #13771) the runners cannot
  fetch the PARI artifact, so neither job can pass — the `docs` build runs
  `using LibPARI` and executes doctests against live PARI. Once `PARI_jll`
  is registered, removing those two lines makes the `test` job the hard
  cross-platform gate REQ-QA-08 requires and lets the `docs` job deploy on
  every push.
- Because CI cannot yet build the documentation, the site at
  <https://s-celles.github.io/LibPARI.jl> is **deployed manually** from a
  machine that has `PARI_jll`. It auto-deploys via CI once `PARI_jll` is
  registered.
- Registration of LibPARI in the Julia General registry is prepared but
  pending `PARI_jll`'s own registration — a registered package may not
  depend on an unregistered one.

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
