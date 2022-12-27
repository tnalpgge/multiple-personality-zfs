#!/bin/sh

# Enable our custom systemd units after files are copied 
systemctl enable z{fs,pool}-shared.{service,target}
