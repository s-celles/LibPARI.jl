# LibPARI.jl

A Julia wrapper for the [PARI/GP](https://pari.math.u-bordeaux.fr/)
number-theory library.

> **Status — early development.** Milestone M0 (project scaffolding) is in
> progress. No PARI functionality is exposed yet; see
> [`ROADMAP.md`](ROADMAP.md) for the plan.

## Installation

`LibPARI` depends on `PARI_jll`, which is not yet in the Julia General
registry (Yggdrasil PR #13771). Until it is registered, resolve it from a
local development build:

```julia
using Pkg
Pkg.develop(path = joinpath(homedir(), ".julia", "dev", "PARI_jll"))
Pkg.develop(path = "path/to/LibPARI.jl")
```

See
[`specs/001-m0-scaffolding-baseline/quickstart.md`](specs/001-m0-scaffolding-baseline/quickstart.md)
for the full contributor setup and verification steps.

## Development

- Tests: `julia --project=. -e 'using Pkg; Pkg.test()'`
- Formatting: 80-column margin, enforced by JuliaFormatter and `pre-commit`.
- Contributions follow Semantic Versioning and "Keep a Changelog"
  ([`CHANGELOG.md`](CHANGELOG.md)).
