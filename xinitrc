xrandr --output eDP1 --primary --mode 1920x1080 --output DP1-1 --mode 1600x900 --right-of eDP1
xrdb -load .Xresources
exec i3
