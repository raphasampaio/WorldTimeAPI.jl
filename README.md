# WorldTimeAPI.jl

[![CI](https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/raphasampaio/WorldTimeAPI.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl/graph/badge.svg?token=QZpOrYanH3)](https://codecov.io/gh/raphasampaio/WorldTimeAPI.jl)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Introduction

WorldTimeAPI.jl is a lightweight Julia package that offers a convenient interface to interact with the [WorldTimeAPI](http://worldtimeapi.org/). Easily retrieve the current time and date for any specified timezone, or use UTC by default.

## Getting Started

### Installation

```julia
julia> ] add WorldTimeAPI
```

### Example
```julia
using WorldTimeAPI

# get the current UTC datetime
@show dt_utc = WorldTimeAPI.datetime()

# get the current datetime for New York
@show dt_new_york = WorldTimeAPI.datetime("America/New_York")

# get the current datetime for Los Angeles
@show dt_los_angeles = WorldTimeAPI.datetime("America/Los_Angeles")
```

## Contributing

Contributions, bug reports, and feature requests are welcome! Feel free to open an issue or submit a pull request.