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

| ID  | Milestone                                | Target version |
|-----|------------------------------------------|----------------|
| M0  | Project scaffolding & packaging baseline | 0.1.0          |
| M1  | Library lifecycle                        | 0.2.0          |
| M2  | `Gen` value type & memory management     | 0.3.0          |
| M3  | Error handling & the C-call boundary     | 0.4.0          |
| M4  | Binding generator & function invocation  | 0.5.0          |
| M5  | Type conversions                         | 0.6.0          |
| M6  | Idiomatic numeric API                    | 0.7.0          |
| M7  | GP expression evaluator                  | 0.8.0          |
| M8  | Type stability & precompilation          | 0.9.0          |
| M9  | Platform & concurrency hardening         | 0.10.0         |
| M10 | Documentation & 0.11.0 release           | 0.11.0         |

---

## M0 — Project scaffolding & packaging baseline

**Goal:** a registrable, CI-ready package skeleton with the quality gates
wired in before any wrapper code exists.

**Scope:** REQ-PKG-01, REQ-PKG-02, REQ-PKG-03, REQ-PKG-04, REQ-PKG-05,
REQ-QA-04, REQ-QA-05, REQ-QA-06, REQ-PLT-02.

**Deliverables**

- [ ] `Project.toml` with a fresh UUID and a `[compat]` section. (REQ-PKG-01)
- [ ] `[compat]` bound on `PARI_jll`. (REQ-PKG-02)
- [ ] `[compat]` bound `julia = "1.10"` (LTS and later). (REQ-PLT-02)
- [ ] Package named `LibPARI` per General registry Rule 6 (wrappers).
      (REQ-PKG-05)
- [ ] `src/LibPARI.jl` module stub.
- [ ] `CHANGELOG.md` in "Keep a Changelog" format; SemVer adopted.
      (REQ-PKG-03, REQ-PKG-04)
- [ ] `.JuliaFormatter.toml` with an 80-character margin. (REQ-QA-04,
      REQ-QA-05)
- [ ] Pre-commit hooks running formatting and quality checks. (REQ-QA-06)
- [ ] `test/` skeleton driven by `TestItemRunner` (`@run_package_tests`),
      with the `test/package/` directory reserved. (cross-cutting:
      REQ-QA-01, REQ-QA-02)
- [ ] CI workflow stub (test matrix + docs job placeholders).

**Exit criteria**

- `using LibPARI` succeeds; `Pkg.test()` runs an empty-but-green suite.
- `JuliaFormatter` reports no diff; pre-commit hooks pass locally.
- Tag `v0.1.0`.

---

## M1 — Library lifecycle

**Goal:** PARI initializes once per process, from the JLL artifact, and
shuts down cleanly.

**Depends on:** M0.

**Scope:** REQ-INI-01 … REQ-INI-07.

**Deliverables**

- [ ] `libpari` resolved exclusively from the `PARI_jll` artifact.
      (REQ-INI-01)
- [ ] `pari_init` called exactly once, from the module `__init__`, never
      during precompilation. (REQ-INI-02, REQ-INI-03)
- [ ] Configurable stack size honoured when set before module load.
      (REQ-INI-04)
- [ ] `pari_close` registered to run at process exit (`atexit`).
      (REQ-INI-05)
- [ ] Guard preventing any `libpari` call before initialization.
      (REQ-INI-06)
- [ ] `pari_init` failure raises a Julia exception, leaving the library
      uninitialized. (REQ-INI-07)

**Exit criteria**

- Tests confirm single init, exit-time close, custom stack size, and the
  failure path.
- Tag `v0.2.0`.

---

## M2 — `Gen` value type & memory management

**Goal:** a concrete, GC-safe Julia type wrapping PARI's `GEN`, with
leak-free stack discipline.

**Depends on:** M1.

**Scope:** REQ-MEM-01 … REQ-MEM-08.

**Deliverables**

- [ ] `Gen` represents every PARI object exposed to Julia. (REQ-MEM-01)
- [ ] `Gen` is a **concrete** type (prerequisite for type stability).
      (REQ-MEM-02)
- [ ] Results moved off the PARI stack with `gclone` before return.
      (REQ-MEM-03)
- [ ] GC finalizer frees the clone via `gunclone`. (REQ-MEM-04)
- [ ] `avma` (stack pointer) restored to its pre-call value after each
      call. (REQ-MEM-05)
- [ ] Idempotent finalizer: at most one `gunclone` per object.
      (REQ-MEM-06)
- [ ] Module-scoped enum for PARI value types (`t_INT`, `t_REAL`, `t_POL`,
      `t_VEC`, …). (REQ-MEM-07)
- [ ] Type-query API returning that enum. (REQ-MEM-08)

**Exit criteria**

- Stress test allocating/freeing many `Gen` values shows stable `avma`
  and no heap growth (early evidence toward NFR-02).
- Tag `v0.3.0`.

---

## M3 — Error handling & the C-call boundary

**Goal:** a safe Julia/C boundary — no PARI `longjmp` escapes, every PARI
error becomes a Julia exception.

**Depends on:** M2.

**Scope:** REQ-ERR-01 … REQ-ERR-04.

**Deliverables**

- [ ] PARI errors translated into Julia exceptions carrying PARI's
      message. (REQ-ERR-01)
- [ ] PARI `longjmp` trapped so it cannot unwind past the Julia/C
      boundary. (REQ-ERR-02)
- [ ] PARI stack restored to a consistent state on error before raising.
      (REQ-ERR-03)
- [ ] Module-scoped enum of PARI error categories, included in every
      raised exception. (REQ-ERR-04)

**Exit criteria**

- Tests deliberately trigger PARI errors and assert exception type,
  message, category, and stack consistency afterwards.
- Tag `v0.4.0`.

---

## M4 — Binding generator & function invocation

**Goal:** generate the bulk of the API automatically from `pari.desc`.

**Depends on:** M3 (bindings need the safe boundary and `Gen`).

**Scope:** REQ-GEN-01 … REQ-GEN-10, REQ-CALL-01 … REQ-CALL-04.

**Deliverables**

- [ ] Generator derives bindings from the RFC-822 records of `pari.desc`.
      (REQ-GEN-01)
- [ ] `pari.desc` read from `PARI_jll.pari_desc` (version-matched).
      (REQ-GEN-02)
- [ ] Records with a `C-Name` field emit a `ccall` binding. (REQ-GEN-03)
- [ ] `Prototype` codes mapped to `ccall` argument/return types.
      (REQ-GEN-04)
- [ ] `Help` text attached as the binding docstring. (REQ-GEN-05)
- [ ] All bindings written to a single, committed, header-marked
      auto-generated source file. (REQ-GEN-06, REQ-GEN-07)
- [ ] Generated file conforms to JuliaFormatter. (REQ-GEN-08)
- [ ] Records without `C-Name` omitted. (REQ-GEN-09)
- [ ] Unrecognized prototype codes skip the function with a diagnostic.
      (REQ-GEN-10)
- [ ] Precision args (`p`/`b`/`P`): auto-supplied, `prec` keyword
      override. (REQ-CALL-01)
- [ ] Optional args (`D...`): exposed with declared defaults.
      (REQ-CALL-02)
- [ ] Output args (`&`): returned alongside the primary result as a
      tuple. (REQ-CALL-03)
- [ ] GP-closure args (`E`/`I`/`V`/`C`): excluded from generated
      bindings. (REQ-CALL-04)

**Exit criteria**

- Generator runs reproducibly; generated file is committed and formatted.
- Generated binding count recorded toward NFR-01 (≥ 1200 functions).
- Tag `v0.5.0`.

---

## M5 — Type conversions

**Goal:** seamless conversion between Julia numeric values and `Gen`.

**Depends on:** M4.

**Scope:** REQ-CONV-01 … REQ-CONV-04.

**Deliverables**

- [ ] Julia `Integer` → integer-valued PARI `GEN`. (REQ-CONV-01)
- [ ] `Gen` integer → exact `BigInt`. (REQ-CONV-02)
- [ ] Textual representation equal to PARI's `GENtostr`. (REQ-CONV-03)
- [ ] Lossy `Gen` → Julia numeric conversion raises `InexactError`.
      (REQ-CONV-04)

**Exit criteria**

- Round-trip and lossy-conversion tests pass.
- Tag `v0.6.0`.

---

## M6 — Idiomatic numeric API

**Goal:** `Gen` behaves like a first-class Julia number.

**Depends on:** M5.

**Scope:** REQ-API-01 … REQ-API-05.

**Deliverables**

- [ ] `Gen <: Number`. (REQ-API-01)
- [ ] Operators `+`, `-`, `*`, `/`, `^` overloaded for `Gen`.
      (REQ-API-02)
- [ ] Mixed `Gen`/`Number` arithmetic promotes the Julia operand to
      `Gen`. (REQ-API-03)
- [ ] `==` returns PARI's equality result. (REQ-API-04)
- [ ] Display uses PARI's textual representation. (REQ-API-05)

**Exit criteria**

- Arithmetic, promotion, comparison, and display tests pass.
- Tag `v0.7.0`.

---

## M7 — GP expression evaluator

**Goal:** an escape hatch for functions not covered by generated bindings.

**Depends on:** M4 (and M2/M3 for `Gen` results and error handling).

**Scope:** REQ-GP-01, REQ-GP-02.

**Deliverables**

- [ ] Function evaluating an arbitrary GP expression string, returning a
      `Gen`. (REQ-GP-01)
- [ ] Syntactically invalid expressions raise a Julia exception
      describing the parse error. (REQ-GP-02)

**Exit criteria**

- Evaluator handles valid and malformed expressions; covers a
  GP-closure-argument function unreachable via bindings.
- Tag `v0.8.0`.

---

## M8 — Type stability & precompilation

**Goal:** SciML-grade inference and fast first call.

**Depends on:** M4, M5, M6, M7.

**Scope:** REQ-PERF-01, REQ-PERF-02, REQ-PERF-03.

**Deliverables**

- [ ] Every generated binding is type-stable: return inferable as `Gen`
      or the scalar Julia type required by the prototype. (REQ-PERF-01)
- [ ] PrecompileTools.jl workload exercising a representative subset of
      bindings. (REQ-PERF-02)
- [ ] `@code_warntype` audit: any inferred `Any` on a public function is
      treated as non-conforming and fixed. (REQ-PERF-03)

**Exit criteria**

- Inference tests (e.g. `@inferred`) pass across the public surface.
- Tag `v0.9.0`.

---

## M9 — Platform & concurrency hardening

**Goal:** correct behaviour on every supported platform and under
multi-threaded Julia.

**Depends on:** M1.

**Scope:** REQ-PLT-01, REQ-PLT-03. (REQ-PLT-02 delivered in M0.)

**Deliverables**

- [ ] Support every platform for which `PARI_jll` provides an artifact.
      (REQ-PLT-01)
- [ ] Single global lock serializing all `libpari` calls under
      multi-threaded Julia. (REQ-PLT-03)

**Exit criteria**

- Multi-threaded stress test passes with no data races or stack
  corruption.
- Tag `v0.10.0`.

---

## M10 — Documentation & 0.11.0 release

**Goal:** publishable documentation, full CI matrix, non-functional
acceptance — the 0.11.0 release.

**Depends on:** all prior milestones.

**Scope:** REQ-DOC-01 … REQ-DOC-06, REQ-QA-07, REQ-QA-08, NFR-01 … NFR-04.

**Deliverables**

- [ ] Documentation built with Documenter.jl. (REQ-DOC-01)
- [ ] Hand-written public functions/types carry DocStringExtensions
      docstrings. (REQ-DOC-02)
- [ ] Each hand-written public function docstring has a `jldoctest`.
      (REQ-DOC-03)
- [ ] `jldoctest` examples executed and verified at build time.
      (REQ-DOC-04)
- [ ] Documentation builds with **no warnings**. (REQ-DOC-05)
- [ ] CI deploys docs to GitHub Pages from the default branch.
      (REQ-DOC-06)
- [ ] CI test matrix runs on Linux, macOS, and Windows. (REQ-QA-07)
- [ ] CI fails the build if the suite fails on any platform. (REQ-QA-08)
- [ ] Acceptance: ≥ 1200 GP-accessible functions covered. (NFR-01)
- [ ] Acceptance: no PARI heap leak across repeated calls. (NFR-02)
- [ ] Acceptance: no allocation beyond the `Gen` result + its clone.
      (NFR-03)
- [ ] Acceptance: generator output byte-identical across two runs.
      (NFR-04)

**Exit criteria**

- All NFR acceptance checks pass; docs deploy; CI green on all three OSes.
- Tag `v0.11.0`; register in the General registry.

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

- Native Julia closures for PARI functions taking GP-closure arguments
  (`E`/`I`/`V`/`C`) — reachable only via the GP evaluator (M7).
- The interactive `gp` REPL.
- The MPI (`--mt=mpi`) parallel engine; only `pthread` is assumed.
- PARI optional data packages (`elldata`, `galdata`, `seadata`,
  `galpol`, `nflistdata`).
- Per-thread PARI stack contexts; v1 serializes calls (REQ-PLT-03).

## Post-0.11.0 candidates

Possible directions once v0.11.0 ships, drawn from the out-of-scope list:

- Native Julia callback support for GP-closure-argument functions.
- Per-thread PARI stack contexts to remove the global call lock.
- Optional data-package integration.
