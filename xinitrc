xrandr --output eDP --primary --mode 1920x1080
xrdb -load .Xresources

setxkbmap gb -variant dvorak -option caps:escape

exec i3
