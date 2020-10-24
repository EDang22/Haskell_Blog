-- Ethan Dang
-- Create calculator by implementing interpreter for abstract syntax and concrete syntax
-- Used bnfc to compile grammar
-- Main function, to be called to start calculator, instructions to compile in README
module Main where

import LexNumbers
import ParNumbers
import AbsNumbers
import Interpreter

import ErrM
import PrintNumbers

main = do
  interact calc
  putStrLn ""

calc s = 
  let Ok e = pExp (myLexer s) 
  in printTree (eval e)