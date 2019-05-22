#!/bin/bash
mpc listall | dmenu -i -nb "#000" -nf "#7af" -sb "#333" -sf "#bdf" | mpc insert && mpc next
