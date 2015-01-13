#!/bin/sh

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

echo "I: Remove DHCP leases..."
rm /var/lib/dhcp/*

echo "I: Clean persistent network devices..."
echo "# cleaned by packer provisioning scripts" >/etc/udev/rules.d/70-persistent-net.rules

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit 0
