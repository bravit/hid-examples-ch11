{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE ScopedTypeVariables #-}

module UnitNameTypeApps where

import TempPhantomNoShow

class UnitName u where
  unitName :: String

instance UnitName C where
  unitName = "C"

instance UnitName F where
  unitName = "F"

-- {-# LANGUAGE PolyKinds #-}
instance UnitName Temp where
  unitName = "_unspecified unit_"

--ghci
-- >>> :set -XTypeApplications
-- >>> unitName @C
-- >>> :back



instance UnitName u => UnitName (Temp u) where
  unitName = unitName @u

instance UnitName u => Show (Temp u) where
  show (Temp t) = show t ++ "°" ++ unitName @u

unit :: forall u. UnitName u => Temp u -> String
unit _ = unitName @u

--ghci



-- >>> paperBurning
-- >>> unit paperBurning

