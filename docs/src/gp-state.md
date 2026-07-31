```@meta
CurrentModule = LibPARI
```

# GP state and sessions

[`gp_eval`](@ref) evaluates GP code against a **persistent environment**:

```julia
gp_eval("x = 42")
gp_eval("x + 1")     # 43
```

That environment has rules, and they are not the ones a "session" API would
suggest. This page states them, and shows the one arrangement that gives
real isolation.

## One environment, one writer

There is **one GP environment per process**, living in PARI's primary
context. LibPARI runs one PARI context per Julia OS thread, and PARI treats
every non-primary context as a *parallel section*. Its documentation of
`export` is explicit: exported variables are "visible inside parallel
sections … but cannot be modified inside a parallel section".

Measured from a `Threads.@spawn`ed task:

| From another task | Result |
|-------------------|--------|
| `gp_eval("2 + 2")` | works — pure evaluation is unrestricted |
| `LibPARI.PARI.nextprime(1000)` | works — the generated layer is unrestricted |
| reading an unexported variable | `PariError(e_MISC)`: `"mt: please use export(x)"` |
| reading after `gp_eval("export(x)")` | works |
| **any assignment** | `PariError(e_MISC)`: `"mt: attempt to change exported variable"` |

**Confine GP variable work to one task.** Computation may happen anywhere.

## Why there is no in-process `GPSession`

Independent GP namespaces inside one process are not available, and the
reason is PARI's design rather than a gap in LibPARI. Every route was
investigated:

| Route | Why it does not work |
|-------|----------------------|
| A PARI context per session (`pari_thread_*`) | Contexts are for parallel *computation*; a secondary context cannot write GP globals at all. |
| Enumerate a session's variables | GP's `variables()` lists *polynomial* variables (`[x, y]`), not assignments. There is no public way to list what is bound. |
| Detect new names with `is_entry` | An `entree` survives `kill`, so a name that was ever used stays "known" — bound and unbound are indistinguishable this way. |
| Read `entree.valence` to tell them apart | The macros live in `paripriv.h`, a *private* header. LibPARI does not build on private layout. |
| Inject values as text (`gp_eval("x = $v")`) | Lossy: a 512-bit real comes back at 128 bits, because PARI prints it at the current `realprecision`. |
| Inject values with `changevalue`/`fetch_entry` | Exact, and verified working — but neither function is declared in any PARI header or documented. Building on an unpublished ABI is the same risk that made the `sd_*` bindings undefined behaviour. |

An API named "session" that shares one namespace, cannot enumerate its own
contents, and silently loses precision on injection would create more
illusion than it dispels. LibPARI does not ship one.

## Real isolation: one process per session

For genuinely independent GP environments — a notebook backend, a service
evaluating untrusted GP, or simply two computations that must not see each
other's variables — give each session **its own process**. One PARI
instance per process is complete isolation, and it relies on nothing
internal.

```julia
using Distributed
addprocs(2; exeflags = "--project=$(Base.active_project())")
@everywhere using LibPARI

# Each worker has its own PARI, hence its own GP environment.
remotecall_fetch(() -> LibPARI.gp_eval("s = 111"), workers()[1])

# Invisible from the other worker: `s` is still a free symbol there.
remotecall_fetch(() -> string(LibPARI.gp_eval("s")), workers()[2])   # "s"

# And it persists in the session that set it.
remotecall_fetch(() -> string(LibPARI.gp_eval("s")), workers()[1])   # "111"
```

Unlike a thread, a worker process **may assign**: it owns its primary PARI
context.

```julia
remotecall_fetch(workers()[2]) do
    LibPARI.gp_eval("t = 7")
    string(LibPARI.gp_eval("t * 2"))          # "14"
end
```

What this costs, stated plainly:

- one PARI stack per process (8 MiB by default, see `LIBPARI_STACK_SIZE`);
- values cross process boundaries by serialisation, so a [`Gen`](@ref) must
  be converted to a Julia value — `BigInt`, `String`, `Rational` — before it
  is returned;
- process start-up, including loading LibPARI in each worker.

For anything short of true isolation, prefer the single environment and the
threading rule above.
