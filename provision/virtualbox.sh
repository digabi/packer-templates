#!/bin/sh

set -e

export DEBIAN_FRONTEND="noninteractive"

apt-get -y install virtualbox-guest-utils virtualbox-guest-dkms linux-headers-amd64
