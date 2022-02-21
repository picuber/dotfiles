fpath=(~/.config/zsh/completions $fpath)

autoload -U +X compinit && compinit # re-set here, because antigen breaks it
compdef _zathura zat
