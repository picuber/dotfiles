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

bindkey '^[[Z' reverse-menu-complete # Shift-Tab for reverse Tab

#############
#  Aliases  #
#############
alias ll='ls -lF'
alias lh='ls -hlF'
alias la='ls -hAlF'
alias l='ls -CF'

	# vim exit
alias :q=exit
alias :Q=exit

	# shorter clear command
alias cls=clear

###############
#  Functions  #
###############

#always run zathura in the background
function zat() {
	zathura "$@" &
}

##########################
#  enviroment variables  #
##########################
export PATH=/home/leofox/anaconda3/bin:$PATH
