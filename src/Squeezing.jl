module Squeezing

using MacroTools

export @squeezing

"""
    squeezing(f, args...)

Helper function for [`@squeezing`](@ref). Use the latter.
"""
@inline squeezing(f, args...) = squeeze(f(args...), last(args))

"""
    @squeezing f(A, args...)

Equivalent to `squeeze(f(A, args...), last(args))`. Useful for removing the
singleton dimensions that result from array reductions.

```jldoctest
julia> @squeezing sum(ones(3, 2), 1)
2-element Array{Float64,1}:
 3.0
 3.0
"""
macro squeezing(ex)
    @capture(ex, f_(args__)) || error("Expected a function call")
    :(squeezing($(esc(f)), $(map(esc, args)...)))
end

end # module
