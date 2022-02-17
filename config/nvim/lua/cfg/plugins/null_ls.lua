local lspconfig = require 'cfg.plugins.lspconfig'
local null_ls = require 'null-ls'
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
        -- python --
        fmt.black,
        fmt.isort,
        diag.mypy,
        diag.flake8,
        diag.pydocstyle,
        -- rust --
        fmt.rustfmt.with({ extra_args = { '--edition=2021'}}),
        -- lua --
        fmt.stylua,

        -- web-dev --
        fmt.prettier, -- js/ts/css/scss/html/json/md/
        -- css --
        fmt.stylelint, -- scss/less/css/sass
        diag.stylelint, -- scss/less/css/sass
	}


null_ls.setup({
    sources = sources,
    on_attach = lspconfig.on_attach,
})
