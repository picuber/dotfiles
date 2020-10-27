xrandr --output eDP1 --primary --mode 1920x1080 --output DP1 --mode 1600x900 --right-of eDP1
xrdb -load .Xresources

setxkbmap gb -variant dvorak -option caps:escape

# for starting dunst via systemctl
systemctl --user import-environment DISPLAY

exec i3
