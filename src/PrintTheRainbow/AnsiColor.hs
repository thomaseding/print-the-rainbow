module PrintTheRainbow.AnsiColor (
  IsAnsiColor(..),
) where

import           PrintTheRainbow.Color (IsColor(..))
import           PrintTheRainbow.Color.Ansi8 (Ansi8(..), putAnsi8)
import           PrintTheRainbow.Color.Ansi24 (Ansi24(..), putAnsi24)
import           PrintTheRainbow.Color.Rgb24 (Rgb24(..))
import           PrintTheRainbow.Placement (Placement(..))

class IsColor color => IsAnsiColor color where
  putColor :: Placement -> color -> String
  putColor placement = putAnsi24 placement . Ansi24 . unColor . toColor

instance IsAnsiColor Ansi8
  putColor = putAnsi8

instance IsAnsiColor Ansi24
  putColor = putAnsi24

instance IsAnsiColor Rgb24

