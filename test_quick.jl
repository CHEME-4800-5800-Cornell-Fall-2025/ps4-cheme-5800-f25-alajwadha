include("Include-student.jl");

# Quick test
println("Testing SA implementation...")

# Create a small portfolio
my_tickers = ["AAPL", "MSFT"];
ḡ_test = [0.15, 0.12];
Σ_test = [0.04 0.02; 0.02 0.05];
w_init = [0.5, 0.5];

model = build(MySimulatedAnnealingMinimumVariancePortfolioAllocationProblem, (
    w = w_init,
    ḡ = ḡ_test,
    Σ̂ = Σ_test,
    R = 0.15,
));

println("Running SA solver...")
updated_model = solve(model, K = 50, T₀ = 1.0, T₁ = 0.01,
    α = 0.85, β = 0.02, τ = 0.85, μ = 0.1, ρ = 0.002);

println("Final weights: ", updated_model.w)
println("Sum of weights: ", sum(updated_model.w))
println("Portfolio return: ", transpose(updated_model.w) * ḡ_test)
