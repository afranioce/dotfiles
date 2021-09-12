#!/bin/bash
#
# Update Wallpaper with random image

RESOLUTION="2560x1440"
URL="https://source.unsplash.com/featured/${RESOLUTION}/?cyberpunk"
WALLPAPER=/home/$(whoami)/.wallpaper.jpeg

RES=$(curl -L "$URL" -o "$WALLPAPER")
if [ -z "$RES" ]; then
    gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
    gsettings set org.gnome.desktop.screensaver picture-uri "file://$WALLPAPER"
fi
