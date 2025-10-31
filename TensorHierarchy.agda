{-# OPTIONS --cubical --safe #-}
-- Tensor Hierarchies in Cubical Agda
-- Formalization for "Unified Geometric-Arithmetic Structures"
-- Contributors: ElXavier, LambdaMystic

module TensorHierarchy where

open import Cubical.Core.Everything
open import Cubical.Foundations.Prelude
open import Data.Nat

postulate
  C : Set
  zeroC oneC : C
  addC mulC : C -> C -> C

data TensorHierarchy : Nat -> Set1 where
  BaseLevel : C -> TensorHierarchy 0
  TensorLift : {k : Nat} -> 
    (TensorHierarchy k -> TensorHierarchy k -> TensorHierarchy k) ->
    TensorHierarchy (suc k)

_⊗_ : {k : Nat} -> TensorHierarchy k -> TensorHierarchy k -> TensorHierarchy k
_⊗_ {zero} (BaseLevel a) (BaseLevel b) = BaseLevel (mulC a b)
_⊗_ {suc k} (TensorLift f) (TensorLift g) = 
  TensorLift (\ x y -> f x y ⊗ g x y)