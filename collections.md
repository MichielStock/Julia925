---
title : Collections
author : |
  Michiel Stock
  Bram De Jaegher
  Daan?
date: December 2019
---

# Arrays
Let us start of with the Julia `Array`. It is very similar to lists in Python. A list is defined as follows,

```julia
A = []            # empty array

X = [1, 3, -5, 7] # array of integers
```

Let's start by eating the frog. Julia uses 1-based indexing...

```julia
 names = ["Arthur", "Ford", "Zaphod", "Marvin", "Trillian", "Eddie"]
 names[0]        # this does not work, sorry Pythonista's

 names[1]        # hell yeah!

 names[end]      # last element 
 
 names[end-1]    # second to last element 
```

Array slicing and slicing with assignment:
```julia

  names[3:6]

  names[end-1:end] = ["Slartibartfast","The Whale and the Bowl of Petunias"] 
  
  names 
```

Julia arrays can be of mixed type.

```julia
Y = [42, "Universe", []]
```

The type of the array changes depending on the elements that make up the array.

```julia
@show typeof(A)
@show typeof(X)
@show typeof(Y)
```

When the elements of the arrays are mixed, a the type is promoted to the closest common ancestor. For `Y` this is `Any`.  But an array of an integer and a float becomes an ...

```julia
B = [1.1, 1]
@show typeof(B)
```

... array of floats.

Arrays behave like a stack, elements can be added to the back of the array, 

```julia
push!(names,"Eddie") # add a single element
append!(names, ["Sam", "Gerard"]) # add an array
```

"Eddie" was appended as final element of the Array along with "Sam" and "Gerard". Remember, a "!" is used to indicate an in place function. `pop()` is used to return and remove the final element of an Array

```julia
pop!(names)
```

# Matrices
Let's add a dimension and go to 2D Arrays, matrices. It is all quite straightforward,

```julia

Z = [0 1 1; 2 3 5; 8 13 21; 34 55 89]

Z[3,2]  # indexing

Z[1,:]  # slicing
```

It is important to known that arrays and other collections are copied by reference.

```julia
R = Z

@show Z
@show R

R[1,1] = 42

@show Z

```
`deepcopy()` can be used to make a completely dereferenced object.

# Other collections
Some of the other collections include tuples, dictionaries and others.

```julia
tupleware = ("tuple", "ware") # tuples

scores = Dict("humans" => 2, "vogons" => 1) # dictionaries

scores["humans"]

```

## Exercise
**Suggestion, implementing ridge regression?**

```julia
```
