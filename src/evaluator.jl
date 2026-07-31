# ---------------------------------------------------------------------------
# GP expression evaluator — the escape hatch to all of GP (M7).
# Included by src/LibPARI.jl after numeric.jl, before bindings.jl.
# ---------------------------------------------------------------------------

"""
$(TYPEDSIGNATURES)

Evaluate a GP-language expression string with PARI's GP engine and return the
result as a `Gen`.

`gp_eval` reaches every PARI capability — including the GP-closure-argument
functions (`sum`, `intnum`, …) that the generated bindings do not expose. A
syntactically invalid string raises a catchable `PariError` describing the
parse error; a runtime failure raises a `PariError` too.

# GP state, and the threading rule

There is **one** GP environment per process, and it lives in PARI's primary
context. Variable assignments persist across calls, so `gp_eval("x = 42")`
followed by `gp_eval("x + 1")` answers `43`.

That environment is **not** reachable for writing from another task. PARI's
parallel model makes global variables read-only inside a secondary context,
so from a `Threads.@spawn`ed task:

- pure evaluation works — `gp_eval("2 + 2")` answers `4`;
- reading a variable raises `PariError(e_MISC)`, `"mt: please use
  export(x)"`, unless the primary task exported it with
  `gp_eval("export(x)")`;
- **assigning always raises** `PariError(e_MISC)`, `"mt: attempt to change
  exported variable"`.

This is PARI's design, not a LibPARI restriction: its documentation states
that exported variables "cannot be modified inside a parallel section".
Confine GP variable work to one task.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.gp_eval("2 + 2") isa LibPARI.Gen
true
```
"""
function gp_eval(s::AbstractString)
    return protected_call() do
        gen_from() do
            # Route through the concurrency-safe error trap (feature 014):
            # a syntax/runtime error in the GP string is caught per-thread.
            cs = Base.cconvert(Cstring, s)
            GC.@preserve cs _trap_call(
                Ptr{Int},
                cglobal((:gp_read_str, PARI_jll.libpari)),
                1,
                reinterpret(Int, Base.unsafe_convert(Cstring, cs)),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
                Int(0),
            )
        end
    end
end
