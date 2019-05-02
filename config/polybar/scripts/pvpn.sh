#!/bin/sh

command -v protonvpn-cli &> /dev/null || echo ""
status=$(sudo protonvpn-cli --status | grep "Server Name" | grep -o --regexp="[^ tab]\+$") && echo "VPN: $status"
