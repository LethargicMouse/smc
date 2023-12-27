module Core where

import Types

import Control.Monad.Writer

todo :: a
todo = undefined

initREPLState :: REPLState
initREPLState = REPLState

str2query :: String -> Maybe Query
str2query "q" = Just Quit
str2query "l" = Just LoadSequence
str2query _   = Nothing

loadSequenceWithCallback :: REPLState -> Sequence -> Writer String REPLState
loadSequenceWithCallback = todo