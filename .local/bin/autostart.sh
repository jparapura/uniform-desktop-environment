# basic configuration at startup
# called by .xinitrc

#!/bin/bash

# set correct DPI
[[ -f ~/.config/X11/Xresources ]] && xrdb -merge -I$HOME ~/.config/X11/Xresources

# trayer
# trayer --edge top --align right --SetDockType true --SetPartialStrut true \
#  --expand true --width 10 --transparent true --tint 0x191970 --height 18 &

# hotkey daemon
sxhkd &

# notification server
dunst &

# wallpaper
# set_random_wallpaper.sh &
feh --bg-scale ${XDG_CONFIG_HOME}/wallpaper.png
# wal -i ${XDG_CONFIG_HOME}/wallpaper.png

# turn off touchpad
xinput disable "SynPS/2 Synaptics TouchPad" &

# transparency for terminal
# xcompmgr &
# xcompmgr -c &
# compton &
# picom &
# picom --experimental-backends &

# screenshot utility
flameshot &

# turn on slock after 10 minutes of inactivity
xautolock -time 10 -locker slock &
# xscreensaver -no-splash &

# networm manager tray
# if [ -x /usr/bin/nm-applet ] ; then
#    nm-applet --sm-disable &
# fi

# battery tray
# if [ -x /usr/bin/cbatticon ] ; then
#    sleep 3
#    cbatticon &
# fi

# swap CapsLock and Esc
mod_keyboard.sh

# open windows at home screen
setup_home.sh

# status bar at the top
dwmbar.sh &

# 20-20-20 timer
202020d.sh &

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

sleep 3
startx_alias_run "browser" "${BROWSER}"
startx_alias_run "torrent" "qbittorrent"
startx_alias_run "secondaryScreen" "turn_on_secondary_display"

