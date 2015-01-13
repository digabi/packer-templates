#!/bin/sh

export DEBIAN_FRONTEND="noninteractive"
apt-get -y remove build-essential linux-headers-$(uname -r)

# Clean downloaded APT packages
apt-get -y autoremove
apt-get clean

rm -f /var/lib/apt/lists/*

# Remove installation logs
rm -rf /var/log/installer

cat > /etc/apt/sources.list << EOF
deb http://http.debian.net/debian jessie main contrib non-free
deb-src http://http.debian.net/debian jessie main contrib non-free
deb http://http.debian.net/debian jessie-updates main contrib non-free
deb-src http://http.debian.net/debian jessie-updates main contrib non-free
deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
EOF

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit 0
