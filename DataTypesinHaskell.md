# Understanding the basics of data types and functions in Haskell and how to get into it

## Ints

* For the most part, ints in Haskell work the same way any other integer would work in other programming languages. Ints can be seen by entering arithmetic into ghci. Operations such as addition, subtraction, multiplication and division can be seen. 

* Something to keep in mind with Ints are that they are considered to be Integrals in Haskell. In Haskell, the data type Integrals represent whole numbers. The two most common types are Integer and Int. Ints can store a 64 bit integer while Integer is meant for any numbers larger than that. For the most part, you will only be using Ints in Haskell as the numbers used will most likely not exceed 2^64.

* Though this does not sound significant. It means that any function that takes floating point numbers \(double, float etc.\) will not take Integers unless the integer is converted to a floating point number. 

* An example of this could be seen with the square root function in Haskell. If you were trying to find the square root of the int 4, the function call would be `sqrt 4`. Though this should work in principle, Haskell will return an error due to the fact that the `sqrt` function in Haskell only takes floating point numbers. 

* To resolve the issue, Haskell has functions `fromInteger`, which converts an Integer to type Num and `toInteger` which takes type Num and returns the Integer corresponding to the given Num

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

