#!/bin/sh

# The instructions from
# https://openzfs.github.io/openzfs-docs/Getting%20Started/Debian/index.html
# work very well and are reproduced almost verbatim here without additional comment.

cat >/etc/apt/sources.list.d/bullseye-backports.list <<EOF
deb https://deb.debian.org/debian bullseye-backports main contrib
deb-src https://deb.debian.org/debian bullseye-backports main contrib
EOF

cat >/etc/apt/preferences.d/90_zfs <<EOF
Package: src:zfs-linux
Pin: release n=bullseye-backports
Pin-Priority: 990
EOF

apt update
apt install dpkg-dev linux-headers-generic linux-image-generic
DEBIAN_FRONTEND=noninteractive apt install zfs-dkms zfsutils-linux

# Create a ZPOOL on our designated disk
zpool create zdata /dev/sdb
