#!/bin/sh
set -x
user=ivandeex
tags="16.04 18.04 20.04"
docker buildx create --name molecule-builder --use
for tag in $tags ; do
  docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --tag $user/molecule:$tag --push \
    --file Dockerfile-$tag .
done
