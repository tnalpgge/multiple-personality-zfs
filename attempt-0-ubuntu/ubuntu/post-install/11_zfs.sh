#!/bin/sh

# Set the mount point for the root data set of the pool
zfs set -o mountpoint=/zdata zdata

# Create new datasets within our zpool at desired mount points
zfs create -o mountpoint=/zhome zdata/home
