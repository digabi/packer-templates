#!/bin/sh

set -e

export DEBIAN_FRONTEND="noninteractive"

apt-get -y remove avahi-autoipd bluetooth linux-image-3.14-* netcat-traditional pinentry-gtk2 reportbug rpcbind telnet w3m wamerican wireless-tools wpasupplicant ftp geoip-database hicolor-icon-theme iamerican ibritish ienglish-common libavahi-* nfs-common task-english wireless-regdb
