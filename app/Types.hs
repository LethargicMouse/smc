module Types where

import Data.Array

type Matrix = Array (Int, Int) Double

data Query = LoadSequence
           | Quit

data Sequence = Sum Sequence Sequence
              | Mul Sequence Sequence
              | Sub Sequence Sequence
              | ConstD Double
              | ConstI Int
              | F Sequence
              | Pow Sequence Sequence
              | N

data REPLState = REPLState {
    
}