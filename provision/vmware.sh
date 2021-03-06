#!/bin/sh

set -e

export DEBIAN_FRONTEND="noninteractive"

echo "I: Install fuse and open-vm-tools..."
apt-get -y install fuse open-vm-tools fuse

echo "I: Install VMWareTools..."
wget http://192.168.3.31/pub/VMwareTools-10.2.0-7253323.tar.gz
tar xvzf VMwareTools-10.2.0-7253323.tar.gz
sudo ./vmware-tools-distrib/vmware-install.pl --default

rm -rf VMwareTools-10.2.0-7253323.tar.gz vmware-tools-distrib

echo "I: Create /mnt/hgfs for shared folder support..."
mkdir -p /mnt/hgfs
