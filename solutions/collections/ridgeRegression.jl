using Plots

blue = "#8DC0FF"
red = "#FFAEA6"

t = 0:10:3040
ϵ₁ = randn(length(t))*15     # spread on Dolphin IQ
ϵ₂ = randn(length(t))*20     # spreak on Human IQ

Y₁ = dolphinsIQ = t/12 + ϵ₁
Y₂ = humanIQ = t/20 + ϵ₂

scatter(t,Y₁; label="Dolphins", color=blue,
  ylabel="IQ (-)", xlabel ="Time (year BC)", legend=:topleft)
scatter!(t,Y₂; label="Humans", color=red)


# Solution
function ridgeRegression(X,Y;λ=0)
  I = one(Y*Y')
  β = (X*X' + λ*I)^-1*X'Y
end

# Solution
function ridgeRegression2(X,Y;λ=0)
  I = one(Y*Y')
  β = (X*X' + λ*I)^-1*X'Y
end

β₁ =  ridgeRegression(t,Y₁;λ=1e-3)
β₂ =  ridgeRegression(t,Y₂;λ=1e-3)

plot!(time,β₁*time;label="Prediction Dolphins",color=blue)
plot!(time,β₂*time;label="Prediction Human", color=red)
