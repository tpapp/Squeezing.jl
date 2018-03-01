# Squeezing

[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/tpapp/Squeezing.jl.svg?branch=master)](https://travis-ci.org/tpapp/Squeezing.jl)
[![Coverage Status](https://coveralls.io/repos/tpapp/Squeezing.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tpapp/Squeezing.jl?branch=master)
[![codecov.io](http://codecov.io/github/tpapp/Squeezing.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/Squeezing.jl?branch=master)

Convenient syntax for removing singleton dimensions from array reductions.

## Installation

This package is not (yet) registered. Run
```julia
Pkg.clone("https://github.com/tpapp/Squeezing.jl.git")
```
to install it.

## Usage

Just put `@squeezing` before reducing expressions.

```julia
julia> using Squeezing

julia> @squeezing sum(ones(3, 2), 1)
2-element Array{Float64,1}:
 3.0
 3.0

julia> @squeezing reducedim(max, A, 1)
4-element Array{Int64,1}:
  4
  8
 12
 16
```

Don't forget the `()` if using it as part of an expression:

```julia
@squeezing(sum(ones(3, 2), 1)) == [3.0, 3.0]
```

## How it works

`@squeezing f(args...)` is equivalent to `squeeze(f(args...), last(args))`. It preserves type stability.

## Related

Issue [#16606](https://github.com/JuliaLang/julia/issues/16606), PR [#23500](https://github.com/JuliaLang/julia/pull/23500), [discussion](https://discourse.julialang.org/t/sum-squeeze-as-one-function/2471/11).
