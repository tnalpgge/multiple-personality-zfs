#!/bin/sh
# We assume that the Debian installer has had its way with half of da0
# and that the ZPOOL on da1 was created under Debian

# Let the FreeBSD ZPOOL consume the rest of the disk
gpart add -t freebsd-zfs -l freebsd-zfs da0
