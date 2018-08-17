#!/bin/sh

echo "$(date)" | tee /etc/vagrant_box_build_time

export DEBIAN_FRONTEND="noninteractive"

echo "I: Add sudo permissions to user vagrant..."
cat > /etc/sudoers.d/vagrant << EOF
vagrant		ALL=(ALL) NOPASSWD: ALL
EOF

echo "I: Disable DNS checks to speed-up SSH logins..."
echo "UseDNS no" >>/etc/ssh/sshd_config
service ssh restart

echo "I: Add pubkey for vagrant..."
mkdir -p /home/vagrant/.ssh
cat > /home/vagrant/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key
EOF
chown -R vagrant:vagrant /home/vagrant
chmod 0700 /home/vagrant/.ssh

echo "I: Set root password..."
echo "root:vagrant" |chpasswd
passwd -u root

# Customize the message of the day
echo 'Welcome to your Packer-built virtual machine.' > /var/run/motd

cat > /etc/apt/apt.conf.d/99recommends << EOF
APT::Install-Recommends "false";
APT::Install-Suggests "false";
EOF

# Removing leftover DHCP leases
rm /var/lib/dhcp/*.leases

# Deactivate name persistence for network interfaces
#dpkg-divert --divert /lib/udev/write_net_rules \
#            --rename /lib/udev/write_net_rules.udev
#cp /bin/true /lib/udev/write_net_rules
rm -f /etc/udev/rules.d/70-persistent-net.rules

# Activate additional interfaces, adding a 2 sec delay to the interface up, to make the dhclient happy
cat >>/etc/network/interfaces<<EOF
allow-hotplug ens32
iface ens32 inet dhcp

pre-up sleep 5
EOF

sed -i 's,^GRUB_TIMEOUT=5,GRUB_TIMEOUT=1,g' /etc/default/grub
update-grub

apt-get -y install build-essential linux-headers-$(uname -r)
