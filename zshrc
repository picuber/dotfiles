source /usr/share/zsh-antigen/antigen.zsh

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

antigen bundle zsh-users/zsh-syntax-highlighting # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-autosuggestions # suggest recent matching commands from history
antigen bundle zsh-users/zsh-completions # additional completion definitions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

#############
#  bindkey  #
#############

bindkey '^[[Z' reverse-menu-complete # Shift-Tab for reverse Tab
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

#############
#  Aliases  #
#############
alias ll='ls -lF --time-style=long-iso'
alias lh='ls -hlF --time-style=long-iso'
alias la='ls -hAlF --time-style=long-iso'
alias l='ls -CF'

	# vim exit
alias :q=exit
alias :Q=exit

	# shorter clear command
alias cls=clear

alias chromium-guest='chromium --profile-directory'

###############
#  Functions  #
###############

#always run zathura in the background
function zat() {
	zathura "$@" &!
}

##########################
#  enviroment variables  #
##########################

	# adds anaconda3 in front of system binaries to override python defaults
	# had to ln -s /usr/share/terminfo/r/rxvt-unicode-256color /home/<user>/anaconda3/share/terminfo/r/rxvt-unicode-256color
	#	as a workaround, since now terminfo files were all taken from ther, but rxvt-unicode-256color was not present
export -U PATH=$HOME/anaconda3/bin:$PATH
	# this makes git ask me for gpg passphrase
export GPG_TTY=$(tty)


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
