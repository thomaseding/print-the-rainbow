module PrintTheRainbow.Color.Rgb24.Type (
  Rgb24(..),
) where

import           Data.Word (Word8)

data Rgb24 = Rgb24 Word8 Word8 Word8
  deriving (Show, Eq, Ord)

