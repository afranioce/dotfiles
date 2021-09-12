#!/bin/bash

source ./.scripts/utils.sh

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".gitignore_global" ".gitignore_global"
replace ".zshrc"            ".zshrc"
replace ".zshenv"           ".zshenv"
replace ".bashrc"           ".bashrc"
replace ".profile"          ".profile"
replace ".p10k.zsh"         ".p10k.zsh"
replace ".config/nvim/"     ".config/nvim/"
replace ".config/kitty/"    ".config/kitty/"

# Git configs
e_header "Configure your Git settings: "
nvim ${HOME}/.gitconfig

# Finish
e_success "Dotfiles update complete."
