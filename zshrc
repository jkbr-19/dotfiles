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


if [ "$HOST" = "hoestelos" ]; then
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ "$HOST" = "raspberry" ]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source ~/.bash_aliases
