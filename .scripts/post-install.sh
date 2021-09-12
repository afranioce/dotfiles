#!/bin/bash

pacman -Syu git
cd /tmp; git clone git://github.com/afranioce/dotfiles
cd dotfiles

source ./.scripts/utils.sh

bash ${SCRIPTS_DIR}/setup.sh

# Cleanup cached downloads and remove the installation zip and folder
e_header "Removing unnecessary files."

sudo pacman -Scc
sudo pacman -Qdtq | sudo pacman -Rs -
sudo rm -Rv /tmp/
sudo yay -Scc
sudo yay -Qtd

# Finish
e_success "Reboot and enjoy!"
