# RPi-setup

WIP repo to automate the process of going from a blank SD card to a bootable, discoverable, and headless Raspberry Pi.

## Roadmap

- [x] Creating an SD card with the latest Raspbian image via OSX
- [x] WiFi configured in image
- [x] SSH enabled
- [ ] Use `wpa_passphrase` to obfuscate the PSK in `wpa_supplicant.conf`
- [ ] Pipeline for allowing customization of things beyond what Raspbian exposes (hostname, /etc/network/interfaces, etc)

## How to Use

1. Fill in `wpa_supplicant.conf` with details relevant to your network.
2. Insert an SD card
3. Run `diskutil list` to find the SD card disk entry.  Should be something like `/dev/disk2`
4. Run `./create-sdcard.sh <disk-name>`.  If the disk above was `/dev/disk2`, the `<disk-name>` is `disk2`
5. Eject the SD card and insert into the Pi
6. Boot the dang thing
7. Default hostname is `raspberrypi`, default user is `pi`, default password is `raspberry`.  You should probably change these at your earliest convenience.