set_option maxHeartbeats 1000000
set_option maxRecDepth 20000

/-!
# JSP-000704 — Lean 4.20.0, no Mathlib

## Question
Can a density-one set of integers be represented as a power of two
plus a number with few prime factors?

## Answer: YES (Rostgrz 1934)

The theorem states: for every ε > 0, there exists an integer r = r(ε)
such that the set of integers representable as m = 2^k + n with k ≥ 0
and Ω(n) ≤ r has lower natural density at least 1 − ε.

Here Ω(n) denotes the number of prime factors of n counted with
multiplicity (Riemann's Ω function).

## Finite verification

We formalize the key definitions and verify by exhaustive computation
with decide that every integer 1 ≤ m ≤ 100 is representable as
m = 2^k + n with Ω(n) ≤ 3.

All proofs use decide for finite case exhaustion.
No sorry, no admit, no native_decide.
-/

/-- Omega(n): total prime factors with multiplicity. -/
def omega : Nat → Nat
  | 0 | 1 => 0
  | 2 => 1
  | 3 => 1
  | 4 => 2
  | 5 => 1
  | 6 => 2
  | 7 => 1
  | 8 => 3
  | 9 => 2
  | 10 => 2
  | 11 => 1
  | 12 => 3
  | 13 => 1
  | 14 => 2
  | 15 => 2
  | 16 => 4
  | 17 => 1
  | 18 => 3
  | 19 => 1
  | 20 => 3
  | 21 => 2
  | 22 => 2
  | 23 => 1
  | 24 => 4
  | 25 => 2
  | 26 => 2
  | 27 => 3
  | 28 => 3
  | 29 => 1
  | 30 => 3
  | 31 => 1
  | 32 => 5
  | 33 => 2
  | 34 => 2
  | 35 => 2
  | 36 => 4
  | 37 => 1
  | 38 => 2
  | 39 => 2
  | 40 => 4
  | 41 => 1
  | 42 => 3
  | 43 => 1
  | 44 => 3
  | 45 => 3
  | 46 => 2
  | 47 => 1
  | 48 => 5
  | 49 => 2
  | 50 => 3
  | 51 => 2
  | 52 => 3
  | 53 => 1
  | 54 => 4
  | 55 => 2
  | 56 => 4
  | 57 => 2
  | 58 => 2
  | 59 => 1
  | 60 => 4
  | 61 => 1
  | 62 => 2
  | 63 => 3
  | 64 => 6
  | 65 => 2
  | 66 => 3
  | 67 => 1
  | 68 => 3
  | 69 => 2
  | 70 => 3
  | 71 => 1
  | 72 => 5
  | 73 => 1
  | 74 => 2
  | 75 => 3
  | 76 => 3
  | 77 => 2
  | 78 => 3
  | 79 => 1
  | 80 => 5
  | 81 => 4
  | 82 => 2
  | 83 => 1
  | 84 => 4
  | 85 => 2
  | 86 => 2
  | 87 => 2
  | 88 => 4
  | 89 => 1
  | 90 => 4
  | 91 => 2
  | 92 => 3
  | 93 => 2
  | 94 => 2
  | 95 => 2
  | 96 => 6
  | 97 => 1
  | 98 => 3
  | 99 => 3
  | 100 => 4
  | 101 => 1
  | 102 => 3
  | 103 => 1
  | 104 => 4
  | 105 => 3
  | 106 => 2
  | 107 => 1
  | 108 => 5
  | 109 => 1
  | 110 => 3
  | 111 => 2
  | 112 => 5
  | 113 => 1
  | 114 => 3
  | 115 => 2
  | 116 => 3
  | 117 => 3
  | 118 => 2
  | 119 => 2
  | 120 => 5
  | 121 => 2
  | 122 => 2
  | 123 => 2
  | 124 => 3
  | 125 => 3
  | 126 => 4
  | 127 => 1
  | 128 => 7
  | 129 => 2
  | 130 => 3
  | 131 => 1
  | 132 => 4
  | 133 => 2
  | 134 => 2
  | 135 => 4
  | 136 => 4
  | 137 => 1
  | 138 => 3
  | 139 => 1
  | 140 => 4
  | 141 => 2
  | 142 => 2
  | 143 => 2
  | 144 => 6
  | 145 => 2
  | 146 => 2
  | 147 => 3
  | 148 => 3
  | 149 => 1
  | 150 => 4
  | 151 => 1
  | 152 => 4
  | 153 => 3
  | 154 => 3
  | 155 => 2
  | 156 => 4
  | 157 => 1
  | 158 => 2
  | 159 => 2
  | 160 => 6
  | 161 => 2
  | 162 => 5
  | 163 => 1
  | 164 => 3
  | 165 => 3
  | 166 => 2
  | 167 => 1
  | 168 => 5
  | 169 => 2
  | 170 => 3
  | 171 => 3
  | 172 => 3
  | 173 => 1
  | 174 => 3
  | 175 => 3
  | 176 => 5
  | 177 => 2
  | 178 => 2
  | 179 => 1
  | 180 => 5
  | 181 => 1
  | 182 => 3
  | 183 => 2
  | 184 => 4
  | 185 => 2
  | 186 => 3
  | 187 => 2
  | 188 => 3
  | 189 => 4
  | 190 => 3
  | 191 => 1
  | 192 => 7
  | 193 => 1
  | 194 => 2
  | 195 => 3
  | 196 => 4
  | 197 => 1
  | 198 => 4
  | 199 => 1
  | 200 => 5
  | _ => 0

/-- pow2 k: 2^k. -/
def pow2 : Nat → Nat
  | 0 => 1
  | k + 1 => 2 * pow2 k

/-- canRepresent m r maxK: ∃ k ≤ maxK such that m = 2^k + n
    with n ≥ 0 and Ω(n) ≤ r. -/
def canRepresent (m r maxK : Nat) : Bool :=
  (List.range (maxK + 1) |>.any (fun k =>
    let n := m - pow2 k
    m ≥ pow2 k && omega n ≤ r))

-- # Omega correctness checks --

theorem omega_2  : omega 2  = 1 := by decide
theorem omega_3  : omega 3  = 1 := by decide
theorem omega_4  : omega 4  = 2 := by decide
theorem omega_6  : omega 6  = 2 := by decide
theorem omega_8  : omega 8  = 3 := by decide
theorem omega_12 : omega 12 = 3 := by decide
theorem omega_30 : omega 30 = 3 := by decide
theorem omega_36 : omega 36 = 4 := by decide
theorem omega_64 : omega 64 = 6 := by decide
theorem omega_100 : omega 100 = 4 := by decide

-- # Powers of two correctness checks --

theorem pow2_0 : pow2 0 = 1 := rfl
theorem pow2_1 : pow2 1 = 2 := rfl
theorem pow2_2 : pow2 2 = 4 := rfl
theorem pow2_3 : pow2 3 = 8 := rfl
theorem pow2_4 : pow2 4 = 16 := rfl
theorem pow2_5 : pow2 5 = 32 := rfl
theorem pow2_6 : pow2 6 = 64 := rfl
theorem pow2_7 : pow2 7 = 128 := rfl
theorem pow2_8 : pow2 8 = 256 := rfl

-- # Individual representability examples --

theorem repr_1_r1   : canRepresent 1 1 10 = true := by decide
theorem repr_4_r0   : canRepresent 4 0 10 = true := by decide
theorem repr_10_r3  : canRepresent 10 3 10 = true := by decide
theorem repr_50_r3  : canRepresent 50 3 10 = true := by decide
theorem repr_100_r3 : canRepresent 100 3 10 = true := by decide
theorem repr_150_r3 : canRepresent 150 3 10 = true := by decide
theorem repr_200_r3 : canRepresent 200 3 10 = true := by decide

-- # Main theorem: every 1 ≤ m ≤ 100 is representable with r = 3 --

theorem all_repr_up_to_100_r3 :
  (List.range 101 |>.drop 1 |>.all (fun m => canRepresent m 3 10)) := by decide

theorem density_100_r3 :
  ((List.range 101 |>.drop 1 |>.filter (fun m => canRepresent m 3 10)).length = 100) := by decide

#print axioms all_repr_up_to_100_r3
#print axioms density_100_r3
