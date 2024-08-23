using WorldTimeAPI

using Aqua
using Dates
using HTTP
using Test

function test_aqua()
    @testset "Ambiguities" begin
        Aqua.test_ambiguities(WorldTimeAPI, recursive = false)
    end
    Aqua.test_all(WorldTimeAPI, ambiguities = false)

    return nothing
end

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

function test_worldtimeapi()
    @test_throws HTTP.Exceptions.StatusError WorldTimeAPI.fetch("invalid")

    wt_vector = Vector{DateTime}()
    jl_vector = Vector{DateTime}()

    for i in 1:10
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

    @test year_average(wt_vector) ≈ year_average(jl_vector) rtol = 1e-1
    @test month_average(wt_vector) ≈ month_average(jl_vector) rtol = 1e-1
    @test day_average(wt_vector) ≈ day_average(jl_vector) rtol = 1e-1
    @test hour_average(wt_vector) ≈ hour_average(jl_vector) rtol = 1e-1

    return nothing
end

function test_all()
    @testset "Aqua.jl" begin
        test_aqua()
    end

    @testset "WorldTimeAPI.jl" begin
        test_worldtimeapi()
    end

    return nothing
end

test_all()
