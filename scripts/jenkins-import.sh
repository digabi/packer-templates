#!/bin/sh
set -e

VAGRANT="/usr/bin/vagrant"

if [ ! -x "${VAGRANT}" ]
then
    echo "E: vagrant not found (${VAGRANT})... Not adding boxes."
    exit 1
fi

for box in *.box
do
    if [ -z "${VAGRANT_BOX_NAME}" ]
    then
        VAGRANT_BOX_NAME="$(echo ${box} |cut -d_ -f2)"
    fi
    PROVIDER="$(echo ${box} |cut -d_ -f3)"
    echo "I: Add box ${box} to vagrant using provider ${PROVIDER}, with name ${VAGRANT_BOX_NAME}..."
    case "${PROVIDER}" in
        virtualbox)
            ${VAGRANT} box add --force --provider=${PROVIDER} ${VAGRANT_BOX_NAME} ${box}
        ;;
        vmware)
            PROVIDER="${PROVIDER}_desktop"
            ${VAGRANT} box add --force --provider=${PROVIDER} ${VAGRANT_BOX_NAME} ${box}
        ;;
        *)
            echo "W: Unsupported provider ${PROVIDER}."
        ;;
    esac
done
