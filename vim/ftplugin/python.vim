setlocal foldmethod=indent

let b:ale_linters = [ 'flake8', 'mypy', 'pycodestyle', 'pyls' ]
let b:ale_fixers = [ 'autopep8', 'autoimport', 'isort' ]
