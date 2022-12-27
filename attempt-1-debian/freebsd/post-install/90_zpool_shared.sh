#!/bin/sh

# Enable import of ZPOOLs shared with Linux
sysrc zpool_shared_enable=YES 

# Scan these devices for ZPOOLs shared with Linux; space-separated list
sysrc zpool_shared_devices="/dev/da1p1"

# Names of ZPOOLs expected; space-separated list
sysrc zpool_shared_pools="zdata"
