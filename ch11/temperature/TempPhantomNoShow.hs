{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module TempPhantomNoShow where

-- Does it make sense to have types without values? Absolutely!

-- 'unit' is called a phantom type
newtype Temp unit = Temp Double
  deriving (Num, Fractional)

-- empty declarations
data F
data C

paperBurning :: Temp F
paperBurning = 451

absoluteZero :: Temp C
absoluteZero = -273.15
--ghci

-- $
-- >>> paperBurning - absoluteZero
-- <TYPE ERROR>
-- >>> paperBurning - paperBurning
-- Temp 0.0
-- >>> :back





f2c :: Temp F -> Temp C
f2c (Temp f) = Temp ((f-32)*5/9)
--ghci




-- $
-- >>> f2c paperBurning - absoluteZero
-- Temp 505.92777777777775
-- >>> :back





nonsence :: Temp Bool
nonsence = 0
--ghci



-- $
-- >>> nonsence
-- Temp 0.0

