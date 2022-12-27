#!/bin/sh

# Mount ZFS datasets found in shared ZPOOLs automatically
sysrc zfs_shared_enable=YES

# Dataset prefixes to be considered for automatic mounting; space-separated list
sysrc zfs_shared_datasets="zdata"
