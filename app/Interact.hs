module Interact where

import Core
import Types
import Control.Monad.Writer (runWriter)
import GHC.GHCi.Helpers (disableBuffering)

greet :: IO ()
greet = do
    putStrLn "Sequence Matrix Calculator \n\
             \ - q -> quit \n\
             \ - l -> load sequence"

initREPL :: IO REPLState
initREPL = do
    disableBuffering
    return initREPLState

repl :: REPLState -> IO ()
repl s = do
    putStr "smc> "
    maybe (repl s) (react s) . str2query =<< getLine

react :: REPLState -> Query -> IO ()
react _ Quit = bye
react s LoadSequence = do
    seq <- getSequence
    let (ns, log) = runWriter $ loadSequenceWithCallback s seq
    putStrLn log
    repl ns

bye :: IO ()
bye = putStrLn "Leaving SMC."

getSequence :: IO Sequence
getSequence = todo