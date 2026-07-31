# ===========================================================================
# LibPARI documentation build (milestone M10).
#
# Builds the Documenter.jl site and executes every `jldoctest` example in the
# hand-written docstrings. The build is STRICT: `makedocs` runs with
# `warnonly = false` (the default), so any warning — a missing docstring, an
# undocumented public symbol, a broken cross-reference, or a doctest mismatch
# — aborts the build with a non-zero exit (REQ-DOC-04, REQ-DOC-05).
#
# Build locally:
#     julia --project=docs -e 'using Pkg; \
#         Pkg.develop(path = "."); Pkg.instantiate()'
#     julia --project=docs docs/make.jl
# ===========================================================================

using LibPARI
using Documenter

# `using LibPARI` is the implicit preamble of every `jldoctest` block.
DocMeta.setdocmeta!(LibPARI, :DocTestSetup, :(using LibPARI); recursive = true)

makedocs(;
    modules = [LibPARI],
    authors = "Sébastien Celles <s.celles@gmail.com>",
    sitename = "LibPARI.jl",
    format = Documenter.HTML(;
        canonical = "https://s-celles.github.io/LibPARI.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = [
        "Home" => "index.md",
        "Getting started" => "getting-started.md",
        "API reference" => "api.md",
        "Precision" => "precision.md",
        "API redesign" => "api-redesign.md",
        "MCP connector" => "mcp.md",
    ],
    doctest = true,
    # The ~1200 generated `LibPARI.PARI` bindings each carry PARI's `Help`
    # text as a docstring; they are documented in bulk on the API-reference
    # page, not spliced one by one. `checkdocs = :exports` scopes the
    # orphan-docstring check to exported names — LibPARI exports nothing, so
    # the generated layer is not flagged, while every hand-written docstring
    # is still rendered (via `@autodocs`) and doctested.
    checkdocs = :exports,
)

deploydocs(; repo = "github.com/s-celles/LibPARI.jl", devbranch = "main")
