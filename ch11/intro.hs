-- Intro
-- Haskell can be used as a calculator without thinking about types


f2c f = (f-32)*5/9
-- ghci







-- >>> :section Welcome to my GHCi!

-- $
-- >>> f2c 32
-- 0.0
-- >>> f2c 86
-- 30.0
-- >>> :type f2c
-- f2c :: Fractional a => a -> a
-- >>> :type f2c 32
-- f2c 32 :: Fractional a => a
-- >>> import Data.Ratio
-- >>> f2c (100%3)
-- 20 % 27
-- >>> :back


f2c' :: Double -> Double
f2c' f = (f-32) * 5/9

-- ghci




-- $
-- >>> :type f2c' 32
-- f2c' 32 :: Double

-- >>> :☛ So, we have terms and types.
-- >>> :section Let's classify types

-- $
-- >>> :kind Integer
-- Integer :: *
-- >>> :kind Int
-- Int :: *
-- >>> :kind Maybe
-- Maybe :: * -> *
-- >>> :kind Maybe Int
-- Maybe Int :: *

-- >>> :section '*' is outdated

-- $
-- >>> :set -XNoStarIsType
-- >>> :kind Integer
-- Integer :: Type
-- >>> :kind Bool
-- Bool :: Type
-- >>> :kind Maybe
-- Maybe :: Type -> Type
-- >>> :kind Either
-- Either :: Type -> Type -> Type
-- >>> :kind Maybe Int
-- Maybe Int :: Type

-- >>> :section "Ok, what about Fractional?"

-- $
-- >>> :kind Fractional
-- Fractional :: Type -> Constraint
-- >>> :kind Fractional Double
-- Fractional Double :: Constraint
-- >>> :kind Monad
-- Monad :: (Type -> Type) -> Constraint
-- >>> :kind Maybe
-- Maybe :: Type -> Type
-- >>> :kind Monad Int
-- <TYPE ERROR>

-- >>> :section "Let's introduce type variables"

-- $
-- >>> :kind Maybe a
-- <ERROR>
-- >>> :set -XExplicitForAll
-- >>> :kind forall a. Maybe a
-- forall a. Maybe a :: Type
-- >>> :kind forall m. Monad m
-- forall m. Monad m :: Constraint

-- >>> :section "Can we classify kinds?"

-- $
-- >>> import Data.Kind (Type, Constraint)
-- >>> :type Type
-- <ERROR>
-- >>> :kind Type
-- Type :: Type
-- >>> :kind Constraint
-- Constraint :: Type

-- >>> :☛ We have terms, types, and kinds.
-- >>> :☛ Kinds are also types!



main = undefined
