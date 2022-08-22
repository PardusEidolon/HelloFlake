module Main (main) where

import Control.Monad (forever)
import System.Exit (exitFailure,exitSuccess)

main :: IO ()
main = forever $ do
  putStrLn "what is your name?"
  ln <- getLine
  case elem ln nameList1 of
    True -> putStrLn ( ln ++ "your dead to me")
    False -> putStrLn (names ln)

names :: String -> String
names x
  | elem x nameList1 = "stop your moaning!!"
  | elem x nameList2 = "welcome friend :-)"
  | otherwise = "try again."

nameList1 :: [String]
nameList1 = [
              "robert"
            , "Robert"
            , "rob"
            , "Rob"
            , "wolstaeb"
            , "bob"
           ]

nameList2 :: [String]
nameList2 = [
              "jack"
            , "Jack"
            , "andrew"
            , "andy"
            , "andrew"
            , "lenz"
            , "max"
            , "berno"             
            ]