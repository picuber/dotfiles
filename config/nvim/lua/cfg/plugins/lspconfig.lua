local M = {}

function M.on_attach(client, buff)
	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
	end

	local function map(key, cmd)
		local opt = { noremap = true, silent = true }
		vim.api.nvim_buf_set_keymap(buff, "n", "<leader>a" .. key, cmd, opt)
	end
	local function bmap(key, cmd)
		map(key, ":lua vim.lsp.buf." .. cmd .. "()<CR>")
	end
	local function dmap(key, cmd)
		map(key, ":lua vim.diagnostic." .. cmd .. "<CR>")
	end

	local floatcfg =
		[[{focusable=false,source="if_many",close_events={"BufLeave","CursorMoved","InsertEnter","FocusLost"}}]]

	bmap("d", "definition")
	bmap("D", "declaration")
	bmap("I", "implementation")
	bmap("h", "hover")
	bmap("r", "rename")
	bmap("R", "references")
	bmap("s", "signature_help")
	bmap("a", "code_action")
	bmap("f", "formatting")
	dmap("n", "goto_next()")
	dmap("p", "goto_prev()")
	dmap("l", "open_float(" .. floatcfg .. ")")
	dmap("L", "setloclist()")
	map("i", ":LspInfo<CR>")

	-- Format on save if formatting is available
	--[==[
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup LSP_FORMAT
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 5000)
            augroup END
        ]])
	end
    ]==]

	-- highlight keyword under cursor
	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

function M.setup()
	-- configure diagnostics
	vim.diagnostic.config({
		virtual_text = {
			-- source = "if_many",
			source = true,
		},
	})

	-- configure handlers
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = "rounded" }
	)

	local default_config = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
	}

	local lspconfig = require("lspconfig")
	for _, lsp in ipairs(require("cfg.plugins.lsp").SERVERS) do
		local server_config = require("cfg.plugins.lsp." .. lsp) or {}
		local config = vim.tbl_extend("keep", server_config, default_config)
		lspconfig[lsp].setup(config)
	end
end

return M
