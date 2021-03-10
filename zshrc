source ~/.zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle man # call man on prev command [CONFLICTS with vi-mode]
#antigen bundle sudo # ESC ESC adds sudo to the command [CONFLICTS with vi-mode]
#antigen bundle command-not-found # [CONFLICTS with Debian (only for Ubuntu and openSUSE)]
#antigen bundle compleat # command-line completions with usage files in ~/.compleat [DOESN'T WORK because ???]
antigen bundle git # adds many git aliases and functions
antigen bundle vi-mode # vim like normal-mode with ESC
antigen bundle rsync # rsync aliases
antigen bundle themes # theme switcher
antigen bundle colored-man-pages # colours man pages
antigen bundle tmux # tmux aliase
antigen bundle wd # shortcuts for directories
antigen bundle rust # completions for rustc
antigen bundle cargo # completions for cargo (rust build tool)
antigen bundle docker # completions for docker

antigen bundle zsh-users/zsh-syntax-highlighting # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions # suggest recent matching commands from history
antigen bundle zsh-users/zsh-completions # additional completion definitions

export NVM_COMPLETION=true
export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm # install and manage nvm (node version manager)
antigen bundle lukechilds/zsh-better-npm-completion	 # better completion for npm (node package manager)

# Load the theme.
antigen theme robbyrussell
# antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship		#TODO needs config

# Tell Antigen that you're done.
antigen apply

#############
#  bindkey  #
#############

bindkey '^[[Z' reverse-menu-complete # Shift-Tab for reverse Tab
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

############
#  setopt  #
############

setopt extendedglob
setopt nonomatch


#############
#  Aliases  #
#############
alias ll='ls -lF --time-style=long-iso'
alias lh='ls -hlF --time-style=long-iso'
alias la='ls -hAlF --time-style=long-iso'
alias l='ls -CF'

	# vim commands
alias :q=exit
alias :Q=exit
alias :e=vim

	# shorter clear command
alias cls=clear

alias chromium-guest='chromium --profile-directory'

	# git aliases, non-conflicting with git plugin
alias gslog='glog --show-signature'
alias gslol='glol --show-signature'

###############
#  Functions  #
###############

#always run zathura in the background
function zat {
	zathura "$@" &!
}

function aurc {
	git clone "https://aur.archlinux.org/${1:?"Please specify an AUR package name"}.git" "$HOME/Downloads/Installer/AUR/$1"
}

##########################
#  enviroment variables  #
##########################

	# adds Rust toolchain binaries
export PATH="$PATH:$HOME/.cargo/bin"
	# add dropbox.py
export PATH="$PATH:/opt/dropbox/bin"
	# add pyenv variables
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
	# this makes git ask me for gpg passphrase
export GPG_TTY=$(tty)
export EDITOR=vim


	# fzf
export FZF_DEFAULT_COMMAND="find -L . -printf \"%P\\n\""
export FZF_CTRL_T_COMMAND="find -L . -printf \"%P\\n\""
export FZF_ALT_C_COMMAND="find -L . -printf \"%P\\n\""
export FZF_DEFAULT_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_CTRL_T_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_CTRL_R_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"
export FZF_ALT_C_OPTS="--multi --exact --reverse --inline-info --border --height 50% --bind tab:down,btab:up,alt-space:toggle+down,ctrl-space:toggle+up,esc:cancel"

################
#  always run  #
################

# set tab width to 4
tabs -4

# setup fzf keybindings (Ctrl-R: history, Ctrl-T: paste selected, Alt-C: cd into dir)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# enable pyenv (shims and autocomlpetion)
if type pyenv > /dev/null; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

