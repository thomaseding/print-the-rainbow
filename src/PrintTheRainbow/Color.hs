module PrintTheRainbow.Color (
  Color,
  IsColor(..),
) where

import           PrintTheRainbow.Color.Ansi24 (Ansi24(..))
import           PrintTheRainbow.Color.Rgb24 (Rgb24(..))
import           PrintTheRainbow.Placement (Placement(..))

newtype Color = Color
  { unColor :: Rgb24
  }

class IsColor color where
  toColor :: color -> Color
  toColor = either id id . toColorE

  fromColor :: Color -> color
  fromColor = either id id . fromColorE

  toColorE :: color -> Either Color Color
  toColorE = Right . toColor

  fromColorE :: Color -> Either color color
  fromColorE = Right . fromColor

  {-# MINIMAL
    toColor,  fromColor |
    toColorE, fromColorE #-}

instance IsColor Color where
  toColor = id
  fromColor = id

instance IsColor Rgb24 where
  toColor = Color
  fromColor = unColor

instance IsColor Ansi24 where
  toColor = toColor . unAnsi24
  fromColor = Ansi24 . fromColor

