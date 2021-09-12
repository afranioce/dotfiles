#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./.scripts/utils.sh

# Gnome apps
yay -Syu eog \
  evince \
  file-roller \
  gedit \
  gedit-plugins \
  gnome-backgrounds \
  gnome-calculator \
  gnome-calendar \
  gnome-control-center \
  gnome-disk-utility \
  gnome-photos \
  gnome-screenshot \
  gnome-shell-extensions \
  gnome-video-effects \
  gnome-shell-pomodoro \
  gnome-shell-extension-dash-to-dock \
  gvfs \
  sushi \
  totem \
  gnome-tweaks \
  gnome-usage

# Themes
yay -Syu adapta-gtk-theme \
  breeze-adapta-cursor-theme-git \
  paper-icon-theme-git \
  suru-plus-pack-git \
  xcursor-breeze\
  yaru-gnome-shell-theme\
  yaru-gtk-theme \
  yaru-icon-theme

# Fonts
yay -Syu ttf-dejavu \
  ttf-freefont \
  ttf-jetbrains-mono \
  ttf-liberation \
  ttf-ms-fonts \
  ttf-ubuntu-font-family

# Browser
yay -Syu google-chrome \
  chrome-gnome-shell \
  firefox \
  firefox-extension-gnome-shell-integration \
  firefox-i18n-pt-br \
  firefox-developer-edition \
  firefox-developer-edition-i18n-pt-br

# Cloud
#yay -Sy dropbox
#yay -Sy nautilus-dropbox
yay -Syu megasync

# Developer
yay -Syu code \
  nvm \
  neovim \
  postman-bin \
  lazygit \
  lazydocker \
  kitty
# Set kitty as default term
chsh -s $(which kitty)

# Image
yay -Syu gimp \
  inkscape

# SSH
yay -Syu openssh
sudo systemctl enable sshd
sudo systemctl start sshd

# Multimedia
yay -Syu spotify \
  audacity

# Social
yay -Syu slack-desktop \
  telegram-desktop \
  zoom \
  teams

# Office
yay -Syu libreoffice-fresh \
  libreoffice-fresh-pt-br \
  thunderbird \
  thunderbird-i18n-pt-br

# Record
yay -Syu peek

# Remote
yay -Syu anydesk \
  remmina \
  openvpn

# Utility
yay -Syu curl \
  ntfs-3g \
  p7zip \
  unrar \
  unzip \
  wget \
  zip

# Docker
yay -Syu docker
sudo groupadd docker
usermod -aG docker $(whoami)
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Security
yay -Syu gufw
sudo ufw enable
sudo systemctl enable ufw

# Finish
e_success "Finished applications installation."
