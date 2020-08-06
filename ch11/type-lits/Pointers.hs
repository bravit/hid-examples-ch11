{-# LANGUAGE DataKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}

-- >>> :section Type-level literals

-- >>> :set -XDataKinds -XNoStarIsType
-- >>> :kind 42
-- 42 :: Nat
-- >>> :kind Nat
-- Nat :: Type
-- >>> :kind "hello"
-- "hello" :: Symbol
-- >>> :kind Symbol
-- Symbol :: Type
-- >>> :kind []
-- [] :: Type -> Type
-- >>> :kind [Int, String, Bool]
-- [Int, String, Bool] :: [Type]
-- >>> :back

-- Example: aligned pointers
module Pointers (Pointer, ptrValue, inc, maybePtr, zeroPtr) where

import GHC.TypeLits
import Data.Proxy

newtype Pointer (align :: Nat) = Pointer Integer

zeroPtr :: Pointer n
zeroPtr = Pointer 0

inc :: Pointer align -> Pointer align
inc (Pointer p) = Pointer (p + 1)





ptrValue :: forall align. KnownNat align =>
            Pointer align -> Integer
ptrValue (Pointer p) = p * natVal (Proxy :: Proxy align)





-- ghci
-- >>> :section Aligned pointers
-- >>> :set -XDataKinds
-- >>> ptrValue (inc $ zeroPtr :: Pointer 4)
-- 4
-- >>> ptrValue (inc $ zeroPtr :: Pointer 8)
-- 8
-- >>> :back




maybePtr :: forall align. KnownNat align =>
            Integer -> Maybe (Pointer align)
maybePtr p
  | reminder == 0 = Just (Pointer quotient)
  | otherwise = Nothing
  where
    (quotient, reminder) = divMod p (natVal (Proxy :: Proxy align))
--ghci


-- >>> mbptr1 = maybePtr 24 :: Maybe (Pointer 8)
-- >>> ptrValue <$> mbptr1
-- Just 24
-- >>> mbptr2 = maybePtr 42 :: Maybe (Pointer 8)
-- >>> ptrValue <$> mbptr2
-- Nothing
