{-# OPTIONS --cubical --safe #-}
-- Hodge Theory Formalization  
-- Part of "Unified Geometric-Arithmetic Structures"
-- Contributors: ElXavier, LambdaMystic

module HodgeFormalization where

open import Cubical.Core.Everything
open import Cubical.Foundations.Prelude
open import Data.Nat
open import TensorHierarchy

postulate
  H : Nat -> Set -> Set
  isCohomologyGroup : forall n X -> isGroup (H n X)

record HodgeStructure : Set1 where
  field
    underlyingSpace : Set
    hodgeFiltration : Nat -> Set
    hodgeDecomposition : forall n -> 
      hodgeFiltration n ≃ H n underlyingSpace

postulate
  tensorCohomology : forall k -> HodgeStructure
  hodgeTensorConnection : forall k -> 
    H 1 (HodgeStructure.underlyingSpace (tensorCohomology k)) ≃ 
    TensorHierarchy k