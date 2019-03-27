#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bash_aliases zshrc vimrc Xmodmap config/polybar/config.ini config/polybar/launch.sh config/polybar/scripts/* config/nvim/init.vim config/herbstluftwm/autostart oh-my-zsh/custom/themes/rkj-conda.zsh-theme"
# list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Making sure all the directories exist"
mkdir -p ~/.config/herbstluftwm
mkdir -p ~/.config/nvim
mkdir -p ~/.config/polybar/scripts
mkdir -p ~/.oh-my-zsh/custom/themes

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
