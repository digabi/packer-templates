#!/bin/sh

set -e

mount /media/cdrom

TEMPDIR="$(mktemp -d)"

cd ${TEMPDIR}

tar xzf /media/cdrom/VMwareTools-*.tar.gz

./vmware-tools-distrib/vmware-install.pl default
