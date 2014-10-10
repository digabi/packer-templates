#!/bin/sh

set -e

export DEBIAN_FRONTEND="noninteractive"

apt-get -y install puppet chef
