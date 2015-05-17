module Main where

import Data.List
import System.Random
import Data.Random.Extras
import Data.Random.Source.Std
import qualified Data.Text as T
import Data.Random.RVar
import Data.String.Utils
import Text.XML.HXT.Core
import Text.HandsomeSoup

{-questions = ["What do you think about %s","Do you know what %s means in regards of %h","What can you tell about %s","Can you briefly elaborate on the topic of %s in regards of %h","What aspects of %s are you familliar with ?","What knowledge do you have regarding %s in the context of %h ","Please describe %s from your understanding in the context of %h"]
--mapM_ putStrLn questions
filename = "intrebari.txt"
final_list= []
write_questions [] t = print [
write_questions (x:xs) t = do
            --let sq = runRVar (choice questions) StdRandom
            let sq = ["What do you think about %s"]
            map (Data.String.Utils.replace "%s" x) sq
            map (Data.String.Utils.replace "%p" t) sq
            final_list++sq
            write_questions xs t

    -}
--counter=1;
filename = "intrebari.txt"
questions :: [T.Text]
questions = [T.pack "Do you know what %s means in regards of %h ?",T.pack "What can you tell about %s ?",T.pack "Can you briefly elaborate on the topic of %s in regards of %h ?",T.pack "What aspects of %s are you familliar with ?",T.pack "What knowledge do you have regarding %s in the context of %h ?",T.pack "Please describe %s from your understanding in the context of %h ."]

add_question title words= do
               q <- randomRIO(0,(length questions)-1)
               let ques=replace "%h" title (replace "%s" words (T.unpack (questions!!q)))++"\n"
               --counter=counter+1
               appendFile filename ques

main :: IO ()
main = do
    putStrLn "What is the wikipedia url you wish to parse ?"
    url <- getLine
    writeFile filename ""
    putStrLn "please wait"
    let doc = fromUrl url
    maintitle <- runX $ doc >>> css "h1.firstHeading" /> getText
    --putStrLn "MainTitle:"
    --mapM_ putStrLn maintitle
    links <- runX $ doc >>> css ".mw-body-content p" /> hasName "a" /> getText
    --putStrLn "Links:"
    --mapM_ putStrLn links
    bolds <- runX $ doc >>> css ".mw-body-content p" /> hasName "b" /> getText
    --putStrLn "Bolds:"
    --mapM_ putStrLn bolds
    italics <- runX $ doc >>> css ".mw-body-content p" /> hasName "i" /> getText
    --putStrLn "Italics:"
    --mapM_ putStrLn italics

    -- since the keywords don't matter as provenience we will use concat to
    -- build a list with all of them so that we can random push elements for
    -- the questions

    let keywords =nub (concat [links,bolds,italics])
    mapM_ (add_question (maintitle!!0)) keywords
    putStrLn "done";
    --mapM_ putStrLn keywords
    --writeFile filename ""
    -- empty file of content
    --q <- randomRIO(0,(length questions)-1)
    --writeFile filename (T.unpack (questions!!q))
    --print q








