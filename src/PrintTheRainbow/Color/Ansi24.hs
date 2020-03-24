module PrintTheRainbow.Color.Ansi24 (
  Ansi24(..),
  putAnsi24,
) where

import           PrintTheRainbow.Color.Rgb24 (Rgb24(..))
import           PrintTheRainbow.Placement (Placement(..))

newtype Ansi24 = Ansi24
  { unAnsi24 :: Rgb24
  }

putAnsi24 :: Placement -> Ansi24 -> String
putAnsi24 placement ansi =
  let Rgb24 r g b = unAnsi24 ansi
      placementChar = case placement of
        Foreground -> '3'
        Background -> '4'
  in  "\ESC["
    ++ [placementChar]
    ++ "8;2;"
    ++ show r
    ++ ";"
    ++ show g
    ++ ";"
    ++ show b
    ++ "m"

