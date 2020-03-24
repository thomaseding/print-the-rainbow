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
  let fore = putColor Foreground color
      back = putColor Background color
  putStr fore
  putStr back

