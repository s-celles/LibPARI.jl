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
parse error; a runtime failure raises a `PariError` too. GP variable
assignments persist across calls — `gp_eval` shares one GP environment.

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
