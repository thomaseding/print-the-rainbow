module PrintTheRainbow.Color (
  Color,
  IsColor(..),
) where

import           PrintTheRainbow.Color.Ansi24 (Ansi24(..), putAnsi24)
import           PrintTheRainbow.Color.Rgb24 (Rgb24(..))
import           PrintTheRainbow.Placement (Placement)

newtype Color = Color
  { unColor :: Rgb24
  }

class IsColor c where
  putColor :: Placement -> c -> String
  putColor placement = putAnsi24 placement . Ansi24 . unColor . toColor

  toColor :: c -> Color
  toColor = either id id . toColorE

  fromColor :: Color -> c
  fromColor = either id id . fromColorE

  toColorE :: c -> Either Color Color
  toColorE = Right . toColor

  fromColorE :: Color -> Either c c
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

