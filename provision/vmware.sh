#!/bin/sh

set -e

apt-get -y install open-vm-tools open-vm-tools-dkms

echo "I: Create /mnt/hgfs for shared folder support..."
mkdir -p /mnt/hgfs
