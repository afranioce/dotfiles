#!/bin/bash

source ./.scripts/utils.sh

# Install Zsh:
yay -Sy install zsh

# Set Zsh as your default shell:
chsh -s $(which zsh)

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install some external plugins:
yay -Sy zsh-autosuggestions-git
yay -Sy zsh-completions-git
yay -Sy zsh-syntax-highlighting-git

# Install iconic font for Zsh
# See more: https://nerdfonts.com/
yay -Sy nerd-fonts-ubuntu-mono

# Install Powerlevel10k theme
yay -Sy zsh-theme-powerlevel10k

# Install nvm
yay -Sy nvm

# Finish
e_success "Zsh configuration complete."
