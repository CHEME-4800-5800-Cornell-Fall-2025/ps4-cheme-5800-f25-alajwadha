# Quick smoke test for SA solver
using Random
# include project files via Include-student to ensure required packages are loaded
include("Include-student.jl")

# small synthetic problem
n = 6
w0 = 0.01*ones(n)
ḡ = rand(n)*0.2
A = rand(n,n)
Σ = A' * A + 1e-6*I # make PSD
R = mean(ḡ)

model = build(MySimulatedAnnealingMinimumVariancePortfolioAllocationProblem, (w = w0, ḡ = ḡ, Σ̂ = Σ, R = R))

println("Calling solver...")
try
    m = solve(model, K = 2000, T₀ = 1.0, T₁ = 1e-3, α = 0.9, β = 0.02, τ = 0.95, μ = 0.5, ρ = 0.1; verbose = false)
    println("sum(w) = ", sum(m.w))
    println("min(w) = ", minimum(m.w))
    println("ret = ", transpose(m.w) * ḡ)
    println("risk = ", transpose(m.w) * Σ * m.w)
catch e
    println("Solver failed: ", e)
    rethrow()
end
