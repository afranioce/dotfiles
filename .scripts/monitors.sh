#!/bin/bash
intern=eDP-1
extern=HDMI-1
virtual=Virtual1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --auto
fi

# Virtual box
if xrandr | grep "$virtual connected"; then
    xrandr --output "$virtual" --mode 1360x768
fi
