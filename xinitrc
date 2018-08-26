xrandr --output eDP-1 --primary --mode 1920x1080 --output DP-1-1 --mode 1600x900 --right-of eDP1
xrdb -load .Xresources

setxkbmap gb -variant dvorak -option caps:escape

exec i3
