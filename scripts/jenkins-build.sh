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
        ARCH=amd64
        ;;
    *)
        echo "Wouldn't know what to do with ${BITS} bits"
        exit 1
esac
make build BUILD_ID=$(date +%Y-%m%-d_%H-%M-%S).${BUILD_NUMBER:-0} DEBIAN_MIRROR=${DEBIAN_MIRROR:-http://http.debian.net/debian} CONFIG_PACKER=${CONFIG_FILE}
BOX_VERSION=${BUILD_NUMBER:-0}
for box in *.box
do
    case "${box}" in
        *_vmware_*)
            VMWARE_BOX_URL=${BUILD_URL}/artifact/${box}
            VMWARE_BOX_SHA1=$(sha1sum ${box} | awk '{print $1}')
            sed -i.bak -e "s|__ARCH__|${ARCH}|g" -e "s|__BOX_VERSION__|${BOX_VERSION}|g" -e "s|__VMWARE_BOX_URL__|${VMWARE_BOX_URL}|g" -e "s|__VMWARE_BOX_SHA1__|${VMWARE_BOX_SHA1}|g" metadata.json
            ;;
        *_virtualbox_*)
            VBOX_BOX_URL=${BUILD_URL}/artifact/${box}
            VBOX_BOX_SHA1=$(sha1sum ${box} | awk '{print $1}')
            sed -i.bak -e "s|__ARCH__|${ARCH}|g" -e "s|__BOX_VERSION__|${BOX_VERSION}|g" -e "s|__VBOX_BOX_URL__|${VBOX_BOX_URL}|g" -e "s|__VBOX_BOX_SHA1__|${VBOX_BOX_SHA1}|g" metadata.json
            ;;
        *)
            echo "Unknown box ${box}"
            exit 1
    esac
done
