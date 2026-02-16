# have the following in ~/.zshenv:
#   export ZDOTDIR=$HOME/.config/zsh
#   [[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
export ZDOTDIR=$HOME/.config/zsh # set here too, just to be sure
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# XDG directories, also set in ~/.profile and .zprofile
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# program directories
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export NVM_DIR="$XDG_DATA_HOME"/nvm
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export GOPATH="$XDG_DATA_HOME"/go
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
export UV_TOOL_BIN_DIR="$XDG_BIN_HOME"/uv-tools

path_add() {
    case ":$PATH:" in
      *":$1:"*) :;; # already there
      *) PATH="$1:$PATH";;
    esac
}

path_add "$XDG_BIN_HOME" # local binaries
path_add "$CARGO_HOME/bin" # rust
path_add "/opt/dropbox/bin" # dropbox
path_add "$UV_TOOL_BIN_DIR" # uv
path_add "$PYENV_ROOT/bin" # pyenv


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

export TMUX_FZF_LAUNCH_KEY="C-f"

    # history
export HISTFILE=$ZDOTDIR/history
export HISTSIZE=500000
export SAVEHIST=500000
