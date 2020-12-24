# The basics of Syntax in Haskell

## If statement

* If statements work the same way one would expect an if statement to work in any other programming language.

* The format of an if statement in Haskell is `if (case) then (action if true) else (action if false)`. 

* These statements can be concatenated or nested in order to have an expression go through multiple ifs before reaching the last else. 

## Guards using Pipe (|) statement

* Guards are similar to an if statement, however the format is a bit different.

* The format of a guard is: (any number of cases can be used)

> functionName parameter
> | case = (result if true)
> | case1 = (result if true)
> | case2 = (result if true)
> | otherwise = (result if no cases true)

### Example

To better understand guards, lets create the same function from the example in *Functions_Haskell.md* (writeNum). The implementation of the function using guards can be seen as so:

> writeNum :: Int -> String
> writeNum n
>   | n == 0 = "zero"
>   | n == 1 = "one"
>   | n == 2 = "two"
>   | n == 3 = "three"
>   | n == 4 = "four"
>   | otherwise = "not in range"

From this example, we can see how guards are implemented. In addition, we can see with the second line how users are able to place names on parameters given in the function in order to construct the guard.

## Case statement

Case statements in Haskell work similarly to other case statements in other programming languages, where the case takes an expression and attempts to compare the expresssion to each pattern and output the result of the pattern that matches the expression. 

* Format: (there can be any number of cases)

> case expression of pattern -> result if true
>                    pattern1 -> result if true
>                    pattern2 -> result if true

## Let Statement

A let statement allows a user to bind a name to a value or expression. 

* Format: 

> let (name = value/expression) in (expression using name)

## Links that may help
[Link 1](https://www.tutorialspoint.com/haskell/haskell_functions.htm)
[Link 2](https://www.haskell.org/tutorial/patterns.html)
[Link 3](http://learnyouahaskell.com/syntax-in-functions)