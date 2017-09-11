	# ls aliases
alias ll='ls -lF'
alias lh='ls -hlF'
alias la='ls -hAlF'
alias l='ls -CF'

	# Add an "alert" alias for long running commands.  Use like so:
	#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

	# shortcut paths
alias cdc='cd /mnt/c/Users/Leon/Data '
alias cdd='cd /mnt/c/Users/Leon/Desktop '
alias cdu='cd /mnt/c/Users/Leon/Data/Uni/17WS/ '

	# vim-shell
alias :q=exit

	# clear screen with WIS cls command
alias cls=clear
