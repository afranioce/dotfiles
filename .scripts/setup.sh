#!/bin/bash

# Main script

# Loading utils scripts
source ./.scripts/utils.sh

# Install Yay
e_header "Installing Yay..."
bash ${SCRIPTS_DIR}/yay.sh

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

# Create a directory for projects and development
e_header "Creating Developer directory in Home."
mkdir ${HOME}/Projects

# Finish
e_success "Reboot and enjoy!"
