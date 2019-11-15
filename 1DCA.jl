#=
Created on Friday 15 November 2019
Last update: -

@author: Michiel Stock
michielfmstock@gmail.com

Simulation for 1D CA.
=#

abstract type CARule end

struct DetCARule <: CARule
    rulenr::Int8
    rulestr::BitArray
end

function CARule(rulenr::Int)
    @assert 0 ≤ rulenr < 2^8
    rulenr = Int8(rulenr)
    bstr = bitstring(rulenr)
    rulestr = reverse([c=='1' for c in bstr])
    return DetCARule(rulenr, rulestr)
end

nextstate(x::Bool, y::Bool, z::Bool, rule::CARule) = rule.rulestr[4x+2y+1z+1]

function update!(x, xnew, rule::DetCARule)
    xnew[1] = nextstate(x[end], x[1], x[2], rule)
    @simd for i in 2:length(x)-1
        @inbounds xnew[i] = nextstate(x[i-1], x[i], x[i+1], rule)
    end
    xnew[1] = nextstate(x[end-1], x[end], x[1], rule)
    return xnew
end

function simulate(x₀, rule::CARule; nsteps::Int=100)
    n = length(x₀)
    X = Array{Bool,2}(undef, nsteps+1, n)
    X[1,:] .= x₀
    x = copy(x₀)
    xnew = similar(x₀)
    for t in 1:nsteps
        update!(x, xnew, rule)
        X[t+1,:] = x
        x = xnew
    end
    return X
end

using Plots

x₀ = zeros(Bool, 20010)

x₀[10001] = true

#x₀ = rand(Bool, 1000)

rule = CARule(30)

X = simulate(x₀, rule, nsteps=10000)
heatmap(1X)
