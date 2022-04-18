alias ll='ls -lF --time-style=long-iso'
alias lh='ls -hlF --time-style=long-iso'
alias la='ls -hAlF --time-style=long-iso'
alias l='ls -CF'

    # ask before override
alias mv="mv -i"
alias cp="cp -i"

	# vim-like commands
alias :q=exit
alias :Q=exit
alias :e=nvim

alias n="nvm --version > /dev/null"
alias v="nvim"
alias vs="nvim -S Session.vim"

	# git aliases, non-conflicting with git plugin
alias gslog='glog --show-signature'
alias gslol='glol --show-signature'
