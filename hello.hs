module Main where

main :: IO ()
main = do
   xs <- getLine
   putStrLn $ "hello! " ++ "my name is: " ++ xs

