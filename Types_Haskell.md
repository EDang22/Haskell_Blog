# Understanding the basics of types and type classes in Haskell

In simple terms, a type in Haskell can be seen as a value and type classes can be seen as a hierarchical way to organize similar types or functions. Some examples of type classes built into Haskell include

## The *EQ* type class

- Any subclass of the EQ type class is able to test if it's expressions are equal. 

- Many standard types in Haskell are a part of the EQ class, including int, double, char, bool, and more. 

- Equality in Haskell can be used with "==" and "/=" (!= or "does not equal")

- Note that any time the equality of two expressions are checked, a call to the EQ type class is actually being made

## The *Ord* and *Enum* type class

- The Ord and Enum type classes are classes that allow any type that is a part of it to order it's values and compare these values.

- Int, integer, float, and double are a part of these type classes.

- The Ord class allows types to compare values using the ">", "<", ">=" "<=" operators. 

- The Enum class contains operations like `succ`, `pred`, and more.

## The Show Class

- Subclasses of the Show class are all types that are able to be presented as strings.

- All types mentioned so far are a part of the Show class.

## The Read Class

- The Read class essentially acts as the opposite of the Show class.

- Any subclasses of the Read class are able to take a string and convert that string to a it's own type.

- An example of this can be seen with the types int and double. Due to the fact that these types are subclasses of the read class, one would be able to enter `read "1" + 1` after launching ghci and the terminal would return `2`.

## Other type classes

Other types classes built within Haskell are the Bounded class, which places a bound on any members of the type class (Int is a member of the Bounded class). In addition to Bounded, there are the Num, Integral, Floating, and many more type classes (Num and its subclasses will be explained in IntsinHaskell.md). 

## Links for more information:

[Link1](https://www.tutorialspoint.com/haskell/haskell_types_and_type_class.htm)

[Link2](http://learnyouahaskell.com/types-and-typeclasses)