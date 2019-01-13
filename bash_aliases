#!/bin/bash

#vim zeugs
set -o vi
bind -m vi-insert "\C-l":clear-screen
export VISUAL=vim
alias v='nvim'

shopt -s expand_aliases
alias rm='rm -I'
alias vimbot='nvim ~/Dropbox/TFN/bot.py'
alias vimrc='nvim ~/.vimrc'
alias bashal='nvim ~/.bash_aliases'
alias pi-net='ssh pi@10.0.0.2'

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

#Pfade
alias path_py='cd ~/Documents/Python/'
alias path_tex='cd ~/Documents/LaTeX'
alias pdf_lab='cd ~/Documents/Uni/Labor_Ex2/KFU'
alias tex_lab='cd ~/Dropbox/LaTeX_Labor'

#ProtonVPN
alias pvpn='sudo pvpn'
alias pvpnQ='sudo pvpn -f && sudo pvpn --status'

#rockstar transpiler
function rock() {
	rockstar-py --output $1.py $1.rock
	python3 $1.py
}

#Funktionen
function wetter() {
	if [ $2 ]
	then
		curl wttr.in/$1		
	else
		python3 ~/Documents/Python/wetter.py $1
	fi
}

function comp_tex() {
	pdflatex -synctex=1 -interaction=nonstopmode --output-directory=build $1.tex
	qpdfview build/$1.pdf --unique &
}

function musik() {
	rhythmbox-client --print-playing-format="	%tn. %tt - %ta"
	rhythmbox-client --print-playing-format="	%at [%ay]"
	rhythmbox-client --print-playing-format="	(%te/%td)"
}

#Sindarin Dates
weekday=$(date +"%a")
month=$(date +"%m")
case $weekday in 
	Fri) day_sin="Ordillion";;
	Sat) day_sin="Oranor";;
	Sun) day_sin="Orithil";;
	Mon) day_sin="Orgaladh";;
	Tue) day_sin="Ormenel";;
	Wed) day_sin="Orbelain";;
	Thu) day_sin="Oraeron";;
	*)
esac
case $month in
	01) month_sin="Narwain";;
	02) month_sin="Nínui";;
	03) month_sin="Gwaeron";;
	04) month_sin="Gwirith";;
	05) month_sin="Lothron";;
	06) month_sin="Nórui";;
	07) month_sin="Cerweth";;
	08) month_sin="Urui";;
	09) month_sin="Ivanneth";;
	10) month_sin="Narbeleth";;
	11) month_sin="Hithui";;
	12) month_sin="Girithron";;
	*)
esac

date +"%n %t $day_sin: %d.$month_sin TA. %Y%n"