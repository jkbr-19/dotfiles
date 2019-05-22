#!/bin/bash

loc="/home/jkbr/.local/share/Terraria/Worlds/Hurz.wld"
clo="/home/jkbr/Dropbox/Dodongo/Hurz.wld"
#loc="/home/jkbr/.Skripten/test1.txt"
#clo="/home/jkbr/.Skripten/test2.txt"

echo $loc | entr -p rsync -t $loc $clo &
echo $clo | entr -p rsync -t $clo $loc
