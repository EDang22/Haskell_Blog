# Interpreter

## Overview

For the interpret, we will be using the BNF converter or BNFC in order to parse simple arithmetic to calculate. We will interpret an equation and apply a native Haskell operation on Integers. 

To do this, we will use a three files in total. The file containing the main function will be given and is the *Calculator.hs* file seen in the interpreter file of this blog, this file is what will connect the other two files and is where they will interact.

The second file will be a haskell file containing the eval function. This is the function that will apply the native Haskell operation to the two expressions given. Keep in mind that I chose the word expression instead of number because we do not know if what is given will be another function call or an integer. This can also be called an interpreter for absract syntax (More information on this below).

The third file will be an interpreter for the concrete syntax. This will be a file specifically for BNFc. Example and more explanation of the implementation can be seen below. 

### Abstract vs. Concrete Syntax

Concrete Syntax is defined by a context free grammer. This grammar is a set of rules defining the syntax for the programmer.

Abstract Syntax is the parsed tree that represents a program and is syntax for the compiler.

Links that may help:

[Link 1](https://stackoverflow.com/questions/1888854/what-is-the-difference-between-an-abstract-syntax-tree-and-a-concrete-syntax-tre)  

[Link 2](http://pico.vub.ac.be/mc/absconc.html#:~:text=The%20abstract%20syntax%20is%20part,or%20compiler%20of%20a%20language.&text=The%20concrete%20syntax%20of%20a,look%20like%20to%20the%20programmer.)  

[Link 3](https://eli.thegreenplace.net/2009/02/16/abstract-vs-concrete-syntax-trees)

## Implementation

### Eval function (Abstract Syntax)

Some examples of how to implement the eval function can be seen below.

> eval :: Exp -> Integer
> eval (Num e1) = e1
> eval (Plus e1 e2) = (eval e1) + (eval e2)
> eval (Times e1 e2) = (eval e1) * (eval e2) 

Something to understand here is that normally we would have to define `Exp` as a data type just like we have with NN and PN from the Calculator. However, due to the fact that we are working with BNFC, we don't have to worry about this because compiling with BNFC will automatically define the data type for us.  

Another thing to note is that if you are implementing functions such as division and mod within the interpreter, the native Haskell functions do not use the tradition mathematical symbols for the functions, meaning you would not be able to put:

> eval (Divi e1 e2) = (eval e1) / (eval e2)
> eval (Modu e1 e2) = (eval e1) % (eval e2)

If you look at information about Int in Haskell \(links can be seen below\), you can see the native function calls on Int in Haskell and the name. **Hint: you can see that the only infix functions that use traditional symbols are addition \(\+\), multiplication \(\*\), and subtraction\(\-\)**  

### cf file (Concrete Syntax)

An example of how to write grammar using BNFC can be seen as so:

> Plus. Exp ::= Exp "+" Exp1 ;
> Times. Exp1 ::= Exp1 "*" Exp2 ;
> Num. Exp2 ::= Integer ;
> coercions Exp 2 ;

Something to note is that the grammar for `times` specifically states `Exp1` instead of `Exp`. This is in order to keep the properties of PEMDAS within this interpreter. By adding this, the interpreter will now only allow for plus to be on the level of `Exp` within the parsing tree and as a result, will never compute an addition before multiplication, unless placed in parenthesis. This is known as adding precedence levels.

To better understand this concept, you can watch [this](https://www.youtube.com/watch?v=jf1xhZSpCvg) video explaining how precedence levels work in more detail.

## Resources that may help

* My implementation can be seen in the Interpreter file of this blog

## My Experience working on the Project

Compared to the calculator, I found that although the concepts can be a bit confusing at first, once you understand them implementation is fairly easy. However, I did run into a number of issues while trying to compile the interpreter that were simply due to not importing the AbsNumber file to the interpreter for the abstract syntax. Another issue I ran into was that I could not compile due to the fact that I did not have happy or Alex installed. I talk about how to resolve this issue in the InstallingHaskell.md file. I believe this project is helpful to understand abstract and concrete syntax and a good way to get into BNFC and writing a context free grammar with precedence levels.

## Load and test project with BNFC

To compile and test the code you have written using bnfc, make sure you have all three files required \(main, abstract syntax, concrete syntax\) in one directory. Navigate to this directory in the terminal and enter the following command. This command will generate a number of files that will be used. The names of the files will depend on the name of the file for the interpreter for the concrete syntax. For my project, I named the file `numbers.cf` so we will use this name for the example. Be sure to change the command so that it contains that name of the file you have created.

> bnfc -m -haskell numbers.cf

After this command, enter `make` to compile all the files. You can then test your interpreter with the newly generated `TestNumbers` file and a `Calculator` file. To test if the parsing in the interpreter is correct, pipe the echo command and your equation into the `TestNumbers` file. An example of this would be: 

> echo "1+2*3" | ./TestNumbers

Which should return something similar to:

> Parse Successful!

> [Abstract Syntax]

> Plus (Num 1) (Times (Num 2) (Num 3))

> [Linearized tree]

> 1 + 2 * 3

In order to test the actual Calculator, pipe the same command into the *Calculator* file. 
