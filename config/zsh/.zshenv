# have the following in ~/.zshenv:
#   export ZDOTDIR=$HOME/.config/zsh
#   [[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
export ZDOTDIR=$HOME/.config/zsh # set here too, just to be sure
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

path_add() {
    case ":$PATH:" in
      *":$1:"*) :;; # already there
      *) PATH="$1:$PATH";;
    esac
}

path_add "$HOME/.cargo/bin" # rust
path_add "/opt/dropbox/bin" # dropbox


	# this makes git ask me for gpg passphrase
export GPG_TTY=$(tty)


export VISUAL=nvim
export EDITOR=nvim


	# fzf
export FZF_DEFAULT_COMMAND="find -L . -printf \"%P\\n\""
export FZF_CTRL_T_COMMAND="find -L . -printf \"%P\\n\""
export FZF_ALT_C_COMMAND="find -L . -printf \"%P\\n\""
export FZF_DEFAULT_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_CTRL_T_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_CTRL_R_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_ALT_C_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export NVM_DIR=$HOME/.nvm
