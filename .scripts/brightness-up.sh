#!/bin/env bash
actual_bright=$(cat /sys/class/backlight/intel_backlight/brightness)
echo $((actual_bright + 1000)) > /sys/class/backlight/intel_backlight/brightness
