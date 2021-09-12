#!/bin/bash

pacman -Sy git
git clone git://github.com/afranioce/dotfiles
cd dotfiles

source ./.scripts/utils.sh

bash ./install/setup.sh

# Cleanup cached downloads and remove the installation zip and folder
e_header "Removing unnecessary files."

sudo pacman -Scc
sudo pacman -Qdtq | sudo pacman -Rs -
sudo rm -Rv /tmp/
sudo yay -Scc
sudo yay -Qtd
sudo rm -Rv /tmp/
rm -rf ${DOTFILES_DIRECTORY}

# Finish
e_success "Reboot and enjoy!"
