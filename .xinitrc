urxvtd -q -f -o
xrdb -merge .Xresources
setxkbmap -layout hr
xsetroot -cursor_name left_ptr &
xset -b
urxvtc -e sh -c "when cw && read -n1 -s"
exec xmonad
