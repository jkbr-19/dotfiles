#!/bin/sh

command -v pvpn &> /dev/null || echo ""
status=$(sudo pvpn --status | grep "Server Name" | grep -o --regexp="[^ tab]\+$") && echo "VPN: $status"
