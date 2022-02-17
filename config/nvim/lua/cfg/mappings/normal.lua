local function map(key, cmd)
	local opt = { noremap = true }
	vim.api.nvim_set_keymap("", key, cmd, opt)
end

map("<Space>", ":") -- simpler EX commands
