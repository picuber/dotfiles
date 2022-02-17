local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-P>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-n>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

		-- next > expand > jump > complete > tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "c" }),

		-- prev > jump back > S-tab
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "c" }),
	},
	formatting = {
		fields = { "abbr", "menu" },
		format = function(entry, item)
			item.kind = nil -- kinds[item.kind]
			item.menu = ({
				luasnip = "[Snip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				buffer = "[Buff]",
				path = "[Path]",
				cmdline = "[cmd]",
				digraphs = "[digr]",
			})[entry.source.name]
			return item
		end,
	},
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "digraphs" },
	}),
	experimental = {
		ghost_text = true,
	},
})

-- search has buffer completion
cmp.setup.cmdline("/", { sources = {
	{ name = "buffer" },
} })

cmp.setup.cmdline(":", { sources = {
	{ name = "path" },
	{ name = "cmdline" },
} })
