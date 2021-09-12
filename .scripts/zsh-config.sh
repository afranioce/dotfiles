#!/bin/bash

source ./.scripts/utils.sh

# Install Zsh:
yay -Sy install zsh

# Set Zsh as your default shell:
chsh -s $(which zsh)

# Install oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Install some external plugins:
yay -Sy zsh-autosuggestions \
  zsh-completions \
  zsh-syntax-highlighting

# Install iconic font for Zsh
# See more: https://nerdfonts.com/
yay -Sy nerd-fonts-ubuntu-mono

# Install Powerlevel10k theme
yay -Sy zsh-theme-powerlevel10k

# Finish
e_success "Zsh configuration complete."
