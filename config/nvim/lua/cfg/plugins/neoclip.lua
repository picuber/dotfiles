require("neoclip").setup({
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<C-P>",
				paste_behind = "<C-N>",
				replay = "<C-R>", -- replay a macro
				delete = "<C-D>", -- delete an entry
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "r",
				delete = "x",
			},
		},
	},
})
