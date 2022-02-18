-- nord --
vim.g.nord_italic = 1
vim.g.nord_italic_comments = 1
vim.g.nord_underline = 1
-- vim.g.nord_cursor_line_number_background = 1

-- molokai --
vim.g.molokai_original = 1

-- set theme--
vim.cmd([[colorscheme nord]])
-- vim.cmd [[colorscheme molokai]]

-- highlight --
vim.cmd([[
    highlight ErrorMsg ctermbg=black guibg=black
    highlight Folded ctermbg=black ctermfg=blue
]])
