#!/bin/sh

# Clean downloaded APT packages
apt-get -y autoremove
apt-get clean

rm -f /var/lib/apt/lists/*

# Remove installation logs
rm -rf /var/log/installer

cat > /etc/apt/sources.list << EOF
deb http://192.168.3.32/debian buster main contrib non-free
deb http://192.168.3.32/debian buster-updates main contrib non-free
EOF

echo "I: DHCP hack to keep vmware/vagrant up to date"
cat > /usr/local/bin/force-dhcp-refresh.sh <<EOF
#!/bin/bash

while true
do
        pkill dhclient
        dhclient ens32
        dhclient ens33
        sleep 5
done
EOF
chmod +x /usr/local/bin/force-dhcp-refresh.sh

cat > /etc/systemd/system/digabi-dhcp-refresh.service<<EOF
[Unit]
Description=dhcp refresh
Requires=
After=

[Service]
Type=simple
ExecStart=/usr/local/bin/force-dhcp-refresh.sh
EOF

ln -s /etc/systemd/system/digabi-dhcp-refresh.service /etc/systemd/system/multi-user.target.wants/

echo "I: Remove DHCP leases..."
rm /var/lib/dhcp/*

echo "I: Clean persistent network devices..."
echo "# cleaned by packer provisioning scripts" >/etc/udev/rules.d/70-persistent-net.rules

echo "I: Zero out the free space to save space in the final image..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

exit 0
