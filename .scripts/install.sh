#!/bin/bash

# Install AUI
mount -o remount,size=2G /run/archiso/cowspace
pacman -Sy git
git clone git://github.com/helmuthdu/aui
cd aui
sh ./fifo
