using Squeezing
using Compat.Test

@testset "squeezing sum" begin
    @test @inferred @squeezing(sum(ones(3, 2), 1)) == [3.0, 3.0]
end

@testset "squeezing reducedim" begin
    A = reshape(Vector(1:16), (4,4))
    @test @inferred @squeezing(reducedim(max, A, 1)) == collect(4:4:16)
    @test @inferred @squeezing(reducedim(max, A, 2)) == collect(13:16)
end
