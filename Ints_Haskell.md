# Understanding Ints and Numbers as a whole in Haskell

## Num Class

The *Num* class (numeric type class) is the type class in which most number types that one will use exists. The class provides an addition, subtraction, and multiplication operation. 

* Note that the Num class does not provide any operation for division. The division operation is provided by the subclasses of Num.

* The subclass *Integral* is the subclass that will allow for whole-number division and remainder operations. The two main subclasses of Integral that will be used are *Int* and *Integer* (See below for more information on Ints and Integers)

* The rest of the Num types are subclasses of the *Fractional* class. This is the class that will allow for traditional operation of division. 

* Within the Fractional class includes the *Floating* subclass that implements trigonemetric, logarithmic, and exponential functions. In addition, a subclass of Floating, *RealFloat*, is the class in which the data types *Float* and *Double* exist.

## Ints

For the most part, ints in Haskell work the same way any other integer would work in other programming languages. Ints can be seen by entering arithmetic into ghci. In addition to ints, floats and doubles are also quite similar to other programming languages, where floats are floating points with single precision and doubles have double precision.

* Operations such as addition, subtraction, multiplication and division can be seen. 

* Something to keep in mind with Ints are that they are considered to be Integrals in Haskell. In Haskell, the data type Integrals represent whole numbers. The two most common types are Integer and Int. Ints can store a 64 bit integer while Integer is meant for any numbers larger than that. For the most part, you will only be using Ints in Haskell as the numbers used will most likely not exceed 2^64.

* Though this does not sound significant. It means that any function that takes floating point numbers \(double, float etc.\) will not take Integers unless the integer is converted to a floating point number. 

* An example of this could be seen with the square root function in Haskell. If you were trying to find the square root of the int 4, the function call would be `sqrt 4`. Though this should work in principle, Haskell will return an error due to the fact that the `sqrt` function in Haskell only takes floating point numbers. 

* To resolve the issue, Haskell has functions `fromInteger`, which converts an Integer to type Num and `toInteger` which takes type Num and returns the Integer corresponding to the given Num

## Getting started with Numbers in Haskell

To get started using numbers in Haskell, a simple first step could be simply launching ghci and entering simple arithmetic to see if there are any unexpected results that may occur. Other small exercises and projects can be seem in Projects1.md.

## Links to learn more

[Link1](https://www.haskell.org/tutorial/numbers.html)

[Link2](http://learnyouahaskell.com/types-and-typeclasses)