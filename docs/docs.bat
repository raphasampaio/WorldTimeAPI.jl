"%JULIA_1103%" --project -e "using Pkg; Pkg.develop(PackageSpec(path=dirname(pwd()))); Pkg.instantiate()"
"%JULIA_1103%" --project make.jl