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

To better understand Pattern Matching, lets create a function that uses pattern matching in Haskell. The function will take an int *n* and will return a string that is the number in the form of a word. Lets call the function writeNum. If you were to input `writeNum 1`, the function should return `one`. In addition, lets set the limit on the greatest number to be 4 and the smallest number to be 0, and any number given that is greater than 4 and less than will return `not in range`. The implementation of the function can be seen below:

> writeNum :: Int -> String
> writeNum 0 = "zero"
> writeNum 1 = "one"
> writeNum 2 = "two"
> writeNum 3 = "three"
> writeNum 4 = "four"
> writeNum x = "not in range"

* This function uses pattern matching by defining specific, unique return values for the pattern values of 0, 1, 2, 3, and 4. The last line defines any pattern and allows for any int to be entered into the function without an error being returned.

* Note that the definition for all other patterns (writeNum x) is the last definition. If this were to be first line in the function definition, all other pattern matched definitions would never be reached as the given pattern will always match the case `writeNum x` and always return the value associated with it.

## Links for more information:

[Link 1](http://learnyouahaskell.com/syntax-in-functions)
[Link 2](https://www.tutorialspoint.com/haskell/haskell_functions.htm)

