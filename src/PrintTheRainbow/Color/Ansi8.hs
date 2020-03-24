module PrintTheRainbow.Color.Ansi8 (
  Ansi8(..),
  putAnsi8,
) where

import qualified Data.List as List
import           PrintTheRainbow.Color (IsColor(..))
import           PrintTheRainbow.Color.Rgb24 (Rgb24(..), distanceSquared)
import           PrintTheRainbow.Placement (Placement(..))

data Ansi8
  = Black
  | Red
  | Green
  | Yellow
  | Blue
  | Magenta
  | Cyan
  | White
  | BrightBlack
  | BrightRed
  | BrightGreen
  | BrightYellow
  | BrightBlue
  | BrightMagenta
  | BrightCyan
  | BrightWhite
  deriving (Show, Eq, Ord, Enum)

instance IsColor Ansi8 where
  toColorE ansi =
    let rgb = case ansi of
          Black         -> Rgb24 0   0   0
          Red           -> Rgb24 128 0   0
          Green         -> Rgb24 0   128 0
          Yellow        -> Rgb24 128 128 0
          Blue          -> Rgb24 0   0   128
          Magenta       -> Rgb24 128 0   128
          Cyan          -> Rgb24 0   128 128
          White         -> Rgb24 192 192 192
          BrightBlack   -> Rgb24 128 128 128
          BrightRed     -> Rgb24 255 0   0
          BrightGreen   -> Rgb24 0   255 0
          BrightYellow  -> Rgb24 255 255 0
          BrightBlue    -> Rgb24 0   0   255
          BrightMagenta -> Rgb24 255 0   255
          BrightCyan    -> Rgb24 0   255 255
          BrightWhite   -> Rgb24 255 255 255
    in Left $ toColor rgb

  fromColorE color =
    let rgb = fromColor color
        f rgb' = (distanceSquared rgb rgb', rgb')
        closest = snd $ List.minimumBy fst $ map (f . toColor) [0..]
    in Left closest

putAnsi8 :: Placement -> Ansi8 -> String
putAnsi8 placement ansi =
  let base = case ansi of
        Black         -> 30
        Red           -> 31
        Green         -> 32
        Yellow        -> 33
        Blue          -> 34
        Magenta       -> 35
        Cyan          -> 36
        White         -> 37
        BrightBlack   -> 90
        BrightRed     -> 91
        BrightGreen   -> 92
        BrightYellow  -> 93
        BrightBlue    -> 94
        BrightMagenta -> 95
        BrightCyan    -> 96
        BrightWhite   -> 97
      adjusted = show $ case placement of
        Foreground -> base
        Background -> base + 10
  in "\ESC[" ++ adjusted ++ "m"

