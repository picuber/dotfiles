-- include functions of https://github.com/tpope/vim-unimpaired

local function lmap(key, cmd)
	vim.api.nvim_set_keymap("", "<leader>" .. key, cmd, { noremap = true })
end
local function lmaps(key, cmd)
	vim.api.nvim_set_keymap("", "<leader>" .. key, cmd, { noremap = true, silent = true })
end

-- buffer --
lmap("bs", ":ls<CR>:b<Space>") -- show/list
---select ---
lmap("bb", "<C-^>") -- toggle
lmaps("bl", ":bnext<CR>") -- next buffer
lmaps("bh", ":bprevious<CR>") -- prev buffer
--- delete ---
lmap("bd", ":ls<CR>:bdelete<Space>") -- select buffer to delete
lmaps("bD", ":bdelete<CR>") -- delete current buffer

-- tabs --
lmaps("tc", ":tabnew<CR>") -- create new tab
lmaps("ts", ":tabs<CR>") -- show/list
--- select ---
lmap("tt", "g<Tab>") -- toggle
lmaps("tl", ":tabnext<CR>") -- next tab
lmaps("th", ":tabprevious<CR>") -- prev tab
lmaps("tg", ":tabs<CR>:tabnext<Space>") -- goto tab
--- delete ---
lmap("td", ":tabs<CR>:tabclose<Space>") -- select tab to delete
lmaps("tD", ":tabclose<CR>") -- delete this tab
lmap("to", ":tabs<CR>:tabonly<Space>") -- select tab to only
lmaps("tO", ":tabonly<CR>") -- only this tab
--- move ---
lmap("tM", ":tabmove<Space>") -- select tab movement
lmaps("tm0", ":0tabmove<CR>") -- move to first
lmaps("tm<", ":-tabmove<CR>") -- move left
lmaps("tm>", ":+tabmove<CR>") -- move right
lmaps("tm$", ":$tabmove<CR>") -- move to last

-- window --
--- split ---
lmaps("ws", ":split<CR>") -- current buffer
lmaps("wS", ":vsplit<CR>") -- current buffer (vert)
lmaps("wn", ":new<CR>") -- new buffer
lmaps("wN", ":vnew<CR>") -- new buffer (vert)
lmap("wb", ":ls<CR>:sbuffer<Space>") -- select buffer
lmap("wB", ":ls<CR>:vertical sbuffer<Space>") -- select buffer (vert)
lmap("wf", ":split<Space>") -- select buffer
lmap("wF", ":vertical split<Space>") -- select buffer (vert)
--- select ---
lmap("ww", "<C-W><C-P>") -- toggle
lmap("wW", "<C-W><C-W>") -- cycle
lmap("wh", "<C-W><C-H>") -- left
lmap("wl", "<C-W><C-L>") -- right
lmap("wk", "<C-W><C-K>") -- up
lmap("wj", "<C-W><C-J>") -- down
--- delete ---
lmaps("wD", ":close<CR>") -- close window
lmaps("wO", ":only<CR>") --
-- move ---
lmap("wH", "<C-W>H") -- left
lmap("wL", "<C-W>L") -- right
lmap("wK", "<C-W>K") -- up
lmap("wJ", "<C-W>J") -- down
lmap("wx", "<C-W>x") -- exchange
lmap("wr", "<C-W>r") -- rotate
lmap("wR", "<C-W>R") -- rotate (reverse)
lmap("wt", "<C-W>T") -- to new tab
--- resize ---
lmap("w>", "5<C-W>>") -- bigger (width)
lmap("w<", "5<C-W><") -- smaller (width)
lmap("w+", "5<C-W>+") -- bigger (height)
lmap("w-", "5<C-W>-") -- smaller (height)
lmap("w=", "<C-W>=") -- everything equal size

-- options --
local function opt(key, cmds)
	lmaps([[,.]] .. key, ":set " .. table.concat(cmds, " ") .. "<CR>")
	lmaps([[,]] .. key, ":set inv" .. table.concat(cmds, " inv") .. "<CR>")
	lmaps([[,']] .. key, ":set no" .. table.concat(cmds, " no") .. "<CR>")
end

opt("n", { "number" })
opt("N", { "relativenumber" })
opt("s", { "spell" })
opt("w", { "wrap" })
opt("x", { "cursorcolumn", "cursorline" })
opt("y", { "list" }) -- "symbols"
lmaps(",h", ":nohlsearch<CR>") -- turn off search highlight
lmaps(",l", ":lclose<CR>") -- close location list
lmaps(",c", ":cclose<CR>") -- close qickfix list

-- pairs --
local nxt = function(key, cmd)
	lmaps([[.]] .. key, ":" .. cmd .. "<CR>")
end
local prv = function(key, cmd)
	lmaps([[']] .. key, ":" .. cmd .. "<CR>")
end
nxt("l", "lnext!") -- location list
prv("l", "lprev!") -- location list
nxt("c", "cnext!") -- quickfix list
prv("c", "cprev!") -- quickfix list

-- spell --
--- languages ---
local function lang(key, langs)
	--[[~/.config/nvim/spell/tok.vim disables spellcapcheck,
        which checks for the capitalisation of sentences.
        Toki pona writes everything but Names small, other languages
        start sentences big. Thus reset it here.]]
	lmaps(
		"sl" .. key,
		[[:set spellcapcheck=[.?!]\\_[\\])'\"\ \\t]\\+<CR>]] .. ":setlocal spelllang=" .. langs .. ",cjk<CR>"
	)
end

lang("e", "en_gb") -- English
lang("d", "de_de") -- German
lang("D", "de_de,en_gb") -- common
lang("o", "eo") -- Esperanto
lang("s", "sv") -- Swedish
lang("t", "tok") -- toki pona
lang("T", "tok,en_gb") -- toki pona + English
--- fix mistake ---
lmap("sn", "]s") -- next mistake
lmap("sp", "[s") -- prev mistake
lmap("sa", "z=") -- suggest correct spelling (alternatives)
--- dictionaries ---
lmap("sg", "zg") -- add good word
lmap("sG", "zug") -- un-add good word
lmap("sb", "zw") -- add bad (wrong) word
lmap("sG", "zuw") -- un-add bad (wrong) word
lmap("stg", "zG") -- temp-good word
lmap("stG", "zuG") -- un-temp-good word
lmap("stb", "zW") -- temp-bad word
lmap("stB", "zuW") -- un-temp-bad word

-- Misc --
lmaps("xx", ":%!xxd<CR>:set ft+=xxd<CR>")
lmaps("xr", ":%!xxd -r<CR>")
lmaps("xR", ":%!xxd -r<CR>:%!xxd<CR>")

-- colours --
--- colorscheme ---
lmaps("cn", ":colorscheme nord<CR>")
lmaps("cm", ":colorscheme molokai<CR>")
--- lualine ---
lmaps("cln", ":lua require('lualine').setup({ options = { theme = 'nord' } })<CR>")
lmaps("clm", ":lua require('lualine').setup({ options = { theme = 'molokai' } })<CR>")
lmaps("clM", ":lua require('lualine').setup({ options = { theme = 'material' } })<CR>")
lmaps("clo", ":lua require('lualine').setup({ options = { theme = 'onedark' } })<CR>")
lmaps("clO", ":lua require('lualine').setup({ options = { theme = 'onelight' } })<CR>")
lmaps("clp", ":lua require('lualine').setup({ options = { theme = 'palenight' } })<CR>")
lmaps("cls", ":lua require('lualine').setup({ options = { theme = 'solarized_light' } })<CR>")
--- colorscheme + lualine ---
lmaps("Cn", ":colorscheme nord<CR>:lua require('lualine').setup({ options = { theme = 'nord' } })<CR>")
lmaps("Cm", ":colorscheme molokai<CR>:lua require('lualine').setup({ options = { theme = 'molokai' } })<CR>")

-- Plugins --
lmaps("oo", ":Obsession<CR>")
lmaps("od", ":Obsession!<CR>")

lmaps("ot", ":NvimTreeToggle<CR>") -- [o]pen nvim-[t]ree
lmaps("ou", ":MundoToggle<CR>") -- [o]pen m[u]ndo
