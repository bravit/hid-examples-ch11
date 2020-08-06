{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}

module SuffixedStrings (SuffixedString, suffixed, asString) where

import GHC.TypeLits
import Data.Proxy

-- >>> :section Suffixed strings

data SuffixedString (suffix :: Symbol) = SS String

suffixed :: String -> SuffixedString suffix
suffixed s = SS s

asString :: forall suffix. KnownSymbol suffix =>
            SuffixedString suffix -> String
asString (SS str) = str ++ "@" ++ symbolVal (Proxy :: Proxy suffix)

-- >>> :set -XDataKinds
-- >>> id1 = suffixed "bravit" :: SuffixedString "teachers"
-- >>> id2 = suffixed "bravit" :: SuffixedString "devs"
-- >>> asString id1
-- "bravit@teachers"
-- >>> asString id2
-- "bravit@devs"
