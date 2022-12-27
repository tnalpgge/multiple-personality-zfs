#!/bin/sh

# Enable our custom sytemd units after files are copied
systemctl enable zpool-shared.service
systemctl enable zpool-shared.target
systemctl enable zfs-shared.service
systemctl enable zfs-shared.target
