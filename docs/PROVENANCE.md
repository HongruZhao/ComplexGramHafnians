# Provenance and reproducibility

Prepared locally on 2026-09-06 for Hongru Zhao's **Local Anticoncentration for Gaussian Boson Sampling via Conditional Wishart Geometry**.
The manuscript previously used the title *Shifted Anticoncentration of Complex Gaussian Gram Hafnians via Conditional Wishart Geometry*.
The starting source project was `verification_2026-09-04/sources/GBS_Anticoncentration_Lean`
in the two-paper workspace. The author manuscript used for the crosswalk is
the Sept. 5 revision, including the subsequent abstract edits. No manuscript
wording or original proof source was changed to produce this release.

The files in `LogdetLean/` are exact copies of the required inherited local
import closure. [INHERITED_SOURCES.json](INHERITED_SOURCES.json) records every
original content hash. The source audit checks those identities. New public
specifications, proof adapters, and the exact axiom audit live separately at
the repository root.

The existing GPL-3.0-only licensing of the GBS source release is retained;
following another repository's organization does not relicense these proofs.
Existing attribution and third-party notices remain applicable. Historical
module names and comments mentioning older PRL/PRX drafts are retained for
source identity; the current coverage claim is the explicit public one in
the README and paper comparison.

## Reference repository snapshots

- [PrimeGaps186](https://github.com/openai/PrimeGaps186/tree/61340d0b74163003b32756bb16e91d9209a5e330),
  commit `61340d0b74163003b32756bb16e91d9209a5e330`: organization, conditional
  status, explicit axiom statements, mathematical source translations, and
  formalization metadata.
- [RealGramHafnians](https://github.com/HongruZhao/RealGramHafnians/tree/0a44d28245d78bdf095922f4268979ec62b3bf19),
  commit `0a44d28245d78bdf095922f4268979ec62b3bf19`: complete proposition-valued
  public specifications, actual Gaussian models, and a strict Lean axiom
  dependency audit.

These public snapshots were inspected directly. Their reported validation
results are not evidence that the new projects passed. The new build and
audit receipts are recorded separately in `verification/`.

## Reproduction boundary

The archive contains project source, build configuration, pinned dependency
manifest, documentation, and verification records. It excludes `.git`, `.lake`,
compiled objects, and the cloned reference repositories. A first build needs
the pinned Lean toolchain and network access for the manifest dependencies
and mathlib cache. No absolute dependency symlink is shipped.

Local builds use a pre-existing cache for the exact pinned mathlib and may
reuse matching inherited module outputs. New release modules are elaborated
and checked locally. The dated run status states which build actually ran.
This is not a compiler-from-source bootstrap or an independent Nanoda run.

The source audit and ZIP extraction checks establish package integrity and
declared source scope. They do not substitute for kernel checking, human
mathematical review, or source authentication.
