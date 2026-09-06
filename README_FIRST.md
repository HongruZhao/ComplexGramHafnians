# Start here

Read [README.md](README.md) for the exact mathematical scope and assumptions,
then [Challenge.lean](Challenge.lean) for the public specifications.

With elan installed, run from this directory:

```sh
lake exe cache get
lake build
python3 scripts/source_audit.py
```

Lean and mathlib are pinned by `lean-toolchain`, `lakefile.toml`, and
`lake-manifest.json`. Dependencies and build caches are downloaded or rebuilt;
they are not bundled. The default build includes the exact public axiom audit.

The dated execution evidence is in [verification/STATUS.md](verification/STATUS.md).
The paper comparison is in [docs/PAPER_COMPARISON.md](docs/PAPER_COMPARISON.md).
