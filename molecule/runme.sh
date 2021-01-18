#!/bin/sh
set -x
user=ivandeex
tags="16.04 18.04 20.04"
for tag in $tags ; do
  docker build -f Dockerfile-$tag -t $user/molecule:$tag .
  docker push $user/molecule:$tag
done
