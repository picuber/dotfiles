source ~/.config/zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle man # call man on prev command [CONFLICTS with vi-mode]
#antigen bundle sudo # ESC ESC adds sudo to the command [CONFLICTS with vi-mode]
#antigen bundle command-not-found # [CONFLICTS with Debian (only for Ubuntu and openSUSE)]
antigen bundle git # adds many git aliases and functions
# antigen bundle vi-mode # vim like normal-mode with ESC
# antigen bundle rsync # rsync aliases
# antigen bundle themes # theme switcher
# antigen bundle colored-man-pages # colours man pages
antigen bundle tmux # tmux aliase
# antigen bundle wd # shortcuts for directories
antigen bundle rust # completions for rustc, cargo (rust build tool), rustup (rust toolchain manager)
antigen bundle docker # completions for docker

# antigen bundle zsh-users/zsh-syntax-highlighting # Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-autosuggestions # suggest recent matching commands from history
# antigen bundle zsh-users/zsh-completions # additional completion definitions

# Load the theme.
# antigen theme robbyrussell
# antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship		#TODO needs config

# Tell Antigen that you're done.
antigen apply

# more plugins see here
# https://github.com/unixorn/awesome-zsh-plugins#plugins


ZVM_INIT_MODE=sourcing # initialise zsh-vi-mode instantly


plug sindresorhus/pure # prompt

pluginit mfaerevaag/wd
pluginit jeffreytse/zsh-vi-mode
pluginit ael-code/zsh-colored-man-pages

# TODO make custom git aliases
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# https://github.com/davidde/git/blob/master/git.plugin.zsh

pluginit zsh-users/zsh-syntax-highlighting  # Syntax highlighting bundle.
pluginit zsh-users/zsh-autosuggestions      # suggest recent matching commands from history
pluginit zsh-users/zsh-completions             # additional completion definitions
plug_done
