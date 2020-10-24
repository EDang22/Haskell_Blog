-- Ethan Dang
-- Create calculator by implementing interpreter for abstract syntax and concrete syntax
-- Used bnfc to compile grammar
-- Interpreter file, defines Exp (definition in AbsNumbers) and eval function
module Interpreter where

import AbsNumbers

eval :: Exp -> Integer
eval (Num e1) = e1
eval (Plus e1 e2) = (eval e1) + (eval e2)
eval (Times e1 e2) = (eval e1) * (eval e2)
eval (Minus e1 e2) = (eval e1) - (eval e2)
eval (Div e1 e2) = (eval e1) `div` (eval e2)
eval (Mod e1 e2) = (eval e1) `mod` (eval e2)
eval (Abs e1) = abs (eval e1) 
eval (Negate e1) = -(eval e1)
eval (Expo e1 e2) = (eval e1) ^ (eval e2)
eval (Gcd e1 e2) = gcd (eval e1) (eval e2)
eval (Lcm e1 e2) = lcm (eval e1) (eval e2)
eval (Signum e1) = signum (eval e1)