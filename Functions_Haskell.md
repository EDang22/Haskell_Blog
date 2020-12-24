# Understanding the basics of functions and pattern matching in Haskell

## Functions

The first thing to understand about functions in Haskell is that functions are either infix or prefix functions.

**Infix Functions**

Infix functions are functions that are seen when entering arithmetic into ghci. When these functions are called, the parameters of the function come both before and after calling the function. For example, when entering `1 + 2`, you are essentially calling the addition\(+\) function with the parameters being the integers 1 and 2. More examples can be seen below.

> 10 + 100
> 64 / 2

**Prefix Functions**

Prefix functions are functions that have the parameters come after it is called. For example, the `min` and `max` functions in Haskell return the minimum of two numbers and the maximum of the two numbers, respectively. To correctly call these functions they must be called as seen below.

> min 1 2
> max 100 1000

**Note: If a prefix function takes two parameters, it can be written as an infix function by entering it as so.**

> 1 \`min\` 2

Something to keep in mind about functions in Haskell is that the number of parameters, parameter types and return type does not have to be explicitly stated but can be if the programmer decides to do so. This will be seen in more detail when writing your first function in Haskell in Projects1.md

If you would like to specify the number of parameters, the types and declare a return type, it can be done as so. 

> Function with one parameter
> [function name] :: [parameter type] -> [return type]

> Function with two parameter
> [function name] :: [parameter type] -> [parameter type] -> [return type]

## Pattern Matching

Pattern Matching in Haskell can be seen as a way of deconstructing a function into different patterns that will be found and defining a different action based on each of those patterns. Though this explanation may seem a bit confusing, it is the method through which all functions are defined in Haskell are defined and with practice, becomes quite simple to understand.

### Example of Pattern Matching



## Links for more information:



