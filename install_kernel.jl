using Pkg
Pkg.activate(".")
using IJulia
name = "Julia 1.12 (PS4 Project)"
# Ensure kernel runs with this project's environment
envdict = Dict("JULIA_PROJECT" => Base.active_project())
IJulia.installkernel(name; env=envdict)
println("Installed IJulia kernel: " * name)
