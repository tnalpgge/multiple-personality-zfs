#!/bin/sh

# Allow up to 30 seconds for the user to choose from the GRUB menu
sed -i -e '/GRUB_TIMEOUT=/s/=.*/=30/' /etc/default/grub

# Update GRUB configuration to give a FreeBSD option in the menu
update-grub
