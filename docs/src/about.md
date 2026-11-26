# About

## Relationship to PARI/GP

LibPARI.jl is an independent, community-maintained Julia interface to the
[PARI/GP](https://pari.math.u-bordeaux.fr/) computer algebra system. It is
not affiliated with, endorsed by, or maintained by the PARI Group or the
PARI/GP development team.

PARI/GP is developed by the PARI Group and distributed under the GNU General
Public License. LibPARI only calls into the official PARI library, supplied
by [`PARI_jll`](https://github.com/JuliaPackaging/Yggdrasil/tree/master/P/PARI),
and does not modify it.

Any errors in the Julia interface, the high-level API, or this documentation
are the responsibility of LibPARI's maintainers, not of the PARI Group.

## Reporting bugs

- Bugs and feature requests about this Julia wrapper go to
  [LibPARI's issue tracker](https://github.com/s-celles/LibPARI.jl/issues).
- Bugs and feature requests about PARI/GP itself go to the
  [official PARI/GP bug tracker](https://pari.math.u-bordeaux.fr/Bugs/) or
  the [pari-users mailing list](https://pari.math.u-bordeaux.fr/lists-index.html).

## AI assistance

Substantial portions of this code were generated with AI assistance and
reviewed by the maintainer. The repository is tagged with the
[`ai-generated-code`](https://github.com/topics/ai-generated-code) topic.

## Development

The main entry points are recipes in the repository's `justfile` (run them
with [`just`](https://just.systems); `just` alone lists them). Each runs what
CI runs:

| Recipe | What it does |
|---|---|
| `just test` | the test suite (`Pkg.test()`) |
| `just test-threads` | the multi-threaded concurrency suite |
| `just test-no-trap` | the same, without the C trap shim (serial fallback) |
| `just docs` | this documentation, `llms.txt` and `llms-full.txt` (strict: any warning fails) |
| `just format` / `just format-check` | JuliaFormatter, pinned as in CI |
| `just generate` | regenerate `src/bindings.jl` from PARI's `pari.desc` |
| `just check` | format check, tests, threaded suite and docs |

Without `just`, the underlying commands are plain Julia, e.g.:

```sh
julia --project=. -e 'using Pkg; Pkg.test()'
julia --project=docs -e 'using Pkg; Pkg.develop(path = "."); Pkg.instantiate()'
julia --project=docs docs/make.jl
```

Source code is formatted with JuliaFormatter to an 80-column margin, enforced
in CI and by `pre-commit`.

The project follows [Semantic Versioning](https://semver.org/). Notable
changes are recorded in the
[changelog](https://github.com/s-celles/LibPARI.jl/blob/main/CHANGELOG.md),
and the implementation plan is in
[`ROADMAP.md`](https://github.com/s-celles/LibPARI.jl/blob/main/ROADMAP.md).
