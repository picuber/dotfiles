	# add pyenv to path
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if type pyenv > /dev/null; then
	eval "$(pyenv init --path)"
fi
