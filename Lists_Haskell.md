# The basics of Lists in Haskell

Before working with Lists in Haskell, it is important to understand that lists are a homogenous data structure. This means that a list is only capable of holding a collection of one unique data type. In other words, one could not have a list of strings and ints. 

## Defining lists

* A list in Haskell is bounded with "\[\]" with each element being seperated with a comma. An example of a list of numbers can be seen below.

> [1, 2, 3]

* In order to define a list and a name to that list in Haskell, the keyword `let` is used

> let x = [1, 2, 3]

This command in GHCI will create a list "\[1, 2, 3\]" with the name "x". After entering this command, you could enter x into the terminal and the defined list should return. 

## Concatenating lists

To concatenate lists, Haskell provides two operators. The ++ operator and the : operator

- The ++ operator will take two lists and concatenate the two where all elements of the first list are the start of the final list and the elements of the second list come after.

- The : operator will act similarly, however, it is more efficient to use when using multiple : operators in one line as the ++ operator must go through each element in the first list it is given before adding elements of the second list while the : operator is much faster. 

- To better understand the : operator, one can imagine the list `[1, 2, 3]` being the same thing as `1:2:3:[]`.

## Operations on lists

In order to find the element within a specific index of a list, the `!!` operator can be used on a list. For example, given the list `x = [1, 2, 3]`, if one were attempting to find the value in the first position of the list, they would enter `x !! 0` or `[1, 2, 3] !! 0` due to the fact that the indices begin at 0. 

Other operations that can be done on lists include:

* Head - returns the first value within a list `head [1, 2, 3] = 1`

* Tail - returns all values in the list except the first value `tail [1, 2, 3] = [2, 3]`

* Last - returns the last element in the list `last [1, 2, 3] = 3`

* Init - returns all values in the list except the last value `init [1, 2, 3] = [1, 2]`

* Length - returns the size/length of the list `length [1, 2, 3] = 3`

* Null - returns true if the given list is empty, false otherwise `null [1, 2, 3] = false`

* Reverse - reverses the list `reverse [1, 2, 3] = [3, 2, 1]`

* Sum - returns sum of all numbers in the list `sum [1, 2, 3] = 6`

* Product - returns the product of all numbers in the list `product [1, 2, 3] = 6`

## Ranges

In order to make the creation of lists more efficient, Haskell has ranges which can be used to create lists of many very specific sequences defined by the user. 

* The simplest way to use ranges is by making an ordered list with bounds defined by the user. For example, if you wanted to make a ordered list starting from 1 and going to 10 without a range you would put `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`, ranges makes this simpler by allowing you to put `[1..10]` rather than having to input every single value. 

* This also works with chars as well, where `['a'..'z']` will output the entire alphabet.

* Ranges can also be made more specific by adding multiple terms to be interpreted as a step. Using this we can output all even numbers from 2 to 10 by inputting `[2,4..10]` as well as count backwards, `[10,9..1]` will output a descending list from 10 to 1. 

## Links that may help

[Link 1](https://www.tutorialspoint.com/haskell/haskell_basic_data_models.htm)
[Link 2](http://learnyouahaskell.com/starting-out)
[Link 3](https://hackage.haskell.org/package/base-4.14.1.0/docs/Data-List.html)