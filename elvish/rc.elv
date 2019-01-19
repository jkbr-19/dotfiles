#"Aliases"
fn v [@a]{ e:nvim $@a }
fn vimrc { e:nvim ~/.vimrc }
fn ls [@a]{ e:ls --color $@a }

#Based on the Quenya word for beginning
fn yesta { e:nvim ~/.elvish/rc.elv }
#...Agh burzum-ishi krimpatul : ...And in darkness BIND them. Hah get it?
fn krimpatul { pprint $edit:insert:binding }

edit:-matcher[''] = [p]{ edit:match-prefix &smart-case $p }
#edit:prompt = { tilde-abbr $pwd; put '>> ' }
use readline-binding
use github.com/jkbr-19/sindarin-term/date-elv
date-elv:date-elv "%n%t%A: %d.%B TA. %Y%n"
