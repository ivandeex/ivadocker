#!/bin/bash
#set -x

SERIAL=10030252

if [ -z "${1:-}" ]; then
    prog=$(basename "$0")
    echo "usage: $prog DOMAIN N_USERS [SERIAL]"
    exit 1
fi

docker run \
    -e SERIAL=$SERIAL \
    -it --privileged \
    ivandeex/cgpkg "$@"
