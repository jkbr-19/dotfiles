#!/bin/sh

iconpath="/usr/share/icons/Numix-Circle/48/apps/cs-network.svg"

if [ "$(nmcli r wifi)" = "disabled" ]; then
	nmcli r wifi on
	notify-send -i $iconpath "Wifi" "Turned on Wifi"
else
	nmcli r wifi off
	notify-send -i $iconpath "Wifi" "Switched off Wifi"
fi
