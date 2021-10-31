#!/bin/bash

# TODO add duplicate and two displays
# TODO add notification if unrecognized input

# P = primary
# S = secondary
# + = on
# - = off

# TODO change DP-2 to DP-1
primary="LVDS-1"
secondary="DP-2"

action="$(printf "P+S-\nP-S+\nP+S+" | dmenu -i -p 'Monitor config')"
#action="$(printf "P+S-\nP-S+\nP+S+\nDuplicate" | dmenu -i -p 'Monitor config')"
[ -n "$action" ] || exit 1

case "$action" in
    "P+S-") 	 xrandr --output "$primary" --auto --output "$secondary" --off;;
	"P-S+") 	 xrandr --output "$primary" --off  --output "$secondary" --mode 1920x1080;;
    "P+S+") 	 xrandr --output "$primary" --auto --output "$secondary" --mode 1920x1080;;
    #"Duplicate") xrandr --output "$primary" --auto --output "$secondary" --mode 1920x1080 --output "$secondary" --same-as "$primary"
esac


# reset wallpaper
feh --bg-scale ${XDG_CONFIG_HOME}/wallpaper.png
