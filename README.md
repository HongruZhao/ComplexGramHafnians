# Complex Gram Hafnians

Lean 4 formalization of the two headline results in Hongru Zhao,
*Local Anticoncentration for Gaussian Boson Sampling via Conditional
Wishart Geometry*: Theorems 2.1 and 2.3 in the revised manuscript.

The public results use actual Gaussian matrix probability laws and are proved
without project axioms. Their proof dependencies are restricted to Lean's
standard foundations: `propext`, `Classical.choice`, and `Quot.sound`.

## Results

For $n \ge 1$, $k \ge 4n$, let $X$ be a $k \times 2n$ matrix with independent circular
complex Gaussian entries of variance one, and let $H=\mathrm{haf}(X^{\mathsf{T}}X)$. Write

```math
\sigma_{k,n}^2=\mathbb{E}|H|^2
=(2n-1)!!\prod_{q=0}^{n-1}(k+2q),\qquad
b_n=\frac{2\Gamma(n+1/2)}{\sqrt{\pi}\,\Gamma(n)},
```

```math
B_{k,n}=b_n\frac{k}{k-1}
\prod_{r=2}^{n}\frac{k+2r-2}{k-4r+1}.
```

Theorem 2.1 states, for every center $z\in\mathbb{C}$ and $\varepsilon\ge 0$,

```math
\mathbb{P}\{|H-z|\le\varepsilon\sigma_{k,n}\}
\le\min\{1,B_{k,n}\varepsilon^2\}.
```

The public specification also includes the exact second moment, positivity of
the normalization, the displayed product for $B_{k,n}$, the finite bound

```math
B_{k,n}\le b_n\exp\!\left(
\frac{3n^2-2}{k}+\frac{9n^3}{k(k-4n+1)}\right),
```

the limit $B_{k,n}\to b_n$ as $k\to\infty$ for fixed $n$, and the quantified logarithmic remainder
for $k \ge 8n$:

```math
B_{k,n}=b_n e^{3n^2/k+\theta},\qquad
|\theta|\le \frac{2}{k}+\frac{94n^3}{k^2}.
```

For a $2n \times 2n$ complex symmetric Gaussian matrix $S$, its upper off-diagonal
entries are independent circular Gaussians of variance one. The full model
also has independent diagonal entries of variance two; the ordinary hafnian
does not depend on the diagonal. Theorem 2.3 states

```math
\sigma_n^2=\mathbb{E}|\mathrm{haf}(S)|^2=(2n-1)!!.
```

```math
\mathbb{P}\{|\mathrm{haf}(S)-z|\le\varepsilon\sigma_n\}
\le\min\{1,b_n\varepsilon^2\},\qquad b_n\le2\sqrt{n/\pi}.
```

The Lean names `Theorem21` and `Theorem23` refer to manuscript Theorems
**2.1** and **2.3**, respectively:

- **Theorem 2.1 (finite complex Gram ensemble):** the shifted disk-probability
  bound for $\mathrm{haf}(X^{\mathsf{T}}X)$, with coefficient $B_{k,n}$,
  for $n\ge 1$ and $k\ge 4n$.
- **Theorem 2.3 (independent complex symmetric Gaussian ensemble):** the
  shifted disk-probability bound for $\mathrm{haf}(S)$, with coefficient
  $b_n$, for $n\ge 1$.

Each Lean specification also includes the normalization and coefficient facts
listed above. The declarations below prove those specifications.

| Public declaration | Lean specification |
| --- | --- |
| `ComplexGramHafnians.theorem2_1` | `Theorem21 n k`, under $1\le n$ and $4n\le k$ |
| `ComplexGramHafnians.theorem2_3` | `Theorem23 n`, under $1\le n$ |

Read [Challenge.lean](Challenge.lean) for every field of these specifications
and [ComplexGramHafnians.lean](ComplexGramHafnians.lean) for their proofs.
The [paper comparison](docs/PAPER_COMPARISON.md) connects the fields to the
manuscript and identifies the probability models.

## Build and audit

The project pins Lean `4.33.0-rc2` and mathlib commit
`641fbd329d4ffb62bef83c51f54088469056bd36`, as in the successful real Gram release.
With [elan](https://github.com/leanprover/elan) installed:

```sh
lake exe cache get
lake build
python3 scripts/source_audit.py
```

The default build includes [Verification.lean](Verification.lean). It fails if
either public theorem has any axiom dependency beyond the exact three listed
above, including a proof placeholder or a native-decision oracle. The source
audit separately checks all shipped Lean files and the local import closure.
See [verification/STATUS.md](verification/STATUS.md) for the recorded run and
its precise use of caches.

## Structure and scope

The release follows the public-result, explicit-assumption, pinned-build, and
formalization-metadata organization of
[PrimeGaps186](https://github.com/openai/PrimeGaps186/tree/61340d0b74163003b32756bb16e91d9209a5e330).
There are no intentional theorem placeholders in this release.

The specification shares model definitions with the proof library. This is
checked proof assembly, not an independent reconstruction of the mathematical
statement. Comparator and Nanoda have not been run for this release; no such
result is inferred from the reference repositories.

`LogdetLean/` contains the inherited source modules required by the public
results. Only the two headline results are the coverage claim of this focused
release. The independent perturbation corollary, Wick obstruction, extended
density conclusions, and the paper's other appendices are outside that claim.
In particular, the sufficient range $k \ge 4n$ is not asserted to be sharp.

See [formalization.yaml](formalization.yaml),
[source provenance](docs/PROVENANCE.md), and the
[inherited source hashes](docs/INHERITED_SOURCES.json).
The existing [GPL-3.0 license](LICENSE) and source notices are preserved.

## Archival release

The companion [Zenodo archive](https://doi.org/10.5281/zenodo.22554594),
version **1.1.0**, preserves a fixed snapshot of this focused repository together
with the broader Lean development, paper-to-code correspondence, and verification
records. GitHub is the development location for Theorems **2.1** and **2.3**;
Zenodo archives the wider verification materials and documents their coverage
limits. Manuscript PDFs and LaTeX files are not included in the Zenodo ZIP.
