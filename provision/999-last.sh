#!/bin/sh

# Clean downloaded APT packages
apt-get -y autoremove
apt-get clean

rm -f /var/lib/apt/lists/*

# Remove installation logs
rm -rf /var/log/installer

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit 0
