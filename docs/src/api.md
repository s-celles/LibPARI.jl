```@meta
CurrentModule = LibPARI
```

# API reference

LibPARI exposes PARI/GP to Julia through two layers: a large
machine-generated binding layer, and a compact hand-written core. This page
documents both.

## The generated bindings — `LibPARI.PARI`

The `LibPARI.PARI` submodule holds over 1200 bindings, one per eligible
PARI/GP function, generated directly from PARI's own machine-readable
function database (`pari.desc`). Each binding:

- keeps PARI's function name (e.g. `LibPARI.PARI.nextprime`,
  `LibPARI.PARI.factorial`, `LibPARI.PARI.isprime`);
- carries PARI's own `Help` text as its docstring — query it with `?` at the
  REPL, e.g. `?LibPARI.PARI.nextprime`;
- takes and returns [`Gen`](@ref) values (or the scalar Julia type the
  function's prototype calls for), and is type-stable;
- routes through the same safe, leak-free, thread-safe call boundary as the
  hand-written API.

A few prototype conventions are worth knowing:

- **Precision arguments** are supplied automatically; pass a `prec` keyword
  to override the working precision.
- **Optional arguments** are exposed as keyword arguments with PARI's
  declared defaults.
- **Output arguments** are returned alongside the primary result as a tuple.
- Functions taking a **GP closure** argument are not generated — reach them
  through [`gp_eval`](@ref) instead.

Because the binding layer is generated, it is not enumerated symbol-by-symbol
here; PARI's own [function reference](https://pari.math.u-bordeaux.fr/doc.html)
is the authoritative index of what each function computes. The rest of this
page documents the hand-written core in full.

## Hand-written core

```@index
Pages = ["api.md"]
```

### Library lifecycle

```@docs
LibPARI.LibraryState
```

```@autodocs
Modules = [LibPARI]
Pages = ["lifecycle.jl"]
```

### The `Gen` value type

```@autodocs
Modules = [LibPARI]
Pages = ["gen.jl"]
```

```@docs
LibPARI.PariType
```

### Error handling

```@docs
LibPARI.PariErr
```

```@autodocs
Modules = [LibPARI]
Pages = ["errors.jl"]
```

### Type conversions

```@autodocs
Modules = [LibPARI]
Pages = ["conversions.jl"]
```

### Numeric API

```@autodocs
Modules = [LibPARI]
Pages = ["numeric.jl"]
```

### GP expression evaluator

```@autodocs
Modules = [LibPARI]
Pages = ["evaluator.jl"]
```

### Module

```@autodocs
Modules = [LibPARI]
Pages = ["LibPARI.jl"]
```
