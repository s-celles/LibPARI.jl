```@meta
CurrentModule = LibPARI
```

# Parallelism

LibPARI can use several cores in two independent ways:

- **Julia threads.** Each Julia thread gets its own PARI context, so PARI
  calls made from different threads run at the same time.
- **PARI's own engine.** PARI can split one computation across worker
  threads of its own: its parallel GP functions and many of its algorithms.
  [`set_nbthreads!`](@ref) turns it on.

## Julia threads

Start Julia with several threads (`julia --threads=auto`) and call LibPARI
from as many tasks as you like:

```julia
using LibPARI
results = Vector{Any}(undef, 8)
Threads.@threads for i = 1:8
    results[i] = gp_eval("factor(2^128 + $(2i + 1))")
end
```

Every call is routed to the PARI context of the thread it runs on. A value
(a [`Gen`](@ref)) can be used from any thread; its storage stays with the
context that built it, which frees it once the `Gen` is garbage-collected.

### The C trap shim

Catching PARI errors safely on every thread relies on a small C shim,
compiled when the package loads with the first of `cc`, `gcc` or `clang`
found on the `PATH`. On Windows, a MinGW-w64 `gcc` (from MSYS2, for
example) is enough. Before relying on the shim, LibPARI checks that it really
catches a PARI error; if that check fails, the shim is not used.

Without a working shim, LibPARI still works from any number of threads, but
every PARI call runs on one context, one at a time: results and errors are
the same, only the parallel speed-up is lost. Setting `LIBPARI_DISABLE_TRAP=1`
before loading forces this mode.

## PARI's own parallel engine

`PARI_jll` is built with PARI's `pthread` engine, which LibPARI keeps off by
default (`LibPARI.nbthreads() == 1`). Turn it on with:

```julia
LibPARI.set_nbthreads!(Sys.CPU_THREADS)   # returns the previous setting
```

PARI then runs on several cores:

- its parallel GP functions — `parapply`, `parsum`, `parfor`, `parforprime`,
  `parvector`, `parselect`, … — through [`gp_eval`](@ref);
- the many algorithms it parallelizes internally, whichever way they are
  called: APRCL and ECPP primality proofs, multimodular linear algebra
  (`matdet`, …), `bnfinit`, L-functions, modular polynomials, …

Results are identical to the serial ones. As an indication, on 6 cores an
APRCL proof (`isprime(nextprime(10^400), 2)`) ran about 2.5 to 3 times
faster, a 160×160 integer `matdet` 2.3 to 3.6 times, and a `parapply` of 48
factorizations about 2.5 times; short computations gain nothing, since PARI
starts its worker threads for every parallel section.

Rules:

- **Only the primary context uses the engine** — calls made from the task
  that loaded LibPARI (Julia's main task). PARI treats the context of every
  other Julia thread as one of its own workers, and workers do not nest:
  a `parapply` from a `Threads.@spawn`ed task runs serially, correctly.
- **The engine needs the trap shim.** Without it, `set_nbthreads!` throws for
  `n > 1` and says why the shim is not in use.
- **Memory.** Each worker thread gets a PARI stack of the size of the main
  one (`LIBPARI_STACK_SIZE`, 8 MiB by default). PARI's `threadsize` and
  `threadsizemax` defaults can be set with `gp_eval("default(threadsizemax,
  ...)")`.
- **GP variables.** A closure passed to a parallel GP function runs on a
  worker thread: it may read only variables that were `export`ed, as for
  any secondary context (see [GP state and sessions](@ref)).
- **Errors.** A PARI error inside a parallel section is raised as a
  [`PariError`](@ref). PARI leaves the section open in that case; LibPARI
  closes it, so the next parallel call runs normally.

Both ways combine: with the engine on, the main task can run PARI parallel
sections while other Julia threads keep computing on their own contexts.
