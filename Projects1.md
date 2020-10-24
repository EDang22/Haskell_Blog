# Beginner Projects/Exercises to work on in Haskell

## Writing your first functions

Now lets write a function in Haskell. Create a file in a text editor named "test.hs". This is the file where we will write all the following example functions in order to get a better understanding of how functions are written and work in Haskell. 

### Exercise 1 \(Double function\)

The first function we will be writing in Haskell is named doubleNum and will take an integer *n* and return the double of that number. This is simply done by returning the value of `n + n`. The function can be written as so.

> doubleNum n = n + n

To test the function, load the file in ghci and test with any int. This function is a prefix function, so the parameters of the function must come after the name of the function. `doubleNum 3` would be a valid entry and should return 6.

### Exercise 2 \(Check Positive function\)

The next function we will create is named checkPositive and that takes an int *n*. The function returns true if the number is positive \(greater than or equal to 0\) and return false otherwise. To write this function, we add the following to the file.

> checkPositive n = (if n >= 0 then True else False)

The function can also be written as:

> checkPostive n = if n >= 0
>                     then True
>                     else False

To test the function, load the file in ghci and test with any int. Note that **Haskell will return an error if a negative int is given without parentheses**. So entering `checkPositive -10` will produce an error, however entering `checkPositive (-10)` should return the proper output of False.

Though these functions are very simple, there are some key points that can be learned from it. The first is how to implement an if-statement in Haskell \(if \[condition\] then \[to do if true\] else \[to do if false\]). In addition, it can be seen in these functions that there is no declared types whatsoever. In other words, the user does not have to declare the type of the parameter given in the function \(int n\) nor does the user have to declare the data type that it is going to return \(bool or int\). In fact the word return is never even used to implement the functions. It can also be seen that the functions are very close to the look of a math equation, such as doubleNum, doubling the value of *n* looks more like a mathematical equation than code. 

## Factorial

A simple exercise to get into Haskell is to write the function that will calculate the factorial of an integer *n*. The factorial of *n* would be n * \(n-1\) * \(n-2\) * ... * 1. The factorial of 0 is 1. So as an example the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120. 

To write a function that can correctly handle all ints, we must have a case for every integer. To implement this function, we only need two cases, one for 0 and the other case is for any integer greater than 0. If the integer given is 0, we will always return 1. For any integer *n* greater than 0, the factorial would be n\*n-1\*n-2\*...\*1. To do this in haskell, we write the function recursively. The implementation can be seen below. To better understand this, say we are looking to calculate the factorial of 2. If we use the function below to calculate the factorial, the equation would be `fac 2 = 2 * (fac 1), this would then become `2 * (1 * fac 0)`. Now because we have a case for fac 0, we know that `fac 2 = 2 * (1 * (1)) = 2`.

> fac 0 = 1
> fac n = n * (fac (n-1))

Looking at this function we can see how to implement multiple cases for a function in Haskell. However there is still an issue with this function. If the user were to call this function and give a negative number as a parameter, it would enter in an infinite loop, never reaching a case that does not have a recursive call. To avoid this, we can add an error check with an if-statement. 

> fac 0 = 1
> fac n = if n >= 1 
>           then n * (fac (n-1))
>           else error "Must be positive number"

With this implementation, we will be able to enter any integer and the function will respond properly, either with the correct answer or an error message if the factorial of the given integer cannot be calculated. Due to the fact that the case for 0 comes before the case for any integer n, we can assume that fac 0 will never reach the if-statement which would incorrectly produce an error when the factorial actually can be calculated. We can also see how errors are implemented in Haskell.

## Resources for other exercises to help learn how to use Haskell

* The Calculator project in Assign1Experience.md provides good practice for recursive functions in Haskell
