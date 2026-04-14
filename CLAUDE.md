# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

WorldTimeAPI.jl is a Julia package that wraps the [WorldTimeAPI](http://worldtimeapi.org/) to retrieve current date/time for any timezone. It exposes two functions: `fetch(timezone)` (raw API response) and `datetime(timezone)` (parsed `DateTime`).

## Common Commands

**Run tests:**
```bash
julia --project=. -e 'using Pkg; Pkg.test()'
```

**Format code (uses JuliaFormatter with project-specific config in `.JuliaFormatter.toml`):**
```bash
julia --project=format format/format.jl
```

**Start a Revise.jl dev session:**
```bash
julia --project=revise -i revise/revise.jl
```

## Architecture

Single-module package in `src/WorldTimeAPI.jl` with two public functions:
- `WorldTimeAPI.fetch(timezone)` — HTTP GET to worldtimeapi.org with retry (up to 10 attempts, exponential backoff via `sleep(i)`)
- `WorldTimeAPI.datetime(timezone="Etc/UTC")` — calls `fetch`, parses the `datetime` field into a `Dates.DateTime`

Dependencies: `HTTP`, `JSON`, `Dates`.

## Testing

Tests live in `test/runtests.jl`. Two test groups:
- **Aqua.jl** — package quality checks (ambiguities, unbound args, etc.)
- **WorldTimeAPI.jl** — integration tests that call the live API and compare results against `Dates.now(UTC)`

Tests require network access to worldtimeapi.org.

## Formatting

JuliaFormatter config is in `.JuliaFormatter.toml`. Key settings: 4-space indent, 120-char margin, `always_use_return = true`, `trailing_comma = true`. CI enforces formatting on every push/PR.

## Julia Version Compatibility

Supports Julia 1.6 through 1.11. CI tests across all these versions on Ubuntu and Windows.
