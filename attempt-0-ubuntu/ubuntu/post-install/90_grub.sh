#!/bin/sh

# Insert the FreeBSD install media in the CD-ROM drive and wait for it to mount
mkdir -p /boot/efi/EFI/FreeBSD
cp -p /media/*/*/boot/*.efi /boot/efi/EFI/FreeBSD
eject

# If the EFI partition is fat32 instead of ext4 then FreeBSD can mount it
# and perform this step
