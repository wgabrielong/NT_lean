import data.pnat.prime
import tactic.linarith
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
-/
theorem fundamental_theorem_aritihmetic {n : ℕ} {l : list ℕ} (h₁ : l.prod = n) (h₂ : ∀ (p : ℕ), p ∈ l → nat.prime p)  : l ~ n.factors :=
begin
  exact nat.factors_unique h₁ h₂,
end

/-
Theorem 3: (Euclid's First Theorem) If p is prime, and p|ab, then p|a or p|b.

  This theorem is stated without proof in Chapter 1. We formalize the proof in Chapter 2.
-/
theorem euclid_first {p a b : ℕ} (q : nat.prime p) : p ∣ a * b → p ∣ a ∨ p ∣ b :=
begin
  exact (nat.prime.dvd_mul q).mp,
end

/-
Theorem 4: (Euclid's Second Theorem) The number of primes is infinite. 

  This theorem stated without proof in Chapter 1. We formalize the proof in Chapter 2. 
-/
theorem euclid_second : ∀ N, ∃ p ≥ N, prime p :=
begin
  intro N,

  let M := factorial N + 1,
  let p := min_fac M,

  have pp : prime p :=
  begin
    refine min_fac_prime _,
    have : factorial N > 0 := factorial_pos N,
    linarith,
  end,

  use p,
  split,
  {
  by_contradiction, 
  have h1 : p ∣ factorial N + 1 := min_fac_dvd M,
  have h2 : p ∣ factorial N := 
  begin
     refine pp.dvd_factorial.mpr _,
     exact le_of_not_ge h,
   end,
  have h : p ∣ 1 := (nat.dvd_add_right h2).mp h1,
  exact prime.not_dvd_one pp h,
  },
  {
  exact pp,
  },
end -- This proof follows from the Lean Prover Demo (https://youtu.be/b59fpAJ8Mfs)

/-
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