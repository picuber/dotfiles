local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.SERVERS = {
    'pylsp', -- python
    'tsserver', -- typescript/javascript
	'lua_ls', -- lua
	'rust_analyzer', -- rust
    'texlab', -- latex
    'cmake', -- cmake
    'hls', -- haskell
    'clangd', -- C/C++
    'jdtls', -- Java
    'tailwindcss', -- TailwindCSS
}
return M
