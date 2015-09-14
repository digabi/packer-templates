#!/bin/sh

set -e

echo "I: Install vmware-tools..."
cd /tmp/
mount -o loop linux.iso /media/cdrom
tar xvzf /media/cdrom/VMwareTools*gz
umount /media/cdrom
vmware-tools-distrib/vmware-install.pl -d
rm -rf linux.iso vmware-tools-distrib
