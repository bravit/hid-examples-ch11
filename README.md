# An introduction to type-level programming in Haskell

## Content

The Haskell type system is good for specifying user intentions and helping the compiler to check code correctness. Unfortunately, there is sometimes a barrier before that level where beginning Haskell programmer can read and write complex type annotations. This is often the case with such libraries as `lens` or `servant`. With this tutorial, I aim to bring participants behind that barrier. I’ll present several type-level programming tools including type families, GADTs and data kinds.

We'll discuss the following GHC extensions and the corresponding Haskell features in this tutorial:

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE GADTSyntax #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE NoStarIsType #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE ExplicitForAll #-}
```

## Plan

0. Haskell in depth: chapter 11

1. Terms, types, kinds
  * ch11/intro.hs

2. Phantom types and proxy types
  * ch11/temperatures/TempPhantom.hs
  * ch11/temperatures/UnitNameProxies.hs

3. Type applications
  * ch11/vta-read.hs
  * ch11/temperatures/UnitNameTypeApps.hs

4. Type operators
  * ch11/type-operators.hs

5. Data kinds 
  * ch11/temperatures/temp-kinds.hs

6. Type-level literals
  * ch11/type-lits/Pointers.hs
  * ch11/type-lits/SuffixedStrings.hs

7. Type synonym families
  * ch11/type-families/SimplifyWiden.hs

8. Data families
  * ch11/type-families/XListable.hs

9. Associated families
  * ch11/type-families/Graphs.hs (-)

10. Generalised algebraic datatypes
  * ch11/dyn-simple.hs
  * ch11/dynvalues-gadt.hs

11. Arbitrary-rank polymorphism
  * ch11/nummod-rank-n/process.hs
  * ch11/nummod-rank-n/NumUtils.hs
  * ch11/nummod-rank-n/Main.hs


## Setup

Please, run the following commands:

```
git clone https://github.com/bravit/hid-examples-ch11
cd hid-examples-ch11
stack build
```

That's it!  You are ready for the tutorial.
