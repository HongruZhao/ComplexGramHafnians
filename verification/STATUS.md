# Recorded verification

**Status: PASS for the public Lean build and exact axiom audit.**

| Item | Recorded result |
| --- | --- |
| Build command | `lake build` |
| Start, UTC | `2026-09-06T20:19:16.951325+00:00` |
| Finish, UTC | `2026-09-06T20:19:52.354612+00:00` |
| Exit status | `0` |
| Reported Lake jobs | `8930` (includes dependency and cached jobs) |
| Time for this invocation | `35.4` seconds |
| Lean | `4.33.0-rc2`, pinned in `lean-toolchain` |
| mathlib | `641fbd329d4ffb62bef83c51f54088469056bd36` |
| Comparator / Nanoda | Not run for this release |

## Public endpoint dependency audit

`ComplexGramHafnians.theorem2_1`: exactly **3** axiom dependencies.

- `propext`
- `Classical.choice`
- `Quot.sound`

`ComplexGramHafnians.theorem2_3`: exactly **3** axiom dependencies.

- `propext`
- `Classical.choice`
- `Quot.sound`

The exact-set assertion in `Verification.lean` ran as part of the build.
It rejects both unexpected axioms and a mismatch with the documented set.

## What ran and what was reused

The build used the existing cache of the exact pinned mathlib dependencies.
The local release started with a copy of the matching inherited project cache;
Lake rebuilt invalidated project modules under the new project name. All new
public specifications, proof adapters, and the verification module were freshly
elaborated. This is a real build receipt, not an inference from a source scan.

Existing support files retain their linter warnings. The new specification,
public library, and verification library treat warnings as errors.
The recorded invocation may reuse project outputs generated earlier during
this local rebuild; its elapsed time is not a clean-machine build benchmark.

Cached objects were not independently checked by Nanoda or another kernel.
The build is not a bootstrap of Lean and mathlib from their sources.

- [Build log](final_build.log)
- [Source-hashed execution receipt](final_build_receipt.json)
- [Release identity and extracted axiom names](release_identity.json)
- [Source and import audit](source_audit.json)

The source audit checks all shipped Lean files, including `Challenge.lean`
and `Verification.lean`. It checks import closure, inherited source identity,
forbidden proof markers, and declared project axioms. It does not run Lean.

The archive check separately verifies a fresh extraction and its file hashes.
Human mathematical correspondence and source-theorem authentication are
separate from these execution and integrity checks.
