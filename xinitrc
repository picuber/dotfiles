xrandr --output eDP --primary --mode 1920x1080
xrdb -load .Xresources

$HOME/scripts/keyboard dvorak

# for starting dunst via systemctl
systemctl --user import-environment DISPLAY

exec i3
