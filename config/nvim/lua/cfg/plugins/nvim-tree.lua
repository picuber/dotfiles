local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

local function on_attach(bufnr)
	local function map(key, cmd, desc)
		vim.keymap.set("n", key, cmd, {
			desc = "nvim-tree: " .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		})
	end
	local function close()
		local node = api.tree.get_node_under_cursor()
		vim.cmd("bd " .. node.absolute_path)
	end

	-- open
	map("<CR>", api.node.open.edit, "Open")
	map("l", api.node.open.edit, "Open")
	map("o", api.node.open.no_window_picker, "Open: No Window Picker")
	map("s", api.node.open.vertical, "Open: Vertical Split")
	map("x", api.node.open.horizontal, "Open: Horizontal Split")
	map("t", api.node.open.tab, "Open: New Tab")
	map("<Tab>", api.node.open.preview, "Open Preview")
	map("D", close, "Close Buffer")

	-- movement
	map("K", api.node.navigate.sibling.prev, "Previous Sibling")
	map("J", api.node.navigate.sibling.next, "Next Sibling")
	map("<", api.node.navigate.sibling.first, "First Sibling")
	map(">", api.node.navigate.sibling.last, "Last Sibling")
	map("p", api.node.navigate.parent, "Parent Directory")
	map("h", api.node.navigate.parent_close, "Close Directory")

	-- cwd
	map("L", api.tree.change_root_to_node, "cd")
	map("H", api.tree.change_root_to_parent, "cd ..")

	-- tree
	map("f/", api.live_filter.start, "Filter: search")
	map("<BS>", api.live_filter.clear, "Filter: clear search")
	map("fi", api.tree.toggle_gitignore_filter, "Filter: .gitgnore")
	map("fc", api.tree.toggle_git_clean_filter, "Filter: git changed")
	map("fo", api.tree.toggle_no_buffer_filter, "Filter: opened/buffers")
	map("f.", api.tree.toggle_hidden_filter, "Filter: dotfiles")

	map("[", api.tree.collapse_all, "Collapse")
	map("]", api.tree.expand_all, "Expand")

	map("?", api.tree.toggle_help, "Help")
	map("R", api.tree.reload, "Refresh")
	map("q", api.tree.close, "Close")

    -- marks
    map("M", api.marks.toggle, "Mark: toggle")
    map("mn", api.marks.navigate.next, "Mark: next")
    map("mp", api.marks.navigate.prev, "Mark: prev")
    map("ms", api.marks.navigate.select, "Mark: select")
    map("md", api.marks.clear, "Mark: select")
    map("mb", api.marks.bulk.move, "Mark: bulk move")

	-- file system
	map("a", api.fs.create, "Create")
	map("r", api.fs.rename, "Rename")
	map("cc", api.fs.cut, "Cut")
	map("cp", api.fs.paste, "Paste")
	map("cs", api.fs.print_clipboard, "Show Clipboard")
	map("cx", api.fs.clear_clipboard, "Clear Clipboard")

	map("y", api.fs.copy.filename, "Copy Name")
	map("Y", api.fs.copy.relative_path, "Copy Relative Path")
	map("gy", api.fs.copy.absolute_path, "Copy Absolute Path")

	-- run
	map("!", api.node.run.system, "Run System")
end

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
	renderer = {
		add_trailing = true,
		group_empty = true,
		full_name = true,
	},
	on_attach = on_attach,
})
