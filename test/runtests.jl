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

    wt_vector = Vector{DateTime}()
    jl_vector = Vector{DateTime}()

    for i in 1:1000
        if i % 2 == 0
            wt = WorldTimeAPI.datetime()
            jl = Dates.now(UTC)

            push!(wt_vector, wt)
            push!(jl_vector, jl)
        else
            jl = Dates.now(UTC)
            wt = WorldTimeAPI.datetime()

            push!(wt_vector, wt)
            push!(jl_vector, jl)
        end
    end

    @test year_average(wt_vector) ≈ year_average(jl_vector) rtol = 1e-2
    @test month_average(wt_vector) ≈ month_average(jl_vector) rtol = 1e-2
    @test day_average(wt_vector) ≈ day_average(jl_vector) rtol = 1e-2
    @test hour_average(wt_vector) ≈ hour_average(jl_vector) rtol = 1e-2
    @test minute_average(wt_vector) ≈ minute_average(jl_vector) rtol = 1e-2

    return nothing
end

test_all()
