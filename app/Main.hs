module Main where

import Interact

main :: IO ()
main = greet >> initREPL >>= repl
