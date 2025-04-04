vim.cmd([[
    autocmd VimResized * wincmd =
]])

vim.cmd([[
if has('wsl')
    augroup Yank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe ', @")
    augroup END
endif
]])
