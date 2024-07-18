using WorldTimeAPI

using Aqua
using Dates
using Test

function test_all()
    @testset "Aqua.jl" begin
        @testset "Ambiguities" begin
            Aqua.test_ambiguities(WorldTimeAPI, recursive = false)
        end
        Aqua.test_all(WorldTimeAPI, ambiguities = false)
    end

    d1, d2 = WorldTimeAPI.datetime(), Dates.now(UTC)

    @test Dates.year(d1) == Dates.year(d2)
    @test Dates.month(d1) == Dates.month(d2)
    @test Dates.day(d1) == Dates.day(d2)
    @test Dates.hour(d1) == Dates.hour(d2)
    @test Dates.minute(d1) == Dates.minute(d2)

    WorldTimeAPI.datetime("not existent timezone")

    return nothing
end

test_all()
