# swap esc and caps lock
setxkbmap
xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9 = Caps_Lock'
xmodmap -e 'clear lock'
