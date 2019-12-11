using LinearAlgebra

function gradient_descent(P, q, x₀; α=0.1,
                maxiter=1000, ϵ=1e-5)
    x = copy(x₀)
    ∇f = x -> P * x + q
    Δx = -∇f(x)
    iter = 0
    while norm(Δx) > ϵ || iter ≤ maxiter
        iter += 1
        x .+= α * Δx
        Δx .= - ∇f(x)
    end
    return x
end

P = [10.0 -1.0;
    -1.0 1.0];
q = [0; -10.0];
x₀ = zeros(2);
