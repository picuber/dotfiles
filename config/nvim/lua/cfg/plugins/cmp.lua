local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        -- expand snippets
        [vim.g.mapleader .. "e"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.confirm({ select = false })
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        [vim.g.mapleader .. "u"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- scroll docs up
        ["<C-u>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.mapping.scroll_docs(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- scroll docs down
        ["<C-d>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.mapping.scroll_docs(1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- next choice node
        ["<C-n>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- prev choice node
        ["<C-p>"] = cmp.mapping(function(fallback)
            if luasnip.choice_active() then
                luasnip.change_choice(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- next > expand > jump > complete > tab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "c", "s" }),

        -- prev > jump back > S-tab
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "c", "s" }),
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
        { name = "buffer",  option = { keyword_pattern = [[\k\+]] } },
        { name = "path" },
        { name = "digraphs" },
    }),
    experimental = {
        ghost_text = true,
    },
})

-- search has buffer completion
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    }
})

cmp.setup.cmdline(":", {
    sources = {
        { name = "path" },
        { name = "cmdline" },
    }
})
