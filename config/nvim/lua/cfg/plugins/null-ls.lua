local lspconfig = require("cfg.plugins.lspconfig")
local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
	-- python --
	fmt.black,
	fmt.isort,
	diag.mypy,
	diag.flake8,
	-- diag.pydocstyle,

	-- web-dev --
	fmt.prettier, -- js/ts/css/scss/html/json/md/
	fmt.stylelint, -- scss/less/css/sass
	diag.stylelint, -- scss/less/css/sass

	fmt.rustfmt.with({ extra_args = { "--edition=2021" } }), -- rust
	fmt.stylua, -- lua
    fmt.cmake_format, -- cmake
    fmt.clang_format, -- C/C++/...
    fmt.brittany, -- haskell
}

null_ls.setup({
	sources = sources,
	on_attach = lspconfig.on_attach,
})
