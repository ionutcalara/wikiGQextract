module Main where

import Text.HandsomeSoup
import Text.XML.HXT.Core

main :: IO ()
main = do
    putStrLn "What is the wikipedia url you wish to parse ?"
    url <- getLine
    let doc = fromUrl url
    maintitle <- runX $ doc >>> css "h1.firstHeading" /> getText
    putStrLn "MainTitle:"
    mapM_ putStrLn maintitle
    links <- runX $ doc >>> css ".mw-body-content p" /> hasName "a" /> getText
    putStrLn "Links:"
    mapM_ putStrLn links
    bolds <- runX $ doc >>> css ".mw-body-content p" /> hasName "b" /> getText
    putStrLn "Bolds:"
    mapM_ putStrLn bolds
    italics <- runX $ doc >>> css ".mw-body-content p" /> hasName "i" /> getText
    putStrLn "Italics:"
    mapM_ putStrLn italics
