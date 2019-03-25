#!/bin/bash

alias rm='rm -I'
alias neofetch='clear && neofetch'
alias vimrc='nvim ~/.vimrc'
alias bashal='nvim ~/.bash_aliases'
alias cjupyter='conda activate cling && jupyter-notebook ~/Documents/Cpp/notebook'


transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

#Pfade
alias path_py='cd ~/Documents/Python/'
alias path_tex='cd ~/Documents/LaTeX'
alias pdf_lab='cd ~/Documents/Uni/Labor_Ex2/KFU'
alias tex_lab='cd ~/Dropbox/LaTeX_Labor'

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

alias tb="nc termbin.com 9999"

#Aliases
alias zshrc='nvim ~/.zshrc'
alias v='nvim'
alias pvpn='sudo pvpn'
alias pi-net='ssh pi@10.0.0.2'
alias TFN='scp pi@10.0.0.2:/home/pi/TFN.txt /tmp/ && nvim /tmp/TFN.txt'
alias conda_init='.  ~/miniconda3/etc/profile.d/conda.sh && conda activate base'
alias time_backup='sudo timeshift --check'
alias jupyter-nb='jupyter-notebook --ip=127.0.0.1 ~/Documents/notebook'
alias neofetch='clear && neofetch'
alias pvpnQ='sudo pvpn -c AT#2'
alias bus='setsid zathura ~/Phone-SD/Documents/700_D_18_3.pdf'
alias apts='calcurse -a'
alias todo='calcurse -t'
alias red='setsid redshift -l 47.06:15.45'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

#functions
function dotgit() {
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_git
	git commit -m 'updated some files'
	git push origin master
}

