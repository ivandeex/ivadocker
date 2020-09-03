#!/bin/bash
set -x
image=ivandeex/cgpkg
stamp=$(date +%y%m%d%H%M)
docker build \
    --tag "$image:latest" \
    --tag "$image:$stamp" \
    "$(dirname "$0")"
docker push "$image:latest"
docker push "$image:$stamp"
