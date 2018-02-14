#!/bin/sh

set -e

apt-get -y install fuse open-vm-tools

echo "I: Create /mnt/hgfs for shared folder support..."
mkdir -p /mnt/hgfs
