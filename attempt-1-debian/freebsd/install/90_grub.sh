#!/bin/sh

# We assume that /boot/efi/EFI/debian exists courtesy of the previous Debian install
# We choose to let GRUB be the boot loader of choice, for easier switching between operating systems
cp /boot/efi/EFI/debian/shimx64.efi /boot/efi/EFI/boot/bootx64.sh
cp /boot/efi/EFI/debian/fbx64.efi /boot/efi/EFI/boot/
cp /boot/efi/EFI/debian/mmx64.efi /boot/efi/EFI/boot/
