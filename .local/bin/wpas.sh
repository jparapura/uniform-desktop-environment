# connects to wifi using wpa_supplicant
# to make process several commands faster

#!/bin/bash

name=""
interface="wlp3s0"

restore_for_networkmanager() {
	doas killall wpa_supplicant
	doas systemctl start NetworkManager
	doas systemctl stop dhcpcd
	echo "Finished restoring network services for Network Manager"
}

prepare_for_wpa_supplicant() {
	doas systemctl stop NetworkManager
	doas systemctl start dhcpcd
	doas killall wpa_supplicant
}

connect() {
	# $1 - interface name
	# $2 - config file for network

	cd "/etc/wpa_supplicant"
	prepare_for_wpa_supplicant
	doas wpa_supplicant -i "$1" -c "$2"
	cd "$HOME"
}

if [ $# -ne 1 ]; then
    echo "usage: $0 <ssid alias | restore>"
    exit 1
fi

case "$1" in
	"uj") name="uj_wifi.conf" ;;
	"eduroam") name="eduroam.conf" ;;
	"restore")
		restore_for_networkmanager
		exit 0
	;;
    *) 
		echo "Unknown network!"
		exit 1
	;;
esac

connect "$interface" "$name"

refbar.sh
exit 0
