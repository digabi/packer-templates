#!/bin/sh

set -e

echo "I: Clean existing boxes..."
rm -f *.box

cleanup() {
    make clean
}

trap cleanup EXIT

VM_NAME="debian-jessie-amd64"
VM_UUID="$(vboxmanage list vms |grep ^\"${VM_NAME}\" |cut -d' ' -f2 || echo "")"

if [ "${VM_UUID}" != "" ]
then
    echo "I: Previous VM exists (${VM_UUID}), trying to poweroff & destroy..."
    sleep 30
    vboxmanage controlvm "${VM_UUID}" poweroff || echo "W: Can't poweroff virtual machine."
    vboxmanage unregistervm --delete "${VM_UUID}" || echo "W: Can't remove virtual machine."
elif [ -f "~/VirtualBox\ VMs/debian-jessie-amd64/debian-jessie-amd64.vbox" ]
then
    echo "I: Removing stale VirtualBox configuration... ('.vbox)."
    rm -f "~/VirtualBox\ VMs/debian-jessie-amd64/debian-jessie-amd64.vbox"
fi

make clean
make build BUILD_ID=${BUILD_ID:-$(date +%Y-%m%-d_%H-%M-%S)}.${BUILD_NUMBER:-0} DEBIAN_MIRROR=${DEBIAN_MIRROR:-http://http.debian.net/debian}

VAGRANT="/usr/bin/vagrant"
BUILD_ONLY="${BUILD_ONLY:-0}"

if [ "${BUILD_ONLY}" != "0" ]
then
    echo "I: Doing only build, stopping here."
    exit 0
fi

if [ ! -x "${VAGRANT}" ]
then
    echo "E: vagrant not found (${VAGRANT})... Not adding boxes."
    exit 1
fi

for box in *.box
do
    NAME="$(echo ${box} |cut -d_ -f2)"
    PROVIDER="$(echo ${box} |cut -d_ -f3)"
    echo "I: Add box ${box} to vagrant using provider ${PROVIDER}..."
    case "${PROVIDER}" in
        virtualbox)
            ${VAGRANT} box add --force --provider=${PROVIDER} ${NAME} ${box}
        ;;
        vmware)
            PROVIDER="${PROVIDER}_desktop"
            ${VAGRANT} box add --force --provider=${PROVIDER} ${NAME} ${box}
        ;;
        *)
            echo "W: Unsupported provider ${PROVIDER}."
        ;;
    esac
done
