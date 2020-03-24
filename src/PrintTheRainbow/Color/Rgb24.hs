module PrintTheRainbow.Color.Rgb24 (
  Rgb24(..),
  distanceSquared,
) where

import           Data.Word (Word8)

data Rgb24 = Rgb24 Word8 Word8 Word8
  deriving (Show, Eq, Ord)

distanceSquared :: Rgb24 -> Rgb24 -> Int
distanceSquared (Rgb24 r1 g1 b1) (Rgb24 r2 g2 b2) =
  let r = diffSq r1 r2
      g = diffSq g1 g2
      b = diffSq b1 b2
  in  r + g + b

diffSq :: Word8 -> Word8 -> Int
diffSq x y =
  let x' = fromIntegral x
      y' = fromIntegral y
      d = x' - y'
  in d * d

