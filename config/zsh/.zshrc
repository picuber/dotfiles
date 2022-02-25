# zmodload zsh/zprof  # uncomment for start-up profiling

[ -f "$ZDOTDIR/plugins.zsh" ] && source "$ZDOTDIR/plugins.zsh" # antigen
[ -f "$ZDOTDIR/keybinds.zsh" ] && source "$ZDOTDIR/keybinds.zsh"
[ -f "$ZDOTDIR/options.zsh" ] && source "$ZDOTDIR/options.zsh"
[ -f "$ZDOTDIR/alias.zsh" ] && source "$ZDOTDIR/alias.zsh"
[ -f "$ZDOTDIR/functions.zsh" ] && source "$ZDOTDIR/functions.zsh"
[ -f "$ZDOTDIR/completion.zsh" ] && source "$ZDOTDIR/completion.zsh"



# fzf (Ctrl-R: history, Ctrl-T: paste selected, Alt-C: cd into dir)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv (python)
if type pyenv > /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# lazy load nvm -> reduces start-up time by a factor of 9 to 10
function nvm {
    unset -f nvm
    # # nvm (node/javascript)
    [ -f "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    [ -f "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # includes zsh completion
    nvm "$@"
}

# ghcup (haskell)
[ -f "/home/picuber/.ghcup/env" ] && source "/home/picuber/.ghcup/env" # ghcup-env

# zprof  # uncomment for start-up profiling
