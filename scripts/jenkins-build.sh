#!/bin/sh

set -e

echo "I: Clean existing boxes..."
rm -f *.box

cleanup() {
    make clean
}

trap cleanup EXIT

make clean

case "${BITS}" in
    64)
        CONFIG_FILE=packer_amd64.json
        ;;
    32)
        CONFIG_FILE=packer_i386.json
        ;;
    *)
        echo "Wouldn't know what to do with ${BITS} bits"
        exit 1
esac
make build BUILD_ID=$(date +%Y-%m%-d_%H-%M-%S).${BUILD_NUMBER:-0} DEBIAN_MIRROR=${DEBIAN_MIRROR:-http://http.debian.net/debian} CONFIG_PACKER=${CONFIG_FILE}
