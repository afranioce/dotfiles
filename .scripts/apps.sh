#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./install/utils.sh

# Gnome apps
yay -Sy eog
yay -Sy evince
yay -Sy file-roller
yay -Sy gedit
yay -Sy gedit-plugins
yay -Sy gnome-backgrounds
yay -Sy gnome-calculator
yay -Sy gnome-calendar
yay -Sy gnome-control-center
yay -Sy gnome-disk-utility
yay -Sy gnome-photos
yay -Sy gnome-screenshot
yay -Sy gnome-shell-extensions
yay -Sy gnome-video-effects
yay -Sy gnome-shell-pomodoro
yay -Sy gnome-shell-extension-dash-to-dock
yay -Sy gvfs
yay -Sy sushi
yay -Sy totem
yay -Sy gnome-tweaks
yay -Sy gnome-usage

# Themes
yay -Sy adapta-gtk-theme
yay -Sy breeze-adapta-cursor-theme-git
yay -Sy paper-icon-theme-git
yay -Sy suru-plus-pack-git
yay -Sy xcursor-breeze
yay -Sy yaru-gnome-shell-theme
yay -Sy yaru-gtk-theme
yay -Sy yaru-icon-theme

# Fonts
yay -Sy ttf-dejavu
yay -Sy ttf-freefont
yay -Sy ttf-jetbrains-mono
yay -Sy ttf-liberation
yay -Sy ttf-ms-fonts
yay -Sy ttf-ubuntu-font-family

# Browser
yay -Sy google-chrome
yay -Sy chrome-gnome-shell
yay -Sy firefox
yay -Sy firefox-extension-gnome-shell-integration
yay -Sy firefox-i18n-pt-br
yay -Sy firefox-developer-edition
yay -Sy firefox-developer-edition-i18n-pt-br

# Cloud
#yay -Sy dropbox
#yay -Sy nautilus-dropbox
yay -Sy megasync

# Developer
yay -Sy code
yay -Sy nvm
yay -Sy neovim
yay -Sy postman-bin
yay -Sy lazygit
yay -Sy lazydocker
yay -Sy kitty
# Set kitty as default term
chsh -s $(which kitty)

# Image
yay -Sy gimp
yay -Sy inkscape

# SSH
yay -Sy openssh
sudo systemctl enable sshd
sudo systemctl start sshd

# Multimedia
yay -Sy spotify
yay -Sy audacity

# Social
yay -Sy slack-desktop
yay -Sy telegram-desktop
yay -Sy zoom
yay -Sy teams

# Office
yay -Sy libreoffice-fresh
yay -Sy libreoffice-fresh-pt-br
yay -Sy thunderbird
# yay -Sy thunderbird-i18n-pt-br

# Record
yay -Sy peek

# Remote
yay -Sy anydesk
yay -Sy remmina
yay -Sy openvpn

# Utility
yay -Sy curl
yay -Sy ntfs-3g
yay -Sy p7zip
yay -Sy unrar
yay -Sy unzip
yay -Sy wget
yay -Sy zip

# Docker
yay -Sy docker
sudo groupadd docker
usermod -aG docker $(whoami)
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Security
yay -Sy gufw
sudo ufw enable
sudo systemctl enable ufw

# Finish
e_success "Finished applications installation."
