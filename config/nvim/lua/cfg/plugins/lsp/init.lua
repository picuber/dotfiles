local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.SERVERS = {
    'pylsp',
    'tsserver',
	'sumneko_lua',
	'rust_analyzer',
    'texlab',
	'tsserver',
}
return M
