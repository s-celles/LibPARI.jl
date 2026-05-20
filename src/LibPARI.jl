"""
    LibPARI

A Julia wrapper for the PARI/GP number-theory library.

Milestone M1 brings the library to life: loading this module initializes
PARI and registers a process-exit shutdown. The lifecycle is observable
through `LibPARI.is_initialized`, `LibPARI.library_state`, and
`LibPARI.stack_size`. No PARI computational functions are exposed yet — those
arrive in later milestones.
"""
module LibPARI

import PARI_jll
using DocStringExtensions

include("lifecycle.jl")
include("gen.jl")
include("errors.jl")
include("conversions.jl")
include("numeric.jl")
include("bindings.jl")

"""
Initialize PARI when the module is loaded into a process (REQ-INI-02,
REQ-INI-03). Runs once, never during precompilation; reads the optional
`LIBPARI_STACK_SIZE` configuration and delegates to `_init_libpari!`.
"""
function __init__()
    _init_libpari!(_configured_stack_size(), _DEFAULT_MAXPRIME)
    _install_error_handlers!()
    return nothing
end

end # module LibPARI
