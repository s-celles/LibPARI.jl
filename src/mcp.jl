# ---------------------------------------------------------------------------
# MCP connector — entry point. The connector itself is the optional package
# extension `LibPARIMCPExt` (ext/LibPARIMCPExt.jl), loaded only when
# `ModelContextProtocol` is loaded alongside `LibPARI`. This file holds just
# the always-present stub and a `MethodError` hint. Included by src/LibPARI.jl.
# ---------------------------------------------------------------------------

"""
    serve_mcp(; start::Bool = true, name = "libpari", version = "0.12.0")

Start an MCP (Model Context Protocol) server that exposes PARI/GP to MCP
clients — AI assistants and agents.

`serve_mcp` is provided by an **optional package extension**. It has a
callable method only once `ModelContextProtocol` is loaded alongside
`LibPARI`:

```julia
using LibPARI
using ModelContextProtocol   # activates the connector
LibPARI.serve_mcp()          # serve over stdio (blocking)
```

The server exposes three tools: `pari_eval` (evaluate a GP expression —
reaches every PARI function), `pari_functions` (list and search PARI
functions), and `pari_help` (a function's help text). With `start = false`
the configured server is returned without being started.

Calling `serve_mcp` without `ModelContextProtocol` loaded raises a
`MethodError` whose hint tells you to load it. Installing `LibPARI` does not
install `ModelContextProtocol` — the connector is strictly optional.

# Examples

```jldoctest
julia> using LibPARI

julia> LibPARI.serve_mcp isa Function
true
```
"""
function serve_mcp end

# Without the MCP extension loaded, calling `serve_mcp` gives a bare
# `MethodError` — accurate but unhelpful. This hint, registered from
# `__init__`, turns it into actionable guidance.
function _register_mcp_hint()
    Base.Experimental.register_error_hint(
        MethodError,
    ) do io, exc, _argtypes, _kwargs
        if exc.f === serve_mcp
            print(
                io,
                "\n\nLibPARI's MCP connector is an optional package ",
                "extension. Load `ModelContextProtocol` to enable ",
                "`serve_mcp`:\n\n    using ModelContextProtocol\n",
            )
        end
        return nothing
    end
    return nothing
end
