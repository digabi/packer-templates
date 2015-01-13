#!/bin/sh

set -e

mount -o loop -t iso9660 /home/vagrant/linux.iso /media/cdrom
#mount /media/cdrom

OLDDIR="${PWD}"
TEMPDIR="$(mktemp -d)"

cd ${TEMPDIR}

tar xzf /media/cdrom/VMwareTools-*.tar.gz

./vmware-tools-distrib/vmware-install.pl default

umount -l /media/cdrom
rm -f /home/vagrant/linux.iso

cd "${OLDDIR}"
rm -rf "${TEMPDIR}"
