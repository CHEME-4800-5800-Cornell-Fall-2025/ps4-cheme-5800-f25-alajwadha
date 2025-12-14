import numpy as np
from scipy.optimize import minimize

# Load or compute the returns and covariance
# For now, let's see what maximum return is achievable

# Quick test - if all assets have mean return between 0.05-0.20 annualized
# then a target of 0.15 should be feasible

# Test assets
tickers = ["AAPL", "MSFT", "INTC", "MU", "AMD", "GS", "BAC", "WFC", "C", "F", "GM", 
    "JNJ", "PG", "UPS", "COST", "TGT", "WMT", "MRK", "PFE", "ADBE"]

# Mock returns - these should be read from the actual data
# For the test, assume reasonable market returns
mock_returns = np.array([0.18, 0.20, 0.12, 0.15, 0.14, 0.10, 0.08, 0.09, 0.07, 0.05, 0.06,
                          0.12, 0.10, 0.11, 0.16, 0.13, 0.09, 0.14, 0.11, 0.17])

print(f"Max return in portfolio: {np.max(mock_returns):.4f}")
print(f"Min return in portfolio: {np.min(mock_returns):.4f}")
print(f"Mean return: {np.mean(mock_returns):.4f}")
print(f"Target return of 0.15 is {'FEASIBLE' if np.max(mock_returns) >= 0.15 else 'INFEASIBLE'}")
