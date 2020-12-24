# Things to know about Haskell and how to get started

In order to use Haskell, it is important to learn what Haskell is as a language. 

* Haskell is a purely functional programming langauge. This means in Haskell, programs are expressed in the form on functions. 

* As an example, take the factorial function in mathematics. In an imperative programming language, the function would be a list of commands or steps for the computer to make in order to calculate the factorial of a number. However in Haskell, this program would be very similar to the mathematical equation to calculate a factorial and much simpler than a program in an imperative langauge. 

* Haskell is also statically typed and uses type inference, meaning the compiler for Haskell can identify the data type of a piece of code or variable without the user specifying it.

## Working in ghci

### Loading files in ghci

* To load a Haskell file in ghci, ensure you are in the directory that contains the Haskell file you wish to load \(Haskell files contain the .hs extension\) 

* Once in the correct directory launch ghci with `stack exec ghci` and load the file by entering either of the following commands \(Say the file being loaded in this case is called foobar.hs\).

> :load foobar

> :l foobar 

* To unload the file, enter `:load` or `:l`

### Quiting ghci

* To exit ghci, you can enter `:quit`, `:q`, or entering CTRL-D.

## Writing your first program in Haskell

* To start your first program in Haskell, first ensure you have all the necessary components needed to run Haskell installed \(Refer to InstallingHaskell.md if not yet installed\).

* If all components are installed, we will begin with Hello World. Start by opening a file in your text editor of choice and naming the file "HelloWorld.hs". 

* Once created, the program only requires one line of code to print Hello world to the console:

> main = putStrLn "Hello World"

* Thats it! Save the file and exit. To run the code, navigate to the directory containing the HelloWorld.hs file and start ghci with: `stack exec ghci`

* Once ghci has been launched, load the file. After executing the console should print "Hello World".

* To learn more about functions and data types, refer to FunctionsinHaskell.md and TypesinHaskell.md.

## Working with BNFC

### Compiling BNFC files

To compile a bnfc file, ensure you have all the necessary files needed in the same directory. Navigate to the directory within the terminal and enter the command below, ensuring to replace to placeholder with the name of your file.

> bnfc -m -haskell [file name].cf

Once this has been done you can compile the code with the `make` command.