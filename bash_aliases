#!/bin/bash

alias rm='rm -I'
alias ls='ls --color'
alias v='nvim'
#alias vim='vim --servername vim'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias neofetch='clear && neofetch'
alias rsync='rsync --progress'

alias vrc='nvim ~/.vimrc'
alias zshrc='nvim ~/.zshrc'
alias bashal='nvim ~/.bash_aliases'
alias zsrc='source ~/.zshrc'
alias bright='sudo nvim /sys/class/backlight/*/brightness'
alias herbst='nvim ~/.config/herbstluftwm/autostart'


transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

#Pfade
alias py='cd ~/Documents/Python/'
alias path_tex='cd ~/Documents/LaTeX'
alias pdf_lab='cd ~/Documents/Uni/Labor_Ex2/KFU'
alias tl='cd ~/Dropbox/LaTeX_Labor'


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
alias pi-net='ssh pi@10.0.0.2'
alias time_backup='sudo timeshift --check'
alias red='setsid redshift -l 47.06:15.45'
alias elv-date='clear && elvish ~/Documents/date-test.elv'

alias pvpn='sudo protonvpn-cli'
alias pvpnQ='sudo protonvpn-cli -c AT#5'

alias conda_init='.  ~/miniconda3/etc/profile.d/conda.sh && conda activate base'
alias jpy='jupyter-notebook ~/Documents/notebook'
alias jpy-uni='jupyter-notebook ~/Documents/Uni'
alias jpy-prot='jupyter-notebook ~/Dropbox/LaTeX_Labor'

alias bus='setsid zathura ~/Phone-SD/Documents/700_D_18_3.pdf'
alias apts='calcurse -a'
alias todo='calcurse -t'
alias pippin='pip3 install'

#functions
function dotgit() {
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa_git
	git add *
	git commit -m 'updated some files'
	git push origin master
}

hc() {
    herbstclient "$@"
}
eval $(thefuck --alias)
