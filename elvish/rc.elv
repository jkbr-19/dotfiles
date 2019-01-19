#"Aliases
fn v [@a]{ e:nvim $@a }
fn vimrc { e:nvim /home/jkbr/.vimrc }
fn aur { e:nvim /home/jkbr/.elvish/rc.elv }
fn ls [@a]{ e:ls --color $@a }
fn krimpatul { pprint $edit:insert:binding }

edit:-matcher[''] = [p]{ edit:match-prefix &smart-case $p }
#edit:prompt = { tilde-abbr $pwd; put '>> ' }
use readline-binding

e:bash /home/jkbr/sindarin-term/Sindarin_date
