# connects to my home wifi
# to make process several commands faster

#!/bin/bash

name=""

if [ $# -ne 1 ]; then
    echo "usage: $0 <ssid alias>"
    exit 1
fi

case "$1" in
    "home") name="TELPOL-21888";;
    "gosia") name="ZTE_589D20";;
    "css2") name="EXT_CSS2";;
    "phone") name="iPhone-hotspot";;
    *) name="$1";;
esac

sudo ip link set wlp3s0 down
cd "/etc/netctl"
sudo netctl stop "$name"
sudo netctl start "$name"
cd "$HOME"
refbar.sh
exit 0
