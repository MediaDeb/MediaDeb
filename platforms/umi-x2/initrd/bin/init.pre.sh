#!/bin/busybox sh

# UMI X2 (MT6589) platform script
# This script should:
# 0. Show logo (if LCD is supported)
# 1. Switch usb into acm+ethernet+mass_storage mode and enable it
# 2. Set ROOT to point to rootfs partition
# 3. Any other platform-specific stuff

init_usb()
{
    cd /sys/class/android_usb/android0
    echo 0 > enable

    cd /sys/devices/virtual/android_usb/android0/f_acm
    echo 1 > instances

    cd /sys/class/android_usb/android0
    echo "Necromancer" > iManufacturer
    echo "MediaDeb UMI X2" > iProduct
    echo "eldershade" > iSerial
    echo acm,eem,mass_storage > functions

    echo 1 > enable
}

init_usb
fbsplash -s /etc/logo.ppm
export ROOT=/dev/mmcblk0p4
