uv generate-shell-completion zsh > ~/.config/zsh/completions/_uv
uvx --generate-shell-completion zsh > ~/.config/zsh/completions/_uvx

fpath=(~/.config/zsh/completions $fpath)

autoload -U +X compinit && compinit # re-set here, because antigen breaks it
compdef _zathura zat
