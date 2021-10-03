# connects to my home wifi
# to make process several commands faster

#!/bin/bash

name=""
helper="netctl"
interface="wlp3s0"

if [ $# -ne 1 ]; then
    echo "usage: $0 <ssid alias>"
    exit 1
fi

case "$1" in
    "home") name="TELPOL-21888";;
    "gosia") name="ZTE_589D20";;
    "css2") name="EXT_CSS2";;
    "phone") name="iPhone-hotspot";;
	"uj")
		helper="wpa_supplicant"
		name="uj_wifi.conf"
	;;
    *) name="$1";;
esac

case "$helper" in
	"netctl")
		sudo ip link set "$interface" down
		cd "/etc/netctl"
		sudo netctl stop "$name"
		sudo netctl start "$name"
		# TODO consider changing to cd -
		cd "$HOME"
	;;
	"wpa_supplicant")
		cd "/etc/wpa_supplicant"
		doas killall wpa_supplicant
		doas wpa_supplicant -i "$interface" -c "$name"
		cd -
	;;
	*)
		echo "Unknown helper!"
		exit 1
	;;
esac

refbar.sh
exit 0
