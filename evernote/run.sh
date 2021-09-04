#!/bin/bash
set -x
docker run \
       -it --rm \
       --name evernote --hostname evernote \
       -v ${HOME}:/home \
       ivandeex/evernote
