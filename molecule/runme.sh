#!/bin/sh
set -x
user=ivandeex
tag_list="16.04 18.04"
for tag in $tag_list ; do
  docker build -f Dockerfile-$tag -t $user/molecule:$tag .
  docker push $user/molecule:$tag
done
