# WorldTimeAPI.jl

[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://raphasampaio.github.io/WorldTimeAPI.jl/stable)
[![CI](https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl/graph/badge.svg?token=QZpOrYanH3)](https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

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
