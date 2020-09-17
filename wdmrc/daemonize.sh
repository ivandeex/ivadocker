#!/bin/bash
set -x
docker run -d \
  --name wdmrc --rm -p 8810:8810 \
  ivandeex/wdmrc --maxthreads 1 --cache-listing 0
