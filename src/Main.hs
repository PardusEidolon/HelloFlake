module Main (main) where

main :: IO ()
main = do
  putStr "what is your name?"
  ln <- getLine
  putStrLn $ "hello, " ++ ln