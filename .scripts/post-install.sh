#!/bin/bash

#AUI scripts
sh ./lilo

# Set zsh to default shell
chsh -s $(which zsh)
# sh -c "$(curl -fsSL https://raw.github.com/afranioce/dotfiles/master/.scripts/install.sh)"
# sh -c "$(curl -fsSL https://git.io/JvP9a)"

# Install spaceship pront theme for oh my zsh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install custom oh zsh my plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
