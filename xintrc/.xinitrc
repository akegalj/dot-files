xsetroot -cursor_name left_ptr
setxkbmap -layout hr
autocutsel -fork &
autocutsel -selection PRIMARY -fork -buttonup&
xrdb -merge ~/.Xresources
urxvtd -q -f -o
xmonad
