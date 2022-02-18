local function map(key, cmd)
	vim.api.nvim_set_keymap("", key, cmd, { noremap = true })
end
local function maps(key, cmd)
	vim.api.nvim_set_keymap("", key, cmd, { noremap = true, silent = true })
end

maps("<F10>", ":MundoToggle<CR>")

map("<Space>", ":") -- simpler EX commands
