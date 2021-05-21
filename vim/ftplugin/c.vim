let b:ale_linters = [ 'gcc', 'clangd' ]
let b:ale_fixers = [ 'clang-format', 'clangtidy' ]

let b:ale_c_cc_options = "-std=c17 -Wall -Wextra -Wconversion -pedantic -Wfatal-errors"
let b:ale_c_clangd_options = "-std=c17 -Wall -Wextra -Wconversion -pedantic -Wfatal-errors"
