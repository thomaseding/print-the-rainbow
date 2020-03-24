module PrintTheRainbow.Color.Rgb24 (
  Rgb24(..),
  distance,
) where

import           PrintTheRainbow.Color (IsColor)
import           PrintTheRainbow.Color.Rgb24.Type (Rgb24(..))

distance :: Rgb24 -> Rgb24 -> Int
distance (Rgb r1 g1 b1) (Rgb r2 g2 b2) =
  r = diffSq r1 r2
  g = diffSq g1 g2
  b = diffSq b1 b2

diffSq :: Word8 -> Word8 -> Int
diffSq x y =
  x' = fromIntegral x
  y' = fromIntegral y
  d = x' - y'
  in d * d

