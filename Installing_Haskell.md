# Installing Haskell, BNFC etc. + Any issues that may arise

**NOTE: These instructions are currently for Linux/Mac users only. Observations and errors found were also through the perspective of Haskell on MacOS.**

## *HASKELL*

To install the Haskell Tool Stack, I simply copy and pasted this command into the terminal.

> curl -sSL https://get.haskellstack.org/ | sh

In some cases you may have to enter "sudo" in front of the command.

> sudo curl -sSL https://get.haskellstack.org/ | sh

To install the general purpose language Haskell, enter the command below and follow the instructions prompted after, this should install ghc as well as cabal\-install.

> curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

To upgrade:

> stack upgrade

In order to launch ghci enter this into the terminal.

> stack exec ghci

If what you see after is down below, then everything should be working and installed.

> GHCi, version 8.8.4: https://www.haskell.org/ghc/ :? for help
> Prelude>

## *BNFC*

To install BNFC on MAC/Linux enter the following command in the terminal.

> brew install bnfc

To ensure BNFC was installed, enter `bnfc --version` and a version number should appear (at the current moment that version number is 2.8.3).

## *Other issues I ran into and how I solved it*

### Alex

When creating the parser and interpreter with BNFC, I ran into issues when trying to run the commands

> bnfc -m -haskell numbers.cf
> make

The issue that occurred when attempting to run this command was that I did not have Alex installed in order to compile the LexNumbers.x file that was generated by bnfc. To fix this issue I ran the command below and everything seemed to work after that.

> cabal install Alex

### happy

Another issue that may occur when working with BNFC is that "happy" is not installed. To install, enter:

> cabal install happy

## Links that may help

[Haskell Website](https://www.haskell.org/platform/)

[Cabal](https://www.haskell.org/cabal/)
