using Documenter
using WorldTimeAPI

DocMeta.setdocmeta!(WorldTimeAPI, :DocTestSetup, :(using WorldTimeAPI); recursive = true)

makedocs(
    sitename = "WorldTimeAPI",
    modules = [WorldTimeAPI],
    authors = "Raphael Araujo Sampaio",
    repo = "https://github.com/raphasampaio/WorldTimeAPI.jl/blob/{commit}{path}#{line}",
    doctest = true,
    clean = true,
    format = Documenter.HTML(
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://raphasampaio.github.io/WorldTimeAPI.jl",
        edit_link = "main",
        assets = [
            "assets/favicon.ico",
        ],
    ),
    pages = [
        "Home" => "index.md",
    ],
)

deploydocs(
    repo = "github.com/raphasampaio/WorldTimeAPI.jl.git",
    devbranch = "main",
    push_preview = true,
)
