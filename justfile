# Main entry points for LibPARI.jl development. `just` lists them.
# Each recipe runs what CI runs (.github/workflows/CI.yml).

julia := "julia --color=yes --startup-file=no"

# List the recipes
default:
    @just --list

# Install the package environment
instantiate:
    {{julia}} --project=. -e 'using Pkg; Pkg.instantiate()'

# Run the test suite (one thread, as `Pkg.test` in CI)
test:
    {{julia}} --project=. -e 'using Pkg; Pkg.test()'

# Run the multi-threaded concurrency suite (the CI stress step)
test-threads:
    {{julia}} --project=. --threads=auto -e 'using Pkg; Pkg.instantiate(); include("test/concurrency_tests.jl")'

# Run the concurrency suite without the C trap shim (serial fallback mode)
test-no-trap:
    LIBPARI_DISABLE_TRAP=1 {{julia}} --project=. --threads=auto -e 'using Pkg; Pkg.instantiate(); include("test/concurrency_tests.jl")'

# Run everything CI gates on: format check, tests, threaded suite, docs
check: format-check test test-threads docs

# Build the documentation, llms.txt and llms-full.txt (strict: warnings fail)
docs:
    {{julia}} --project=docs -e 'using Pkg; Pkg.develop(path = "."); Pkg.instantiate()'
    {{julia}} --project=docs docs/make.jl

# Format src/, test/, ext/ and the docs scripts (JuliaFormatter, pinned as in CI)
format:
    {{julia}} -e 'using Pkg; Pkg.activate(temp = true); Pkg.add(name = "JuliaFormatter", version = "2.14"; io = devnull); using JuliaFormatter; format(["src", "test", "ext", "docs/make.jl", "docs/llms.jl"])'

# Check formatting without changing files (the CI format gate)
format-check:
    {{julia}} -e 'using Pkg; Pkg.activate(temp = true); Pkg.add(name = "JuliaFormatter", version = "2.14"; io = devnull); using JuliaFormatter; format(["src", "test"]; overwrite = false) || error("Formatting check failed: run `just format`.")'

# Regenerate src/bindings.jl from PARI_jll's pari.desc
generate:
    {{julia}} --project=gen -e 'using Pkg; Pkg.instantiate()'
    {{julia}} --project=gen gen/generate.jl

# Remove build outputs
clean:
    rm -rf docs/build
