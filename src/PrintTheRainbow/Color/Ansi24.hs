module PrintTheRainbow.Color.Ansi24 (
) where


import PrintTheRainbow.Color
import PrintTheRainbow.Placement


newtype Ansi24 = Ansi24 { unAnsi24 :: Rgb24 }


instance IsColor Ansi24 where
    toColor = toColor . unAnsi24
    fromColor = Ansi24 . fromColor


put :: Placement -> Ansi24 -> String
put placement ansi = let
    placementChar = case p of
        Foreground -> '3'
        Backgorund -> '4'
    Rgb r g b = unAnsi ansi
    in "\ESC["
        ++ placementChar
        : "8;2;"
        ++ show r
        : ';'
        ++ show g
        : ';'
        ++ show b
        ++ "m"

   
