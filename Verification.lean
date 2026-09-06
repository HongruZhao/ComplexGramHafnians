import ComplexGramHafnians
import Lean.Util.CollectAxioms

/-! Fail the build if either public proof has a different axiom set.
This checks the proof dependency closure, not just declarations in source. -/
open Lean Elab Command

run_cmd do
  let expected : Array Name := #[``propext,
    ``Classical.choice,
    ``Quot.sound]
  for decl in #[``ComplexGramHafnians.theorem2_1, ``ComplexGramHafnians.theorem2_3] do
    let axioms ← Lean.collectAxioms decl
    let unexpected := axioms.filter fun ax => !expected.contains ax
    let missing := expected.filter fun ax => !axioms.contains ax
    unless unexpected.isEmpty && missing.isEmpty do
      throwError "{decl}: unexpected axioms {unexpected}; missing expected axioms {missing}"
    logInfo m!"PASS {decl}: exactly {axioms.size} axioms: {axioms}"

#print axioms ComplexGramHafnians.theorem2_1
#print axioms ComplexGramHafnians.theorem2_3
