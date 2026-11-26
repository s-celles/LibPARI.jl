# ===========================================================================
# llms.txt / llms-full.txt generator, following https://llmstxt.org.
#
# `llms.txt` indexes the documentation pages; `llms-full.txt` concatenates
# their Markdown source. Both are written into the Documenter build directory
# so `deploydocs` publishes them at the site root, next to `index.html`.
# ===========================================================================

const LLMS_SITE = "https://s-celles.github.io/LibPARI.jl/dev"

const LLMS_SUMMARY = """
LibPARI.jl is a Julia wrapper for the PARI/GP number-theory library. It \
exposes a `Gen` value type wrapping every PARI object, idiomatic arithmetic \
and conversions, nearly 1200 bindings generated from PARI's `pari.desc` \
under `LibPARI.PARI`, and `gp_eval` for any GP-language expression.
"""

"First level-1 Markdown heading of `path`, or `fallback`."
function llms_page_title(path, fallback)
    for line in eachline(path)
        startswith(line, "# ") && return strip(line[3:end])
    end
    return fallback
end

"Public URL of a page, matching Documenter's pretty URLs."
function llms_page_url(file)
    stem = replace(file, r"\.md$" => "")
    return stem == "index" ? "$LLMS_SITE/" : "$LLMS_SITE/$stem/"
end

"""
    generate_llms_txt(build_dir, source_dir, pages)

Write `llms.txt` and `llms-full.txt` into `build_dir` from the Markdown
sources in `source_dir`, in the order of `pages` (`label => file` pairs, as
passed to `makedocs`). Errors if a listed page is missing.
"""
function generate_llms_txt(build_dir, source_dir, pages)
    entries = map(pages) do (label, file)
        path = joinpath(source_dir, file)
        isfile(path) || error("llms.txt: page $file listed but not found")
        (llms_page_title(path, label), llms_page_url(file), path)
    end

    open(joinpath(build_dir, "llms.txt"), "w") do io
        println(io, "# LibPARI.jl\n")
        println(io, "> ", strip(LLMS_SUMMARY), "\n")
        println(io, "## Documentation\n")
        for (title, url, _) in entries
            println(io, "- [$title]($url)")
        end
        println(io, "\n## Optional\n")
        println(
            io,
            "- [Full documentation in one file]($LLMS_SITE/llms-full.txt)",
        )
    end

    open(joinpath(build_dir, "llms-full.txt"), "w") do io
        println(io, "# LibPARI.jl\n")
        println(io, "> ", strip(LLMS_SUMMARY))
        for (title, url, path) in entries
            println(io, "\n\n---\n")
            println(io, "Source: $url\n")
            print(io, read(path, String))
        end
    end

    return nothing
end
