local lspconfig = require("cfg.plugins.lspconfig")
local null_ls = require("null-ls")
local fmt = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics
local act = null_ls.builtins.code_actions

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
local sources = {
    -- general --
    act.gitsigns,

    -- python --
    fmt.black,
    fmt.isort,
    diag.mypy,
    -- TODO replace flake8 with ruff (apparently, see: https://github.com/nvimtools/none-ls.nvim/issues/58)
    require("none-ls.diagnostics.flake8"), -- [from none-ls-extras]
    -- diag.flake8.with({ args = {
    -- 	"--max-line-length",
    -- 	"119",
    -- 	"--stdin-display-name",
    -- 	"$FILENAME",
    -- 	"-",
    -- } }),
    -- diag.pydocstyle,

    -- web-dev --
    fmt.prettier, -- js/ts/css/scss/html/json/md/
    fmt.stylelint, -- scss/less/css/sass
    diag.stylelint, -- scss/less/css/sass
    -- fmt.eslint_d, -- js/ts
    -- diag.eslint_d, -- js/ts
    -- act.eslint_d, -- js/ts
    -- TODO replace eslint_d with eslint-language-server
    require("none-ls.formatting.eslint_d"),   -- [from none-ls-extras]
    require("none-ls.diagnostics.eslint_d"),  -- [from none-ls-extras]
    require("none-ls.code_actions.eslint_d"), -- [from none-ls-extras]

    -- fmt.rustfmt.with({ extra_args = { "--edition=2021" } }), -- rust
    fmt.stylua,    -- lua
    fmt.cmake_format, -- cmake
    fmt.clang_format.with({
        disabled_filetypes = { "java" },
    }),        -- C/C++/Java/...
    -- TODO replace with haskell-language-server
    -- fmt.fourmolu, -- haskell
    -- TODO replace with lemminx
    -- fmt.xmllint, -- XML
}

null_ls.setup({
    sources = sources,
    on_attach = lspconfig.on_attach,
})
