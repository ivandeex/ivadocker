#!/bin/bash
set -x
VER=1.11.0.31
docker build \
  --tag "ivandeex/wdmrc:latest" \
  --build-arg "WDMRC_VERS=${VER}" \
  .
