module Main (main) where

main :: IO ()
main = do
  putStrLn "what is your name?"
  ln <- getLine
  putStrLn $ "hello, " ++ ln