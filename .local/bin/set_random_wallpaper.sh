#!/bin/bash

WLPDIR="$HOME/office/pics/wallpapers/"

files=($WLPDIR*)
wlpfile=${files[RANDOM % ${#files[@]}]}
wal -i "$wlpfile"
