module PrintTheRainbow.Placement (
  Placement(..),
) where

data Placement
  = Foreground
  | Background
  deriving (Show, Eq, Ord)

