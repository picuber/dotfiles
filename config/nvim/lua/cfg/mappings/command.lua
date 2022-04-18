-- local map = vim.keymap.set
-- local noremap = { noremap = true }

-- does not work in nvim, https://github.com/neovim/neovim/issues/1716
--   you can use https://github.com/lambdalisue/suda.vim instead
-- map("c", "w!!", "w !sudo tee % > /dev/null", noremap) -- sudo write

-- forgiving caps commands
vim.cmd([[command Q q]]) --quit
