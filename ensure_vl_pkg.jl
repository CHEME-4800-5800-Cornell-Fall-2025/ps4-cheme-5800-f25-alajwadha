using Pkg
Pkg.activate(".")
try
    import VLDataScienceMachineLearningPackage
    println("VLDataScienceMachineLearningPackage already available")
catch
    println("Adding VLDataScienceMachineLearningPackage from Git URL...")
    Pkg.add(url="https://github.com/varnerlab/VLDataScienceMachineLearningPackage.jl.git")
    Pkg.precompile()
end
