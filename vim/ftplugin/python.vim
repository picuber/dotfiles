setlocal foldmethod=indent
setlocal omnifunc=python3complete#Complete

let b:ale_linters = [ 'flake8', 'mypy', 'pycodestyle', 'pylsp' ]
let b:ale_fixers = [ 'autopep8', 'autoimport', 'isort' ]
let b:ale_completion_enable = 1


