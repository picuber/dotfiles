local config = require("nvim-treesitter.configs")

config.setup({
	ensure_installed = "all", -- "all", "maintained" or a list of languages
	sync_install = false, -- only applies to `ensure_installed`
	ignore_install = { "" }, -- ignore these for `ensure_installed``
	highlight = {
		enable = true,
		disable = { "" }, -- disable for these languages
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = false }, -- this currently breaks the auto-indent
	playground = { enable = true },
	context_commentstring = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- auto-jump forward to textobj
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	autotag = { enable = true, enable_close_on_slash = false },
	matchup = { enable = true },
})

-- set folding
vim.cmd([[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
]])
