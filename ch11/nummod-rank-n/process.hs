{-# LANGUAGE RankNTypes #-}

-- parametric polymorphism
len :: [a] -> Int
len [] = 0
len (x:xs) = 1 + len xs


-- >>> :section Polymorphism

-- >>> len [1,2,3]
-- >>> len [True, True, False]
-- >>> len [Just 'x', Nothing, Just 'y']
-- >>> :back

-- ad hoc (to this) polymorphism
inc :: Num a => a -> a
inc n = n + 1


processInts :: (Int -> Int) -> [Int] -> [Int]
processInts f xs = map f xs





processInts' :: Num a => (a -> a) -> [a] -> [a]
processInts' f xs = map f xs





processInts'' :: Num a => (a -> a) -> [Int] -> [Int]
processInts'' f xs = undefined -- map f xs





processInts''' :: (forall a. Num a => a -> a) -> [Int] -> [Int]
processInts''' f xs = map f xs
