#!/bin/sh

set -e

cleanup() {
    make clean
}

trap cleanup EXIT

make clean
make build BUILD_ID=${BUILD_ID:-$(date +%Y-%m%-d_%H-%M-%S)}.${BUILD_NUMBER:-0}

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
            ${VAGRANT} box list
            echo ${VAGRANT} box remove ...
            echo ${VAGRANT} box add --provider=${PROVIDER} ${NAME} ${box}
        ;;
        vmware)
        ;;
        *)
            echo "W: Unsupported provider ${PROVIDER}."
        ;;
    esac
done
