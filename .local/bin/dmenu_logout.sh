#!/bin/bash

action="$(printf "Kill Xorg\nSuspend\nPoweroff\nReboot" | dmenu -i -p 'System')"
[ -n "$action" ] || exit 1

confirm="$(printf "Yes\nNo" | dmenu -i -p "Confirm ${action}?")"
[ -n "$confirm" ] || exit 1

[ $confirm = "No" ] && exit 1

case "$action" in
    "Kill Xorg") killall xinit;;
	"Suspend") systemctl suspend;;
    "Poweroff") poweroff;;
    "Reboot") reboot
esac


