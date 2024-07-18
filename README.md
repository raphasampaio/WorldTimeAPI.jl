# WorldTimeAPI.jl

<div align="center">
    <a href="https://raphasampaio.github.io/WorldTimeAPI.jl/stable">
        <img src="https://img.shields.io/badge/docs-stable-blue.svg" alt="Stable">
    </a>
    <a href="https://raphasampaio.github.io/WorldTimeAPI.jl/dev">
        <img src="https://img.shields.io/badge/docs-dev-blue.svg" alt="Dev">
    </a>
    <a href="https://github.com/JuliaTesting/Aqua.jl">
        <img src="https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg" alt="Coverage"/>
    </a>    
    <br>
    <a href="https://juliahub.com/ui/Packages/WorldTimeAPI/sHGR0">
        <img src="https://juliahub.com/docs/WorldTimeAPI/version.svg" alt="Version"/>
    </a>
    <a href="https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml">
        <img src="https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml/badge.svg" alt="CI"/>
    </a>
    <a href="https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl">
        <img src="https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl/branch/main/graph/badge.svg" alt="Coverage"/>
    </a>
</div>

## Introduction

WorldTimeAPI.jl is a Julia package that provides a simple interface to the [WorldTimeAPI](http://worldtimeapi.org/).

## Getting Started

### Installation

```julia
julia> ] add WorldTimeAPI
```

### Example
```julia
using WorldTimeAPI

@show dt_utc = WorldTimeAPI.datetime()

@show dt_new_york = WorldTimeAPI.datetime("America/New_York")

@show dt_los_angeles = WorldTimeAPI.datetime("America/Los_Angeles")
```
