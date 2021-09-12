#!/bin/bash

source ./.scripts/utils.sh

# Arch Linux Archinstall official installer
mount -o remount,size=2G /run/archiso/cowspace
pacman -Sy git
git clone https://github.com/afranioce/dotfiles.git
cd dotfiles

# Archinstall
e_header "Running archinstall..."
python -m archinstall --config ${DOTFILES_DIR}/archinstall.json

# Setup script
e_header "Running post-install script..."
bash ${SCRIPTS_DIR}/setup.sh
