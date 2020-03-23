#!/bin/sh

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto

xrdb -merge "$HOME/.Xresources"
exec i3
