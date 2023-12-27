{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE InstanceSigs #-}

module Parser where

import Control.Applicative ( Alternative(empty, (<|>)) )
import Data.List (isPrefixOf)

newtype Parser a = Parser { parse :: String -> [(a, String)] }

instance Functor Parser where
    fmap :: (a -> b) -> Parser a -> Parser b
    fmap f pa = Parser $ \s -> [ (f a, c)
                               | (a, c) <- parse pa s
                               ]

instance Applicative Parser where
    pure :: a -> Parser a
    pure a = Parser $ \s -> [(a, s)]

    (<*>) :: Parser (a -> b) -> Parser a -> Parser b
    pf <*> pa = Parser $ \s -> [ (f a, d)
                               | (f, c) <- parse pf s
                               , (a, d) <- parse pa c
                               ]

instance Alternative Parser where
    empty :: Parser a
    empty = Parser $ const []

    (<|>) :: Parser a -> Parser a -> Parser a
    pa <|> pb = Parser $ \s -> parse pa s ++ parse pb s

instance Monad Parser where
    return :: a -> Parser a
    return = pure

    (>>=) :: Parser a -> (a -> Parser b) -> Parser b
    pa >>= f = Parser $ \s -> [ ans
                              | (a, c) <- parse pa s
                              , ans    <- parse (f a) c
                              ]

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = Parser $ \case
    c:o -> [(c, o) | p c]
    _   -> []

char :: Char -> Parser Char
char = satisfy . (==)

string :: String -> Parser String
string a = Parser $ \s -> ([(a, drop (length a) s) | a `isPrefixOf` s])

skip :: (Char -> Bool) -> Parser ()
skip p = Parser $ \s -> [((), dropWhile p s)]
