module PrintTheRainbow.Color (
    Color,
    IsColor(..),
) where

import           PrintTheRainbow.Color.Rgb.Type (Rgb24)

newtype Color = Color
  { unColor :: Rgb24
  }

class IsColor c where
  toColor :: c -> Color
  toColor = either id id . toColorE

  fromColor :: Color -> c
  fromColor = either id id . fromColorE

  toColorE :: Either Color Color
  toColorE = Right . toColor

  fromColorE :: Color -> Either c c
  fromColorE = Right . fromColor

  {-# MINIMAL toColor, fromColor | toColorE, fromColorE #-}

instance IsColor Rgb24 where
  toColor = Color
  fromColor = unColor

