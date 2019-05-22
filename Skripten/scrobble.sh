#!/bin/bash

killall -q -r "mpdas*"
setsid mpdas -c /home/jkbr/.config/librempd &
setsid mpdas -c /home/jkbr/.config/lastmpd 
