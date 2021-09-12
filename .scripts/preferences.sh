#!/bin/bash
#
# Set personal settings
# See schemas in /usr/share/glib-2.0/schemas
# See https://github.com/GNOME/gsettings-desktop-schemas
# See https://blog.gtk.org/2017/05/01/first-steps-with-gsettings/

# GTK theme
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# Icon theme
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'

# Shell theme
gsettings set org.gnome.shell.extensions.user-theme 'Yaru'

# Shell theme
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru'

# Default calendar
gsettings set org.gnome.desktop.default-applications.office.calendar exec gnome-calendar

# Mouse
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# Touchpad
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method 'fingers'
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click  true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

# Dash to Dock
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DOTS'
