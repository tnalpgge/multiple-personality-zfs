#!/bin/sh
# We assume that the Ubuntu installer has had its way with half of da0
# and that the ZPOOL on da1 was created under Ubuntu

# Let the FreeBSD ZPOOL consume the rest of the disk
gpart add -t freebsd-zfs -l freebsd-zfs da0
