```@meta
CurrentModule = LibPARI
```

# MCP connector

LibPARI ships an optional **MCP (Model Context Protocol) connector** — a
Julia package extension that exposes PARI/GP to AI assistants and agents.
An MCP client can then run exact number theory through PARI — factorisation,
primality testing, modular arithmetic, elliptic curves — instead of
approximating or hallucinating it.

## Optional by design

The connector is a **package extension**. Its code, and its dependency
`ModelContextProtocol`, exist in your process only if you deliberately load
the MCP library. A project that depends on `LibPARI` alone installs no MCP
stack, loads no connector code, and behaves exactly as without this feature.
Installing LibPARI never installs `ModelContextProtocol`.

## Setup

Install the MCP server library once:

```julia
using Pkg
Pkg.add("ModelContextProtocol")
```

## Running the server

Loading `ModelContextProtocol` alongside `LibPARI` activates the connector.
A one-line launcher script is the MCP server:

```julia
# libpari_mcp.jl
using LibPARI
using ModelContextProtocol      # activates the connector
LibPARI.serve_mcp()             # serve over stdio (blocking)
```

Configure any MCP client (for example Claude Desktop) to run it as a server:

```bash
julia --project=. libpari_mcp.jl
```

## The tools

The connector advertises three MCP tools:

| Tool | Purpose | Example arguments |
|------|---------|-------------------|
| `pari_eval` | Evaluate a GP-language expression — reaches **every** PARI function | `{"expression": "factor(2^67-1)"}` |
| `pari_functions` | List or search PARI's functions | `{"query": "prime"}` |
| `pari_help` | Return a PARI function's help text | `{"name": "nextprime"}` |

Because a GP expression can call any PARI function, `pari_eval` alone already
exposes the whole of PARI; `pari_functions` and `pari_help` let an agent
discover what to put in an expression.

Every tool is robust: a malformed expression, an unknown function, or a PARI
error (division by zero, a domain error) is returned to the client as a
**structured error**, and the server keeps running.

## Example prompts

Once the connector is running and your MCP client is connected, just ask your
AI assistant in plain English — it calls the PARI tools and reports the exact
answer.

!!! tip "Name LibPARI in your prompt"
    If your MCP client also has other computer-algebra servers connected
    (for example a Giac/Xcas server), **name LibPARI explicitly** so the
    assistant routes the request to this server. Say "LibPARI" (the server
    is registered as `libpari`), or name a tool directly — `pari_eval`,
    `pari_functions`, or `pari_help`. The prompts below all do this.

Try prompts like these, from simple to advanced:

**Basic arithmetic**

- "Using LibPARI, what is 2 to the power of 100?"
- "With LibPARI, compute 100 factorial."
- "Ask LibPARI for the greatest common divisor of 1071 and 462."

**Primes**

- "Using LibPARI, is 2^127 - 1 a prime number?"
- "With LibPARI, what is the next prime after one billion?"
- "Using LibPARI, how many prime numbers are there below one million?"

**Factorisation & number theory**

- "Using LibPARI, give me the prime factorisation of 2^67 - 1."
- "With LibPARI, what is Euler's totient of 1000000?"
- "Ask LibPARI for the sum of the divisors of 360."
- "Using LibPARI, how many divisors does 720 have?"

**Polynomials & symbolic**

- "Using LibPARI, factor the polynomial x^4 - 1."
- "With LibPARI, find the roots of x^3 - 2."

**Modular & advanced**

- "Using LibPARI, compute 2 raised to the power 1000000, modulo 1000000007."
- "With LibPARI, what is the trace of Frobenius of the elliptic curve y^2 = x^3 + 1 at the prime 101?"

**Exploring PARI**

- "Using LibPARI, which PARI functions deal with elliptic curves?"
- "With LibPARI, show me the help for the nextprime function."
- "Use LibPARI's `pari_functions` tool to list what is available for primality testing."

The assistant turns each request into a `pari_eval`, `pari_functions`, or
`pari_help` call and answers with PARI's exact result. The next section shows
the underlying tool calls.

## Quick examples

A tour of PARI through the connector, from simple to advanced — every result
below is exact. Each row is a `pari_eval` call: the `expression` argument and
the result the tool returns.

### Start here — basic arithmetic

| `expression` | Result |
|---|---|
| `2 + 2` | `4` |
| `2^100` | `1267650600228229401496703205376` |
| `10!` | `3628800` |
| `1/3 + 1/6` | `1/2` (exact rationals) |
| `gcd(1071, 462)` | `21` |

### Primes

| `expression` | Result |
|---|---|
| `isprime(97)` | `1` (true) |
| `nextprime(1000)` | `1009` |
| `primepi(1000)` | `168` (number of primes ≤ 1000) |
| `isprime(2^127 - 1)` | `1` (the Mersenne prime M₁₂₇) |

### Factorisation & number theory

| `expression` | Result |
|---|---|
| `factor(360)` | `[2 3; 3 2; 5 1]` — rows are `[prime, exponent]`: 2³·3²·5 |
| `eulerphi(100)` | `40` (Euler's totient) |
| `sigma(12)` | `28` (sum of divisors) |
| `binomial(20, 10)` | `184756` |
| `factor(2^67 - 1)` | `[193707721 1; 761838257287 1]` (Cole's 1903 factorisation) |

### Modular, symbolic & numeric

| `expression` | Result |
|---|---|
| `sum(k=1, 100, k^2)` | `338350` (a GP-closure function) |
| `lift(Mod(2, 1000000007)^1000000)` | `235042059` (modular exponentiation) |
| `factor(x^4 - 1)` | factors `x - 1`, `x + 1`, `x^2 + 1` |
| `polroots(x^3 - 2)` | `≈ 1.259921` (the real ∛2) and two complex conjugate roots |
| `ellap(ellinit([0,1]), 101)` | `0` (trace of Frobenius — `0` ⇒ supersingular at 101) |

### Discovery — `pari_functions` and `pari_help`

| Tool | Arguments | Result |
|---|---|---|
| `pari_functions` | `{"query": "ellis"}` | `elliscm`, `ellisdivisible`, `ellisogeny`, `ellisoncurve`, … |
| `pari_help` | `{"name": "nextprime"}` | `nextprime(x): smallest pseudoprime >= x.` |

!!! note
    `pari_eval` speaks the full GP language, so it reaches every PARI
    function (`factor`, `sum`, …). `pari_functions` and `pari_help` introspect
    the **generated binding layer**, whose names are PARI's C-level names — a
    few GP names (such as `factor`) are not binding names there, even though
    they work inside a `pari_eval` expression.

## Entry point

```@docs
LibPARI.serve_mcp
```
