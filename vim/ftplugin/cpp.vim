setlocal foldmethod=indent
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

let b:ale_linters = [ 'g++', 'clangd' ]
let b:ale_fixers = [ 'clang-format', 'clangtidy' ]

let b:ale_cpp_cc_options = "-std=c++17 -Wall -Wextra -Wconversion -pedantic -Wfatal-errors"
let b:ale_cpp_clangd_options = "-std=c++17 -Wall -Wextra -Wconversion -pedantic -Wfatal-errors"
