setlocal foldmethod=indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

let b:ale_linters = [ 'eslint', 'tsserver' ]
let b:ale_fixers = [ 'eslint', 'prettier' ]
