#!/bin/bash

action="$(printf "Poweroff\nSuspend\nKill Xorg\nReboot" | dmenu -i -p 'System')"
[ -n "$action" ] || exit 1

confirm="$(printf "Yes\nNo" | dmenu -i -p "Confirm ${action}?")"
[ -n "$confirm" ] || exit 1

[ $confirm = "No" ] && exit 1

case "$action" in
    "Poweroff") poweroff;;
	"Suspend") systemctl suspend;;
    "Kill Xorg") killall xinit;;
    "Reboot") reboot
esac


