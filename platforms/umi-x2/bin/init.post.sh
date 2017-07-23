#!/bin/busybox sh

# Disable LCD backlight before booting into debian
# I do not think we'll need it
echo 1 > /sys/class/leds/lcd-backlight/brightness
echo 0 > /sys/class/leds/lcd-backlight/brightness
