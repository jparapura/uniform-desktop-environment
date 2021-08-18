#!/bin/bash

# TODO dmenu script that offers: STOP, picking music theme
#url="https://live.musopen.org:8085/streamvbr0"
url="https://coderadio-relay-ffm.freecodecamp.org/radio/8010/radio.mp3"
pkill -f "$url" || mpv "$url"
