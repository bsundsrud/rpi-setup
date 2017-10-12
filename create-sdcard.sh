#!/bin/bash

disk="$1"

if [ -z "$disk" ] ; then
    echo "USAGE: $0 <disk-device>"
    exit 1
fi

if [ ! -f raspbian.zip ]; then
    curl -Lo raspbian.zip https://downloads.raspberrypi.org/raspbian_lite_latest
fi
if [ ! -f raspbian.img ]; then
    unzip raspbian.zip
    mv *.img raspbian.img
fi

set -euo pipefail

diskutil unmountDisk "/dev/$disk"
sudo dd bs=1m if=raspbian.img of="/dev/r$disk" conv=sync
diskutil mountDisk "/dev/$disk"

# WPA Supplicant config
cp wpa_supplicant.conf /Volumes/boot/wpa_supplicant.conf

# enable SSH enabled
touch /Volumes/boot/ssh