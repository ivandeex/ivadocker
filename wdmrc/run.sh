#!/bin/bash
stop=0
trap "stop=1; docker kill wdmrc" INT TERM

docker run \
  --name wdmrc --rm -p 8810:8810 \
  ivandeex/wdmrc --maxthreads 1 --cache-listing 0 &

while [ $stop = 0 ]; do
  sleep 1
done
