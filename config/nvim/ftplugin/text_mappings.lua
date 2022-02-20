local function imap(key, char)
	vim.api.nvim_set_keymap("i", "<LocalLeader>" .. key, char, { noremap = true })
end

-- german
imap("cda", "ä")
imap("cdo", "ö")
imap("cdu", "ü")
imap("cds", "ß")
imap("cd<S-a>", "Ä")
imap("cd<S-o>", "Ö")
imap("cd<S-u>", "Ü")

-- swedisch
imap("csa", "å")
imap("cs<S-a>", "Å")

-- greek
imap("cga", "α")
imap("cgb", "β")
imap("cgg", "γ")
imap("cgd", "δ")
imap("cge", "ε")
imap("cgy", "η")
imap("cgh", "θ")
imap("cgl", "λ")
imap("cgm", "μ")
imap("cgn", "ν")
imap("cgc", "ξ")
imap("cgp", "π")
imap("cgr", "ρ")
imap("cgs", "σ")
imap("cgt", "τ")
imap("cgf", "φ")
imap("cgx", "χ")
imap("cgq", "ψ")
imap("cgo", "ω")
imap("cg<S-g>", "Γ")
imap("cg<S-d>", "Δ")
imap("cg<S-h>", "Θ")
imap("cg<S-l>", "Λ")
imap("cg<S-p>", "Π")
imap("cg<S-s>", "Σ")
imap("cg<S-f>", "Φ")
imap("cg<S-x>", "χ")
imap("cg<S-o>", "Ω")

-- math
imap("cmx", "×")
imap("cmp", "∂") -- \partial
imap("cmi", "∞") -- \infty
imap("cmr", "√") -- square root	∛ ∜
imap("cmc", "∘") -- \circ
imap("cmm", "⊨") -- \models
imap("cmb", "⊥") -- \"bottom\", \"error\"
imap("cme", "∃") -- \exists
imap("cmf", "∀") -- \forall
imap("cmq", "≡") -- \equiv
imap("cma", "∧") -- \land
imap("cmo", "∨") -- \lor
imap("cmn", "∈") -- \in
imap("cmz", "∉") -- \notin
imap("cms", "⊆") -- \subseteq
imap("cmv", "⊇") -- \supseteq
imap("cml", "≤") -- \leq
imap("cmg", "≥") -- \geq
imap("cmd", "≠") -- \neq  \"differing\"
imap("cmt", "↦") -- \mapsto
imap("cmy", "∅") -- \emptyset
imap("cmh", "∩") -- \cap	\"hat\"
imap("cmu", "∪") -- \cup
imap("cmw", "⊢") -- \vdash, entails/proves/satisfies

-- other
imap("coe", "…") --		horizontal ellipsis
imap("con", "<C-v>u0338") -- mathematical \"not\" as diacritic
