-- Leaders --
vim.g.mapleader = ','
vim.g.maplocalleader = ';'

-- Languages --
vim.g.tex_flavor = 'latex'  -- default to LaTeX
vim.g.loaded_perl_provider=0 -- disable perl support
vim.g.loaded_python_provider=0 -- disable python2 support
vim.g.loaded_ruby_provider=0 -- disable ruby support
vim.g.python3_host_prog = '~/.pyenv/versions/nvim/bin/python' -- set python3 executable

-- greeter
vim.opt.shortmess:append {I = true} -- disable intro message

-- Cursor --
-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.colorcolumn = {80, 120}

-- mouse --
vim.opt.mouse = 'a' -- enable mouse in all modes

-- looks --
vim.opt.title = true

-- updating --
vim.opt.updatetime = 1000 -- update swaps more often (every 1000ms)
vim.opt.lazyredraw = true -- don't redraw while executing macros/commands

-- lines/scrolling --
vim.opt.wrap = false -- don't wrap lines
vim.opt.scrolloff = 3 -- start scrolling n lines before window border (horizontal)
vim.opt.sidescrolloff = 7 -- start scrolling n lines before window border (vertical)
vim.opt.whichwrap:append '<,>,[,]'  -- allow arrow keys to wrap

-- tabs --
vim.opt.tabstop = 4 -- a tab is 4 spaces
vim.opt.shiftwidth = 4 -- shift 4 spaces at autoindent
vim.opt.expandtab = true -- convert tabs to spaces

-- search --
vim.opt.ignorecase = true -- case-insensitive search ...
vim.opt.smartcase = true -- ... except when using upper-case letters
vim.opt.gdefault = true -- set 'g' flag to default on in :s, set flag to turn it off

-- command completion --
vim.opt.wildignorecase = true -- file completion is case-insensitive
