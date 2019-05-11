#!/usr/bin/zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

fpath=( "$HOME/.zprompts" $fpath )
autoload -Uz promptinit
promptinit
prompt halflife

if (( ${+SSH_CONNECTION} ));  then
	PROMPT=[SSH]-$PROMPT
fi
#keybindings

bindkey -s "^N" "ranger\n"

cdUndoKey() {
  popd
  zle       reset-prompt
  echo
  ls
  zle       reset-prompt
}

cdParentKey() {
  pushd ..
  zle      reset-prompt
  echo
  ls
  zle       reset-prompt
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^P'      cdParentKey
bindkey '^B'      cdUndoKey

function cr_file() {
	[ -f $1 ] && . $1
}

cr_file /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
cr_file /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
cr_file /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
cr_file ~/.bash_aliases

[ -f ~/Documents/date-test.elv ] && elvish ~/Documents/date-test.elv
