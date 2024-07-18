using WorldTimeAPI

using Aqua
using Dates
using Test

function year_average(vector)
    return sum(Dates.year.(vector)) / length(vector)
end

function month_average(vector)
    return sum(Dates.month.(vector)) / length(vector)
end

function day_average(vector)
    return sum(Dates.day.(vector)) / length(vector)
end

function hour_average(vector)
    return sum(Dates.hour.(vector)) / length(vector)
end

function minute_average(vector)
    return sum(Dates.minute.(vector)) / length(vector)
end

function test_all()
    @testset "Aqua.jl" begin
        @testset "Ambiguities" begin
            Aqua.test_ambiguities(WorldTimeAPI, recursive = false)
        end
        Aqua.test_all(WorldTimeAPI, ambiguities = false)
    end

    d1 = Vector{DateTime}()
    d2 = Vector{DateTime}()

    for i in 1:100
        if i % 2 == 0
            push!(d1, WorldTimeAPI.datetime())
            push!(d2, Dates.now(UTC))
        else
            push!(d2, Dates.now(UTC))
            push!(d1, WorldTimeAPI.datetime())
        end
    end

    @test year_average(d1) ≈ year_average(d2)
    @test month_average(d1) ≈ month_average(d2)
    @test day_average(d1) ≈ day_average(d2)
    @test hour_average(d1) ≈ hour_average(d2)
    @test minute_average(d1) ≈ minute_average(d2)

    return nothing
end

test_all()
