#!/bin/sh

# Create a new ZPOOL on the second disk to be shared with other operating
# systems on this computer
zpool create zdata /dev/sdb1
