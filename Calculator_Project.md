# Calculator

## Overview

We want to create a calculator that uses data types the user creates. The data types will be natural numbers\(NN\), positive numbers\(PN\), and Fractions\(Frac\). The implementation of the data types can be seen below.

> type NN = O | S NN
> deriving (Eq,Show)
>
> type PN = I | T PN
> deriving (Eq,Show)
>
> type frac = (NN,PN)

To better understand this, the number 0 in NN would be the letter O while PN starts at 1, in frac 0 would be \(O,I\) or any PN in the second position. The number 1 in NN would then be \(S O\), and would be \(I\) in PN. 

Using these data types we can create functions that together can act as a basic calculator. Something to keep in mind is that we will not be working with negative numbers for this calculator.

## Implementation

To implement the majority of the functions, you will use recursion. An example of how to implement some of these functions can be seen below. 

> -- addition
> add :: NN -> NN -> NN
> add O n = n
> add (S n) m = S (add n m)

> -- multiplication
> mult :: NN -> NN -> NN
> mult O n = O
> mult (S O) n = n
> mult (S n) m = add m (mult n m)

To better understand how these functions work, lets take an example. To add the natural numbers 1 and 2, the function call would be `add (S O) (S (S O))`. Because the first case for add does not match the function call we move onto the second case, this case does match. Using the second case for add we can see that `add (S O) (S (S O)) = S (add O (S (S O))) or 1 + (0 + 2)`. In the recursive call of add we can see that we can apply the first case of add to the call to get `(S (S (S O))) or 3`. 

**Hint: You may want to add functions that calculate GCD (Greatest Common Denominator) and Least Common Multiple (LCM) to help with the arithmetic functions in frac. Other functions that are helpful (or neccesary) are functions to convert to and from NN and PN, a simplify function, and a function that converts ints to NN or PN to help with testing functions. Testing functions can be seen below.**

To add on to the project, you can add error checking to ensure that all commands are handled properly. Some of these errors include ensuring two numbers are divisible before dividing and ensuring any subtraction does not lead to negative numbers. You can also add to the project by adding a number of other functions. Be creative!

## Resources that may help

* My implementation can be found in CalcExample.hs

## My Experience on the Project

* Personally, I found this project to be quite unusual and a bit difficult to understand at first but is very rewarding to finally figure out how to write a certain function using recursion. Often times I found you had to think in a clever way in order to solve some of the functions and were forced to think about math in a way in which many had not before. 

* An example of this for me was when I was working on the add and multiply functions for fractions. To implement the add function, the equation used was `((numer1 * LCM/denom1) + (numer2 * LCM/denom2), (denom * LCM/denom))` where the fractions being added would be \(numer1, denom1\) and \(numer2, denom2\) and LCM represents the least common multiple of the two denominators. Personally, I had never thought to solve fractions this way due to the fact that when adding fractions, some of the steps are second nature and are done without even thinking. Other than being a bit confused on how to solve that issue, I did not have many other problems creating the calculator. It simply takes some time to figure out how to write the function recursively. Overall, I believe this project is a good way to get into Haskell, practice writing recursive equations, and will get you to think about simple arithmetic in a different way than before.