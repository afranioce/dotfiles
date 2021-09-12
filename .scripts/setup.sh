#!/bin/bash

# Main script

# Loading utils scripts
source ./.scripts/utils.sh

# Install Yay

if ! which yay &>/dev/null; then
  echo "não existe"
else
  echo "existe"
fi

# Install applications
seek_confirmation "Warning: This step install applications."
if is_confirmed; then
  e_header "Please, configure you applications before installation:"
  nvim ${SCRIPTS_DIR}/apps.sh
  bash ${SCRIPTS_DIR}/apps.sh
else
  e_warning "Skipped applications install."
fi

# Install Gnome preferences
seek_confirmation "Warning: This step install Gnome preferences."
if is_confirmed; then
  bash ${SCRIPTS_DIR}/preferences.sh
else
  e_warning "Skipped preferences update."
fi

# Install zsh configuration
seek_confirmation "Warning: This step install zsh configuration."
if is_confirmed; then
  bash ${SCRIPTS_DIR}/zsh-config.sh
else
  e_warning "Skipped zsh update."
fi

# Set dotfiles
seek_confirmation "Warning: This step update dotfiles."
if is_confirmed; then
  bash ${SCRIPTS_DIR}/dotfiles.sh
else
  e_warning "Skipped dotfiles update."
fi

# Set wallpapers
seek_confirmation "Warning: This step update wallpaper."
if is_confirmed; then
  bash ${SCRIPTS_DIR}/wallpapers.sh
else
  e_warning "Skipped wapppaper update."
fi

# Create a directory for projects and development if not exists
if [ ! -d "${HOME}/Projects" ]; then
  e_header "Creating Developer directory in Home."
  mkdir ${HOME}/Projects
  mkdir ${HOME}/Projects/Contribs

  # Add Project bookmark
  echo "file:///home/$(whoami)/Projects" >> ~/.config/gtk-3.0/bookmarks
fi
