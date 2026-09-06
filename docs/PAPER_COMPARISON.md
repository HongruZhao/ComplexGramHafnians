# Headline theorem comparison

Scope: the current complex anticoncentration manuscript's Theorems 2.1 and
2.3 (`thm:main-finite` and `thm:symmetric-gaussian-anticoncentration` in
`sections/01_introduction.tex`). This focused release follows the two-result
organization of RealGramHafnians, with the complex paper's own statements and
quadratic disk probabilities.

## Probability models and notation

| Paper | Lean definition | Interpretation |
| --- | --- | --- |
| $n$, $k$, $N=2n$ | `n k : ℕ`; `Fin (2*n)` | Pair count, Gaussian row count, number of Gram columns |
| $X\in\mathbb{C}^{k\times 2n}$, iid $\mathrm{CN}(0,1)$ | `ComplexColumnMatrix n k`; `circularGaussianColumnMatrixMeasure n k` | A tuple of $2n$ independent Gaussian columns, each in $\mathbb{C}^{k}$ |
| $\mathrm{haf}(X^{\mathsf{T}}X)$ | `gramHafnianObservable n k X` | `rowMatrix` converts the column tuple to the literal rectangular matrix; the Gram product has no conjugation |
| $\sigma_{k,n}$ | `gramHafnianSigma k n` | Square root of the proved absolute second moment |
| $B_{k,n}$ | `CurrentPRL.paperBkn k n` | Exact finite product coefficient; argument order is $k,n$ |
| $b_n$ | `CurrentPRL.paperBn n` | $\frac{2\Gamma(n+1/2)}{\sqrt{\pi}\,\Gamma(n)}$ |
| Complex symmetric Gaussian $S$ | `complexSymmetricGaussianFullMatrixLaw n` | Product of edge Gaussians with variance-two diagonal Gaussians |
| $\mathrm{haf}(S)$ | `fullSymmetricHafnian p` | Hafnian of the assembled symmetric matrix; equal to the edge hafnian for every diagonal |
| $\sigma_n$ | `SymmetricGaussianHafnian.sigma n` | $\sqrt{(2n-1)!!}$ |
| Disk probability | `Measure.real {x \| ‖H x - z‖ ≤ ε*σ}` | Actual measure of the closed disk event, converted to a real number |

The product law of the complex entries uses real and imaginary components
with variance $\frac{1}{2}$. No inverse-moment, small-ball, or density assumption is
passed to either public theorem. The sufficient conditions $n \ge 1$, $k \ge 4n$
are explicit hypotheses of `theorem2_1`.

## Specification fields and proofs

All fields below are printed in [Challenge.lean](../Challenge.lean). Their
assembly is in [ComplexGramHafnians.lean](../ComplexGramHafnians.lean).
The exact finite-Gram second moment is

```math
\mathbb{E}\lvert\mathrm{haf}(X^{\mathsf{T}}X)\rvert^2=(2n-1)!!\prod_{q=0}^{n-1}(k+2q).
```

| Paper claim | Specification field | Existing mathematical proof used |
| --- | --- | --- |
| Positive finite-Gram normalization | `Theorem21.rmsPositive` | `gramHafnianSigma_pos` |
| Exact finite-Gram second moment (display above) | `Theorem21.exactSecondMoment` | `actualGramFirstMomentReal_eq_closedFirstMoment`, with the literal integral and double-factorial translation |
| The same formula for $\sigma^2$ | `Theorem21.rmsSquared` | `gramHafnianSigma_sq` |
| All centers, all nonnegative radii, coefficient $B_{k,n}$ and cap $1$ | `Theorem21.shiftedSmallBall` | `gaussianGramHafnianShiftedAnticoncentration_min`; Fourier and Wishart steps are proved in its import closure |
| Formula for $b_n$ | `Theorem21.limitingCoefficientFormula` | `paperBn_eq_gamma` |
| Finite product for $B_{k,n}$ | `Theorem21.coefficientProduct` | `paperBkn_eq_product` |
| Finite exponential estimate | `Theorem21.coefficientBound` | `paperBkn_le_sharper` |
| Fixed-degree coefficient limit | `Theorem21.coefficientLimit` | `tendsto_shiftedAnticoncentrationConstant_fixed_degree` |
| Existence and explicit bound for $\theta$, $k \ge 8n$ | `Theorem21.logarithmicRemainder` | The exact log identity, remainder envelope, and large-dimension envelope inequality |
| Positive symmetric normalization | `Theorem23.rmsPositive` | Positivity of the odd double factorial |
| Literal full-matrix second moment | `Theorem23.exactSecondMoment` | New `fullMatrixSecondMoment` adapter: off-diagonal pushforward, integral transport, `integral_normSq_edgeHafnian` |
| Symmetric RMS formula | `Theorem23.rmsSquared` | `sigma_sq` and `oddPairingNat_eq_doubleFactorial` |
| Full-matrix disk probability, exact $b_n$ | `Theorem23.shiftedSmallBall` | New `fullMatrixSmallBall` adapter: `symmetricHafnian_shifted_smallBall`, coefficient identity, diagonal invariance, pushforward measure |
| Gamma formula and coefficient limit | `Theorem23.coefficientFormula`, `.coefficientLimit` | The same proved finite-coefficient endpoints |
| $b_n\le 2\sqrt{n/\pi}$ | `Theorem23.elementaryCoefficient` | `paperBn_le_two_div_sqrt_pi_mul_sqrt` with exact square-root algebra |

The full-matrix adapter preserves the probability cap and uses arbitrary
complex centers. The symmetric result is direct; it does not assume that a
finite Gram estimate transfers by weak convergence. The finite-Gram theorem
does not assume the conditional Wishart estimate: that estimate is part of
the proof closure.

## Trust and coverage

Both public results must pass the exact three-foundation dependency check in
[Verification.lean](../Verification.lean). The entire shipped project source
is also scanned for additional axiom declarations and proof escape markers.
A source scan is a separate check and cannot replace the Lean build.

The specifications are mathematical propositions using the library's actual
model definitions. They share those definitions with the proofs; this is not
an independent Comparator specification. Human review should check the entry
variance, ordinary-transpose convention, hafnian matching definition, RMS
normalization, and the finite-dimensional range.

This release does not certify every display in the manuscript. In particular,
Corollary 2.2 on independent perturbations, the Wick obstruction and its finite
certificate, appendix asymptotics beyond the displayed headline remainder,
and extended conditional density statements are outside the public scope.
No sharp inverse-moment threshold or new Gaussian density assertion has been
added to imitate a stronger statement from the real paper.
