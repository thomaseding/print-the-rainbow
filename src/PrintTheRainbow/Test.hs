module PrintTheRainbow.Test (
  main,
) where

import           PrintTheRainbow.AnsiColor (IsAnsiColor(..))
import           PrintTheRainbow.Color (IsColor(..))
import           PrintTheRainbow.Color.Rgb24 (Rgb24(..))
import           PrintTheRainbow.Placement (Placement(..))

main :: IO ()

mkPutTest :: IsColor color => Placement -> color -> IO ()
mkPutTest placement color = do
  let foreColor = putColor Foreground color
      backColor = putColor Background color

  putStr "A"
  putStr foreColor
  putStr "B"
  putReset
  putStr "C"
  putStr backColor
  putStr "D"
  putReset
  putStr "E"
  putStr foreColor
  putStr backColor
  putStr "F"
  putReset
  putStr "G"
  putStr backColor
  putStr foreColor
  putStr "H"
  putReset
  putStr "I"

  putStrLn ""

