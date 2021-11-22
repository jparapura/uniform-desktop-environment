#!/bin/bash

function usage() {
    cat <<USAGE
Usage: $0 [options]

Options:
	w		 open with web
	b		 open with ${BROWSER} browser
	h		 start only with secondary screen
	t		 open with qBittorrent
	scipio	 start with whatever is considered as default start
USAGE
    exit 1
}

cd "$HOME/.local/bin/startx-alias"

web=0
browser=0
torrent=0
secondaryScreen=0

while [ "$1" != "" ]; do
    case $1 in
	w)
		web=1
		;;
    b)
		browser=1
        ;;
	t)
		torrent=1
		;;
	h)
		secondaryScreen=1
		;;
    *)
        usage
        exit 1
        ;;
    esac
    shift
done

printf "$web" > web.cx
printf "$browser" > browser.cx
printf "$torrent" > torrent.cx
printf "$secondaryScreen" > secondaryScreen.cx

cd "$HOME"

exec startx "${XDG_CONFIG_HOME}/X11/xinitrc"
