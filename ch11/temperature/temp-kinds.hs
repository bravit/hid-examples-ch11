{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}

data TempUnits = F | C

newtype Temp (u :: TempUnits) = Temp Double
  deriving (Num, Fractional)
--ghci

-- >>> :set -XNoStarIsType -XDataKinds
-- >>> :type F
-- F :: TempUnits
-- >>> :kind F
-- F :: TempUnits
-- >>> :kind TempUnits
-- TempUnits :: Type
-- :back


paperBurning :: Temp F
paperBurning = 451

absoluteZero :: Temp C
absoluteZero = -273.15

f2c :: Temp F -> Temp C
f2c (Temp f) = Temp ((f-32)*5/9)

-- ghci

-- >>> f2c paperBurning - absoluteZero
-- 505.92777777777775°C
-- >>> paperBurning - absoluteZero
-- <TYPE ERROR>
-- >>> 0 :: Temp Bool
-- <TYPE ERROR>
-- >>> :back

class UnitName (u :: TempUnits) where
  unitName :: String

instance UnitName C where
  unitName = "C"

instance UnitName F where
  unitName = "F"

instance UnitName u => Show (Temp u) where
  show (Temp t) = show t ++ "°" ++ unitName @u

unit :: forall u. UnitName u => Temp u -> String
unit _ = unitName @u

printTemp :: UnitName u => Temp u -> IO ()
printTemp t = do
  putStrLn $ "Temperature: " ++ show t
  putStrLn $ "Units: " ++ unit t

diff :: Temp C
diff = f2c paperBurning - absoluteZero

main :: IO ()
main = do
  printTemp paperBurning
  printTemp absoluteZero
  printTemp diff
