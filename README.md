# LibPARI.jl

A Julia wrapper for the [PARI/GP](https://pari.math.u-bordeaux.fr/)
number-theory library.

```julia
using Pkg
Pkg.add("LibPARI")
```

```julia
using LibPARI

pari(2)^100                           # 1267650600228229401496703205376
LibPARI.PARI.nextprime0(pari(1000))    # 1009
gp_eval("sum(k = 1, 100, k^2)")       # 338350
```

**Documentation:** <https://s-celles.github.io/LibPARI.jl>

LibPARI.jl is an independent project, not affiliated with the PARI Group. See
[About](https://s-celles.github.io/LibPARI.jl/dev/about/) for details, bug
reporting, and development notes.
