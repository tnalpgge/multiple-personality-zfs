#!/bin/sh

# Designate mount point for top-most dataset in the ZPOOL
zfs set -o mountpoint=/zdata zdata

# Create datasets within our ZPOOL
zfs create -o mountpoint=/zhome zdata/home
