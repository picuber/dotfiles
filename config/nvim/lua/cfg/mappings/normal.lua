local function map(key, cmd)
	vim.keymap.set("", key, cmd, { noremap = true })
end
local function maps(key, cmd)
	vim.keymap.set("", key, cmd, { noremap = true, silent = true })
end

maps("<F2>", ":NvimTreeToggle<CR>")
maps("<F10>", ":MundoToggle<CR>")

map("<Space>", ":") -- simpler EX commands
