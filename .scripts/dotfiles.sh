#!/bin/bash

source ./.scripts/utils.sh

# Move/replace setting files to /Home
replace ".gitconfig"        ".gitconfig"
replace ".gitignore_global" ".gitignore_global"
replace ".zshrc"            ".zshrc"
replace ".p10k.zsh"         ".p10k.zsh"
replace ".config/"          ".config/"

# Git configs
e_header "Configure your Git settings: "
nvim ${HOME}/.gitconfig

# Finish
e_success "Dotfiles update complete."
