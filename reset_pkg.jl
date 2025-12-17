using Pkg
# Activate this workspace project
Pkg.activate(".")
# Resolve and instantiate dependencies
Pkg.resolve()
Pkg.instantiate()
# Precompile all deps
Pkg.precompile()
println("Pkg ops complete")
# Try loading the problematic package to confirm
try
    @info "Testing VLDataScienceMachineLearningPackage import"
    @time @eval using VLDataScienceMachineLearningPackage
    println("VLDataScienceMachineLearningPackage loaded successfully")
catch err
    @warn "Failed to load VLDataScienceMachineLearningPackage" error=err
end
