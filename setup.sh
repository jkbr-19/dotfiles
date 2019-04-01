#!/bin/sh

echo "Making sure all the directories exist"
mkdir -p ~/.config/herbstluftwm
mkdir -p ~/.config/nvim
mkdir -p ~/.config/polybar/scripts
mkdir -p ~/.oh-my-zsh/custom/themes
mkdir -p ~/.Clone

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#sudo apt install neovim ranger gotop git neofetch redshift
#sudo apt install herbstluftwm nitrogen rofi

#setup for neovim with jedi support
sudo -H python3 -m pip install neovim jedi

cd ~/.Clone
git clone https://github.com/LukeSmithxyz/st.git
git clone https://github.com/stark/siji.git
#git clone https://github.com/jaagr/polybar.git
cd st
sudo make install
echo "Maybe change TERMINAL in /etc/environment to this $(which st)"

chsh -s $(which zsh)
