#!/bin/sh

status=$(sudo pvpn --status | grep "Server Name" | grep -o --regexp="[^ tab]\+$")
echo "VPN: $status"
