# Julia basics

## Basic computing

```julia
1 + 2       # adding integers

1.0 + 2.0   # adding floats

2 / 4       # standard division

div(2, 4)   # Computes 2/4 truncated to an integer

35 \ 7      # inverse division 

1 // 3      # fractions

1//2 + 1//4 

'c'        # characters (unicode)

:symbol
```

```julia
x = 2

τ = 1 / 37  # fine structure constant
```

```julia
3x

x += 2  # inplace update of x
```

```julia
mystery = "life, the universe and everything"
```

```julia
println("The answer to $mystery is $(3*2*7)")
```

## Boolean operators

```julia
# Boolean operators
!true   # => false
!false  # => true
1 == 1  # => true
2 == 1  # => false
1 != 1  # => false
2 != 1  # => true
1 < 10  # => true
1 > 10  # => false
2 <= 2  # => true
2 >= 2  # => true
# Comparisons can be chained
1 < 2 < 3  # => true
2 < 3 < 2  # => false
```

## Control flow

```julia
if 4 > 3
  println("A")
elseif 3 > 4
  println("B")
else
  println("C")
end
```

```julia
y = condition ? valueiftrue : valueiffalse
```

## Looping

```julia
characters = ["Harry", "Ron", "Hermione"]

for char in characters
  println("Character $char")
end

for (i, char) in enumerate(characters)
  println("$i. $char")
end

pets = ["Hedwig", "Pig", "Crookhanks"]

for (char, pet) in zip(characters, pets)
  println("$char has $pet as a pet")
end
```

```julia
n = 1675767616;

while n > 1
  println(n)
  if n % 2 == 0
    global n = div(n, 2)
  else
    global n = 3n + 1
  end
end
```

## Functions

```julia
function square(x)
  result = x * x
  return result
end

square(2)

square(2.0)

square("ni")
```

```julia
s(x) = x * x
```

```julia
s([1, 2, 3, 4, 5])

s.([1, 2, 3, 4, 5])
```

```julia
safelog(x, offset=0.1; base=10) = log(x + offset) / log(base)

safelog(0)

safelog(0, 0.01)

safelog(0, 0.01, base=2)
```

```julia
?sort
```

```julia
my_unsorted_list = [4, 5, 9, 7, 1, 9]

sort(my_unsorted_list)

my_unsorted_list

sort!(my_unsorted_list)

my_unsorted_list
```

## Plotting

```julia
using Plots

plot(1:10, rand(10), label="first")
plot!(1:10, rand(10), label="second")

scatter!([1:10], randn(10), label="scatter")

xlabel!("x")
ylabel!("f(x)")
title!("My pretty Julia plot")

plot(0:0.1:10, x -> sin(x) / x, xlabel="x", ylabel="sin(x)/x", legend=:none)

contour(-5:0.1:5, -10:0.1:10, (x, y) -> 3x^2-4y^2 + x*y/6)
```

## Exercise
