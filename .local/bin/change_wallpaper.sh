# changes wallpaper to one specified in first argument

#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: $0 <path to image>"
    exit 1
fi

cp "$1" ~/.config/wallpaper.png &&
feh --bg-scale "$HOME/.config/wallpaper.png"
