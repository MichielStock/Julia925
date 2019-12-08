# Julia basics

## Basic computing
Let's get started with the basics. Some mathematical operations, 

```julia
1 + 2       # adding integers

1.0 + 2.0   # adding floats

2 / 4       # standard division

div(2, 4)   # Computes 2/4 truncated to an integer

35 \ 7      # inverse division 

1 // 3      # fractions

1//2 + 1//4 

'c'        # characters (unicode)

:symbol    # symbols, mostly used for macros
```

variable assignment,

```julia
x = 2

τ = 1 / 37  # unicode variable names are allowed
```

unicode! In most Julia editing environments, Unicode math symbols can be typed when starting with a "\ and hitting <TAB>.

```julia
\alpha  # just hit <TAB>

```

Operators are overrated.

```julia
5x         # This works
```

But strings are quite essential,

```julia
mystery = "life, the universe and everything"
```

and string interpolation is performed with `$`.


```julia
println("The answer to $mystery is $(3*2*7)")
```

It is possible to create immutable variables (cannot be changes). Quite handy for physical constants but is rather cumbersome to achieve in Python. The syntax is very similar to C++,

```julia
const ϵ₀ = 8.8541788128e-12  # vacuum electric permittivity
ϵ₀ = 8.9e-12                 # nope
```

Every binary arithmetic and bitwise operators have an updating version that assigns the result of the operation back into the left operand. The updating version of the binary operator is formed by placing a = immediately after the operator.

```julia
x += 2  # inplace update of x
```

## Boolean operators
From zero to one.

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
The `if`, `else`, `elseif`-statement,

```julia
if 4 > 3
  println("A")
elseif 3 > 4
  println("B")
else
  println("C")
end
```

Julia allows for some very condense control flow structures.
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
Julia puts the fun in functions. User-defined functions can be declared as follows,

```julia
function square(x)
  result = x * x
  return result
end

square(2)

square(2.0)

square("ni")
```

A more condensed version of of `square(x)`.

```julia
s(x) = x * x
```

```julia
s([1, 2, 3, 4, 5])

s.([1, 2, 3, 4, 5])
```

Keyword arguments are defined using a semicolon in the back signature and a default value can be assigned. "Keywords" assigned before the semicolon are default values but their keywords are not used.  

```julia
safelog(x, offset=0.1; base=10) = log(x + offset) / log(base)

safelog(0)

safelog(0, 0.01)

safelog(0, 0.01, base=2)
```

When unsure of what a function does, the documentation can be viewed by adding a "?" in front of the function. 

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
Quite essential for scientific programming is the visualisation of the results. `Plots` is the Julia package that handles a lot of the visualisation.

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
