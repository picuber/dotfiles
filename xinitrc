xrandr --output eDP --primary --mode 1920x1080
xrdb -load .Xresources

$HOME/scripts/keyboard dvorak_compose

# for starting dunst via systemctl
systemctl --user import-environment DISPLAY

# IME
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'
fcitx5 -d &

exec i3
