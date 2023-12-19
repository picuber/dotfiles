# zmodload zsh/zprof  # uncomment for start-up profiling

function load {
    [ -f "$ZDOTDIR/${1:?"Please specify a file to load"}.zsh" ] && source "$ZDOTDIR/$1.zsh"
}

load "plug"
load "plugins" # antigen
load "keybinds"
load "options"
load "alias"
load "functions"
load "completion"
load "prompt"
load "_local"

unset -f load


# fzf (Ctrl-R: history, Ctrl-T: paste selected, Alt-C: cd into dir)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv (python)
if type pyenv > /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# lazy load nvm -> reduces start-up time by a factor of 9 to 10
function nvm npm tsc nvim gc gcam {
    unset -f nvm npm tsc nvim gc gcam
    # # nvm (node/javascript)
    [ -f "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    [ -f "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # includes zsh completion
    "$0" "$@"
}

# ghcup (haskell)
[ -f "/home/picuber/.ghcup/env" ] && source "/home/picuber/.ghcup/env" # ghcup-env

# zprof  # uncomment for start-up profiling
