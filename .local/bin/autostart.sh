# basic configuration at startup
# called by .xinitrc

#!/bin/bash

# hotkey daemon
sxhkd &

# notification server
dunst &

# wallpaper
set_random_wallpaper.sh &
#feh --bg-scale ${XDG_CONFIG_HOME}/wallpaper.png

# turn off touchpad
xinput disable "SynPS/2 Synaptics TouchPad" &

# transparency for terminal
xcompmgr -c &
fix_st_transparency.sh &

# screenshot utility
flameshot &

# turn on slock after 10 minutes of inactivity
xautolock -time 10 -locker slock &

# swap CapsLock and Esc
mod_keyboard.sh

# open windows at home screen
setup_home.sh

# status bar at the top
dwmbar.sh &


# start programs specified in $ sx

# TODO that is no longer used
wifi_home() { wifi.sh home; }

turn_on_secondary_display() { 
	xrandr --output LVDS-1 --off --output DP-2 --mode 1920x1080;
	wal -R;
}

startx_alias_path=${HOME}/.local/bin/startx-alias

startx_alias_run() {
	declare q
	[ -f ${startx_alias_path}/"$1".cx ] && \
	q=$(<${startx_alias_path}/"$1".cx) && \
	[ $q == 1 ] && "$2" &
}

# TODO that is no longer used
startx_alias_run "web" "wifi_home"

startx_alias_run "browser" "${BROWSER}"
startx_alias_run "torrent" "qbittorrent"
startx_alias_run "secondaryScreen" "turn_on_secondary_display"

