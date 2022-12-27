#!/bin/sh
# We assume the disks are partitioned for both operating systems

# Create our ZPOOL but don't mount it...yet
zpool create -o altroot=/mnt -m none -f zroot /dev/da0p5

# Create a dataset to hold boot environments
zfs create -o mountpoint=none zroot/ROOT

# Create a dataset to hold our initial boot environment and mount it
# It will appear in the filesysxtem relative to the ZPOOL's altroot
zfs create -o mountpoint=/ zroot/ROOT/default

# Allow executables in /tmp but disregard setuid bits
zfs create -o mountpoint=/tmp -o exec=on -o setuid=off zroot/tmp

# Create a dataset for /usr that can't be mounted but can have child datasets
# Files under /usr but not in child datasets will end up in zroot/ROOT/default
# which works well with boot environments
zfs create -o mountpoint=/usr -o canmount=off zroot/usr

# Where most user home directories live
zfs create zroot/usr/home

# /usr/ports doesn't need setuid either
zfs create -o setuid=off zroot/usr/ports

# If you want to rebuild kernel and/or userland from source
zfs create zroot/usr/src

# /var can't be mounted directly but can have child datasets
# Same reasoning as for /usr
zfs create -o mountpoint=/var -o canmount=off zroot/var

# No executables, setuid or otherwise, within these directories
zfs create -o exec=off -o setuid=off zroot/var/audit
zfs create -o exec=off -o setuid=off zroot/var/crash
zfs create -o exec=off -o setuid=off zroot/var/log

# Local mail files consider access times to be important
zfs create -o atime=on zroot/var/mail

# Treat /var/tmp a lot like /tmp with regards to executables
zfs create -o setuid=off zroot/var/tmp

# Catch anything that didn't fit into the previous datasets
zfs set -o mountpoint=/zroot zroot

chmod 1777 /mnt/tmp /mnt/var/tmp

# When booting from this ZPOOL, look to this dataset for critical files
zpool set bootfs=zroot/ROOT/default zroot

# Designate a cache file for ZPOOL export and import
mkdir -p /mnt/boot/zfs
zpool set cachefile=/mnt/boot/zfs/zpool.cache zroot

# Allow easier switching between boot environments when the urge to upgrade strikes
zfs set canmount=noauto zroot/ROOT/default

# Also mount the EFI disk because Debian created it with VFAT (msdosfs)
mkdir -p /mnt/boot/efi
mount -t msdosfs /dev/da0p1 /mnt/boot/efi
