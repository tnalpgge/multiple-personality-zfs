#!/bin/sh

# Get a reasonable editor, and sudo permissions so we don't have to use su
apt install nvi sudo

# Add ourselves to the sudo group
pw user mod -a -G sudo tony

# Grant passwordless sudo to group sudo
env EDITOR="sed -i '/%sudo/s/ALL$/NOPASSWD: ALL/'" visudo

# Now log all the way out and enjoy easier privilege escalation
