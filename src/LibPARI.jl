"""
    LibPARI

A Julia wrapper for the PARI/GP number-theory library.

Loading this module initializes the embedded PARI library once for the
process and registers a clean shutdown at process exit. LibPARI exposes
PARI/GP in two ways: over 1200 functions generated from PARI's own function
database, reachable through the `LibPARI.PARI` submodule, and a hand-written
core — the `Gen` value type, idiomatic numeric operators, conversions to and
from Julia numbers, the `gp_eval` expression evaluator, and safe library
lifecycle and error handling.

The lifecycle is observable through `LibPARI.is_initialized`,
`LibPARI.library_state`, and `LibPARI.stack_size`.
"""
module LibPARI

import PARI_jll
using DocStringExtensions
using PrecompileTools

include("concurrency.jl")
include("lifecycle.jl")
include("gen.jl")
include("errors.jl")
include("conversions.jl")
include("numeric.jl")
include("evaluator.jl")
include("bindings.jl")
include("mcp.jl")
include("precompile.jl")

"""
Initialize PARI when the module is loaded into a process (REQ-INI-02,
REQ-INI-03). Runs once, never during precompilation; reads the optional
`LIBPARI_STACK_SIZE` configuration and delegates to `_init_libpari!`.
"""
function __init__()
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

end # module LibPARI
