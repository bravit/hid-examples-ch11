{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE InstanceSigs #-}

module UnitNameProxies where

import Data.Proxy
import TempPhantomNoShow


-- data Proxy t = Proxy







class UnitName u where
  unitName :: Proxy u -> String

instance UnitName C where
  unitName :: Proxy C -> String
  unitName _ = "C"

instance UnitName F where
  unitName :: Proxy F -> String
  unitName _ = "F"
--ghci

-- >>> :section Creating proxies at term-level

-- $
-- >>> unitName (Proxy :: Proxy F)
-- "F"
-- >>> unitName (Proxy :: Proxy C)
-- "C"
-- >>> :back

-- {-# LANGUAGE ScopedTypeVariables #-}
instance UnitName unit => UnitName (Temp unit) where
  unitName _ = unitName (Proxy :: Proxy unit)

instance UnitName unit => Show (Temp unit) where
  show (Temp t) = show t ++ "°" ++ unitName (Proxy :: Proxy unit)


--ghci

-- >>> :section Demo for Show instance

-- >>> paperBurning
-- >>> absoluteZero
-- >>> :back

-- >>> :section Scoped type variables in function bodies


-- {-# LANGUAGE ScopedTypeVariables #-}
unit :: forall u. UnitName u => Temp u -> String
unit _ = unitName (Proxy :: Proxy u)

--ghci


-- $
-- >>> unit paperBurning
-- >>> unit absoluteZero
-- >>> :back




someFunc :: proxy a -> String
someFunc _ = "OK"
--ghci

-- >>> :section Proxies as type variables

-- $
-- >>> someFunc (Just 'x')
-- >>> someFunc (Right 'x')
-- >>> someFunc []
-- >>> someFunc (Proxy :: Proxy Bool)
