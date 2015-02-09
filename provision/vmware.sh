#!/bin/sh

set -e

apt-get -y install git

mount -o loop -t iso9660 /home/vagrant/linux.iso /media/cdrom
#mount /media/cdrom

OLDDIR="${PWD}"
TEMPDIR="$(mktemp -d)"

cd ${TEMPDIR}
git clone https://github.com/rasa/vmware-tools-patches.git vmware-tools-patches
cd vmware-tools-patches
git checkout 3a392a590b873bfeb515a36240c2d1510e87675c

cp /media/cdrom/VMwareTools-*.tar.gz .
#tar xzf /media/cdrom/VMwareTools-*.tar.gz

#./vmware-tools-distrib/vmware-install.pl default

./untar-and-patch-and-compile.sh

umount -l /media/cdrom
rm -f /home/vagrant/linux.iso

cd "${OLDDIR}"
rm -rf "${TEMPDIR}"
