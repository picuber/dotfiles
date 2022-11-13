local nvim_tree = require("nvim-tree")

nvim_tree.setup({
	-- disable_netrw = true,        -- conflicts with spell file downloads
	hijack_cursor = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	view = {
		mappings = {
			custom_only = true,
			list = {
				-- open
				{ key = { "<CR>", "o", "l" }, action = "edit" },
				{ key = { "O" }, action = "edit_no_picker" },
				{ key = { "s" }, action = "vsplit" },
				{ key = { "x" }, action = "split" },
				{ key = { "t" }, action = "tabnew" },
				{ key = "<Tab>", action = "preview" },

				-- cwd
				{ key = { "+", "_", "=" }, action = "cd" },
				{ key = "-", action = "dir_up" },

				-- movement
				{ key = "K", action = "prev_sibling" },
				{ key = "J", action = "next_sibling" },
				{ key = "<", action = "first_sibling" },
				{ key = ">", action = "last_sibling" },
				{ key = "p", action = "parent_node" },
				{ key = "h", action = "close_node" },

				-- toggle
				{ key = "I", action = "toggle_ignored" },
				{ key = "H", action = "toggle_dotfiles" },
				{ key = "R", action = "refresh" },
				{ key = "a", action = "create" },

				-- path
				{ key = "r", action = "rename" },
				{ key = "y", action = "copy_name" },
				{ key = "Y", action = "copy_path" },
				{ key = "gy", action = "copy_absolute_path" },

				-- meta
				{ key = "c", action = "system_open" }, -- command open
				{ key = "q", action = "close" },
				{ key = "?", action = "toggle_help" },
				{ key = "<BS>", action = "collapse_all" },
			},
		},
	},
})
