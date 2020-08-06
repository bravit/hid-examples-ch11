{-# LANGUAGE GADTs #-}

-- >>> :section GADTs

data DynValue a where
  S :: String -> DynValue String
  C :: Char -> DynValue Char
  B :: Bool -> DynValue Bool

--ghci

-- >>> :type S
-- >>> :type C
-- >>> :type B
-- >>> :back



getValue :: DynValue a -> a
getValue (B b) = b
getValue (C c) = c
getValue (S s) = s

printValue :: DynValue a -> IO ()
printValue (B b) = print b -- Where does the 'Show' instance come from?
printValue (C c) = print c
printValue (S s) = print s


-- >>> mapM_ printValue [S "hello", S "bye"]
-- >>> :type [S "hello", S "bye"]
-- >>> [S "hello", B True]
-- <TYPE ERROR>
-- >>> :back

wrap :: a -> DynValue a
wrap = undefined


-- >>> :set -fprint-explicit-foralls
-- >>> :type wrap
-- >>> :back


data WrappedDynValue where
  Wrap :: DynValue a -> WrappedDynValue


-- data SomeException = forall e . Exception e => SomeException e


fromString :: String -> WrappedDynValue
fromString str
  | str `elem` ["y", "yes", "true"] = Wrap (B True)
  | str `elem` ["n", "no", "false"] = Wrap (B False)
  | length str == 1 = Wrap (C $ head str)
  | otherwise = Wrap (S str)

printWDValue :: WrappedDynValue -> IO ()
printWDValue (Wrap dv) = printValue dv


-- >>> printWDValue (fromString "y")
-- True
-- >>> printWDValue (fromString "x")
-- >>> printWDValue (fromString "hello")
-- "hello"
-- >>> mapM_ (printWDValue . fromString) ["y", "no", "xxx", "c"]



main :: IO ()
main = mapM_ (printWDValue . fromString) ["y", "no", "xxx", "c"]
