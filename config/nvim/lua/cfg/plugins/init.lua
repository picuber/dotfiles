-- Bootstrap on first open
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
local present, packer = pcall(require, "packer")
if not present and vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	-- check success
	vim.cmd("packadd packer.nvim")
	present, packer = pcall(require, "packer")
	if present then
		vim.notify("packer.vim installation successful", vim.log.levels.INFO)
	else
		vim.notify("packer.vim installation failed", vim.log.levels.ERROR)
		return
	end
end

-- Sync on write
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost ~/.dotfiles/config/nvim/lua/cfg/plugins/init.lua source <afile> | PackerSync
    augroup end
]])

-- Use floating window
packer.reset()
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer

	-- colorschemes --
	use("arcticicestudio/nord-vim")
	use("tomasr/molokai")

	-- tpope --
	use("tpope/vim-repeat") -- more . repeats
	use("tpope/vim-surround") -- easer pair editing (tags/parentheses/quotes/...)
	use("tpope/vim-commentary") -- easier commenting
	use("tpope/vim-obsession") -- (auto-)save (n)vim sessions
	use("tpope/vim-speeddating") -- inc/dec dates (C-a/C-x)

	-- snippets --
	use("L3MON4D3/LuaSnip") -- snippet engine

	-- cmp --
	use({
		"hrsh7th/nvim-cmp", -- auto completion
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" }, -- buffer source
			{ "hrsh7th/cmp-path", after = "nvim-cmp" }, -- path source
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" }, -- cmdline/search source
			-- {'dmitmel/cmp-digraphs', after = 'nvim-cmp'}, -- digraph source
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" }, -- nvim lua config source
			{
				"hrsh7th/cmp-nvim-lsp", -- LSP source
				after = "nvim-cmp",
				requires = "neovim/nvim-lspconfig",
			},
			{
				"saadparwaiz1/cmp_luasnip", -- snippet source
				after = { "nvim-cmp", "LuaSnip" },
				requires = "LuaSnip",
			},
		},
		config = [[ require("cfg.plugins.cmp") ]],
	})

	-- LSP --
	use({
		"neovim/nvim-lspconfig",
		after = { "nvim-cmp", "cmp-nvim-lsp" },
		requires = "hrsh7th/cmp-nvim-lsp",
		config = [[ require("cfg.plugins.lspconfig").setup() ]],
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		after = "nvim-lspconfig",
		requires = "nvim-lua/plenary.nvim",
		config = [[ require("cfg.plugins.null-ls") ]],
	})

	-- treesitter --
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/playground", after = "nvim-treesitter", cmd = "TSPlaygroundToggle" },
			{ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{
				"andymass/vim-matchup",
				after = "nvim-treesitter",
				config = [[ require("cfg.plugins.nvim-treesitter") ]],
			},
		},
	})

	-- tools --
	use("vimwiki/vimwiki")

	-- QoL --
	use("ap/vim-css-color") -- highligt color definitions in that color
	use("lambdalisue/suda.vim") -- sudo write workaround
	use({
		"windwp/nvim-autopairs", -- auto-close parens/braces/etc.
		after = "nvim-cmp",
		config = [[ require("cfg.plugins.nvim-autopairs") ]],
	})
	use({
		"lewis6991/gitsigns.nvim", -- git decorations
		requires = "nvim-lua/plenary.nvim",
		config = [[ require("cfg.plugins.gitsigns") ]],
	})
	use({
		"simnalamburt/vim-mundo", -- visualise undo tree
		cmd = "MundoToggle",
		config = [[ require("cfg.plugins.vim-mundo") ]],
	})
	use({
		"ntpeters/vim-better-whitespace", -- show and delete trailing whitespace
		config = [[ require("cfg.plugins.vim-better-whitespace") ]],
	})
	use({
		"dhruvasagar/vim-table-mode", -- easier table creation
		config = [[ require("cfg.plugins.vim-table-mode") ]],
	})
	use({ "mattn/emmet-vim", config = [[ require('cfg.plugins.emmet-vim') ]] })

	-- Syntax --
	use("tridactyl/vim-tridactyl") -- tridactyl config syntax file

	-- Automatic initial plugin installation
	if packer_bootstrap then
		require("packer").sync()
	end
end)
