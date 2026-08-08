"""
    LibPARI

A Julia wrapper for the PARI/GP number-theory library.

Loading this module initializes the embedded PARI library once for the
process and registers a clean shutdown at process exit. LibPARI exposes
PARI/GP in two ways: nearly 1200 functions generated from PARI's own function
database, reachable through the `LibPARI.PARI` submodule, and a hand-written
core — the `Gen` value type, idiomatic numeric operators, conversions to and
from Julia numbers, the `gp_eval` expression evaluator, and safe library
lifecycle and error handling.

The lifecycle is observable through `LibPARI.is_initialized`,
`LibPARI.library_state`, and `LibPARI.stack_size`.
"""
module LibPARI

# The exported surface is deliberately four names (M14, REQ-PUB-04): the
# entry point `pari`, the wrapper type `Gen` it produces, the escape hatch
# `gp_eval`, and the exception every PARI failure raises. The ~1200
# generated bindings stay behind `LibPARI.PARI`, and the rest of the
# hand-written surface stays qualified. A test locks this list, because
# adding to it breaks every `using LibPARI` that already works.
export Gen, pari, gp_eval, PariError

import PARI_jll
using DocStringExtensions
using PrecompileTools

include("concurrency.jl")
include("lifecycle.jl")
include("gen.jl")
include("errors.jl")
include("trap.jl")
include("conversions.jl")
include("numeric.jl")
include("precision.jl")
include("evaluator.jl")
include("facade.jl")
include("containers.jl")
include("bindings.jl")
include("mcp.jl")
include("precompile.jl")

"""
Initialize PARI when the module is loaded into a process (REQ-INI-02,
REQ-INI-03). Runs once, never during precompilation; reads the optional
`LIBPARI_STACK_SIZE` configuration and delegates to `_init_libpari!`.
"""
function __init__()
    # Build the concurrency-safe error-trap shim (feature 014). Best-effort:
    # if no C compiler is available, error handling falls back to the
    # milestone-M3 callback (single-threaded-safe).
    _compile_and_load_trap!()
    # Start the PARI worker pool — one sticky worker, with its own PARI
    # context, per Julia OS thread — so concurrent libpari calls run in
    # parallel (feature 013). `_configured_stack_size` is read here, on the
    # loading task, so an invalid `LIBPARI_STACK_SIZE` raises a catchable
    # error at load (REQ-INI-06/07).
    _start_pari_worker_pool!(_configured_stack_size())
    # Register the hint shown when `serve_mcp` is called without the
    # optional MCP extension loaded (no-op for normal use).
    _register_mcp_hint()
    return nothing
end

# The supported-but-unexported surface (M14, REQ-PUB-05). These names are
# documented and stable, but reaching them qualified is deliberate: they
# would be poor unqualified neighbours (`factor`, `isprime` are Primes.jl's
# names; `PARI` is a very broad binding to claim).
#
# `public` is a Julia 1.11 keyword and does not PARSE on the 1.10 LTS floor
# this package supports, so it cannot be written literally. Parsing it at
# load time keeps 1.10 working. A plain run-time `if` is used rather than a
# compile-time conditional: the condition is a Julia version, not a
# platform, and the M9 audit in test/platform_tests.jl reserves
# compile-time conditionals for platform code.
if VERSION >= v"1.11"
    eval(
        Meta.parse(
            "public PARI, PariObject, PariType, PariErr, PariConvertible, " *
            "ConversionError, GenArg, gen_convert, gentype, gen_from, " *
            "protected_call, isexact, nbits2prec, default_precision, " *
            "isprime, nextprime, prevprime, factor, factors, " *
            "is_initialized, library_state, stack_size, nbthreads, serve_mcp",
        ),
    )
end

end # module LibPARI
