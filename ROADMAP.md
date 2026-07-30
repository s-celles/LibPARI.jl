# LibPARI — Roadmap

This roadmap sequences the implementation of `LibPARI`, a Julia wrapper for
the PARI/GP number-theory library, from the requirements stated in
[`spec-ears.md`](spec-ears.md) (Software Requirements Specification, EARS
notation, Draft v0.3).

Every requirement in the SRS is assigned to exactly one milestone below.
Section [Traceability](#traceability) maps each requirement ID to the
milestone that delivers it.

## How to read this roadmap

- **Milestones (M0–M10)** are ordered by dependency. Each one is shippable:
  it ends in a tagged pre-release with a green CI run.
- **Scope** lists the requirement IDs the milestone delivers.
- **Exit criteria** are the verifiable conditions for closing the milestone.
- **Cross-cutting workstreams** (testing, formatting, docs) advance inside
  *every* milestone rather than waiting for a dedicated phase.
- Status legend: `[ ]` not started · `[~]` in progress · `[x]` done.

## Current status (2026-07-30, package version 0.15.1)

**Milestones M0–M10 are complete.** Every deliverable below shipped, in
milestone order, in releases `0.1.0` … `0.11.0`; the work that followed
(`0.12.0` … `0.15.1`) is beyond this roadmap and is listed under
[Post-0.11.0](#post-0110-candidates).

One deviation from the exit criteria, recorded here rather than silently
ticked: the per-milestone tags `v0.1.0` … `v0.11.0` were **never created**.
Tagging was deferred milestone after milestone (the suite was not reliably
green until M9/M10), and once the package was registered in the General
registry the repository switched to TagBot, which tags from registry
merges. The only tag in the repository is `v0.15.1`. Each milestone's
release is therefore identified by its `CHANGELOG.md` entry, not by a tag.

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

## Milestone summary

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

Every SRS requirement, mapped to its delivering milestone.

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

## Out of scope for 0.11.0

Carried from SRS §8.2 — explicitly *not* on this roadmap:

- [ ] Native Julia closures for PARI functions taking GP-closure arguments
      (`E`/`I`/`V`/`C`) — still reachable only via the GP evaluator (M7).
- [ ] The interactive `gp` REPL.
- [ ] The MPI (`--mt=mpi`) parallel engine; only `pthread` is assumed.
- [ ] PARI optional data packages (`elldata`, `galdata`, `seadata`,
      `galpol`, `nflistdata`).
- [x] Per-thread PARI stack contexts; 0.11.0 serialized calls
      (REQ-PLT-03). **Delivered after the roadmap, in `0.12.0`–`0.13.0`.**

## Post-0.11.0 candidates

Possible directions once v0.11.0 ships, drawn from the out-of-scope list:

- [ ] Native Julia callback support for GP-closure-argument functions.
- [x] Per-thread PARI stack contexts to remove the global call lock —
      **done in `0.13.0`** (one PARI context per Julia OS thread, plus a
      per-thread C error trap that degrades gracefully when no C compiler
      is available).
- [ ] Optional data-package integration.

## Delivered beyond the roadmap (0.12.0 – 0.15.1)

Work shipped after M10, not part of the M0–M10 plan:

- [x] `0.12.0` — optional **MCP connector** as a package extension
      (`ext/LibPARIMCPExt.jl`, `serve_mcp`, `docs/src/mcp.md`).
- [x] `0.13.0` — **parallel `libpari` calls** and concurrency-safe error
      handling (see above).
- [x] `0.14.0` — a **complete Julia `Number` interface** for `Gen`:
      ordering, `hash`, identities, predicates, and conversions to/from
      `Float64`, `BigFloat`, `Rational`, and `Complex`.
- [x] `0.15.0` — **General registry release**: `PARI_jll` registered, so
      `Pkg.add("LibPARI")` works; CI `test` and `Documentation` jobs
      became hard gates.
- [x] `0.15.1` — cold-runner fix for the three generator subprocess test
      items; TagBot and CompatHelper workflows added.
