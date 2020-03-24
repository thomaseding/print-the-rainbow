module PrintTheRainbow.Color.Ansi8 (
) where

import           PrintTheRainbow.Color ()
import           PrintTheRainbow.Color.Rgb (Rgb(..), distance)
import           PrintTheRainbow.Placement ()

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

instance IsColor Ansi24 where
  toColorE ansi =
    let rgb = case ansi of
          Black         -> Rgb 0   0   0
          Red           -> Rgb 128 0   0
          Green         -> Rgb 0   128 0
          Yellow        -> Rgb 128 128 0
          Blue          -> Rgb 0   0   128
          Magenta       -> Rgb 128 0   128
          Cyan          -> Rgb 0   128 128
          White         -> Rgb 192 192 192
          BrightBlack   -> Rgb 128 128 128
          BrightRed     -> Rgb 255 0   0
          BrightGreen   -> Rgb 0   255 0
          BrightYellow  -> Rgb 255 255 0
          BrightBlue    -> Rgb 0   0   255
          BrightMagenta -> Rgb 255 0   255
          BrightCyan    -> Rgb 0   255 255
          BrightWhite   -> Rgb 255 255 255
    in Left $ toColor rgb

  fromColorE color =
    let rgb = fromColor color
        f rgb' = (distance rgb rgb', rgb')
        closest = snd $ minimumBy fst $ map (f . toColor) [0..]
    in Left closest

put :: Placement -> Ansi24 -> String
put placement ansi =
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


