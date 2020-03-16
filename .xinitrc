#!/bin/sh

xrdb -merge "$HOME/.Xresources"
exec i3
