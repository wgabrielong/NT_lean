import data.pnat.prime
open nat
/-
This code outlines formalizes the proofs in Chapter 1 of Hardy and Wright's "An Introduction to the Theory of Numbers". 
Where availible, the theorems are proven using tools directly availible in mathlib. 
-/

/-
Theorem 1: Every positive integer, except 1, is a product of primes. 
-/
theorem product_of_primes {n : ℕ} (hn : nat.prime n) : n.factors = [n] := 
begin
  exact nat.factors_prime hn,
end

/-
Theorem 2: (The Fundamental Theorem of Arithmetic) The standard form of n is unique; 
apart from rearrangement of factors, n can be expressed as a product of primes in only
one way. 

  This theorem is stated without proof in Chapter 1. We formalize the proof in Chapter 2.

Theorem 3: (Euclid's First Theorem) If p is prime, and p|ab, then p|a or p|b.

  This theorem is stated without proof in Chapter 1. We formalize the proof in Chapter 2.

Theorem 4: (Euclid's Second Theorem) The number of primes is infinite. 

  This theorem stated without proof in Chapter 1. We formalize the proof in Chapter 2. 

Theorem 5: There are blocks of consecutive composite numbers whose length exceeds any given number N.

  This theorem is stated without proof in Chapter 1. 

Theorem 6: (The Prime Number Theorem) The number of primes not exceeding x is asymptotic to x/log(x). 

  This theorem is stated without proof in Chapter 1. We formalize the proof in Chapter 22.

Theorem 7: (Tchebychef's Theorem) The order of magnitude of n(x) is x/log(x).

  This theorem is stated without proof in Chapter 1. 

Theorem 8: p_n is asymptotic to n log(n). 

  This theorem is stated without proof in Chapter 1. 

Theorem 9: The order of magnitude of p_n is n log(n). 

  This theorem is stated without proof in Chapter 1.
-/