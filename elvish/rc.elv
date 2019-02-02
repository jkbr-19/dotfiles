#"Aliases"
fn v [@a]{ e:nvim $@a }
fn vimrc { e:nvim ~/.vimrc }
fn ls [@a]{ e:ls --color $@a }
fn rm [@a]{ e:rm -I $@a }
fn pi-net { e:ssh pi@10.0.0.2 }
fn pvpn [@a]{ e:sudo pvpn $@a }
fn pvpnQ { pvpn -f 
	pvpn --status 
}


#Based on the Quenya word for beginning
fn yesta { e:nvim ~/.elvish/rc.elv }
#...Agh burzum-ishi krimpatul : ...And in darkness BIND them. Hah get it?
fn krimpatul { pprint $edit:insert:binding }

#Functions
fn rock [@a]{
	rockstar-py --output $@a.py $@a.rock
	python3 $@a.py
}
fn wetter [@a]{ e:python3 ~/Documents/Python/wetter.py $@a }
fn dotgit {
	ssh-add ~/.ssh/id_rsa_git
	git commit -m 'updated some files'
	git push origin master
}

edit:completion:matcher[''] = [p]{ edit:match-prefix &smart-case $p }
#edit:prompt = { tilde-abbr $pwd; put '>> ' }

use epm
#Packages and automatic installing
epm:install &silent-if-installed=$true   \
	github.com/jkbr-19/sindarin-term


#Using all these modules
use readline-binding
use github.com/jkbr-19/sindarin-term/date-elv
date-elv:date-elv "%n%t%A: %d.%B TA. %Y%n"
