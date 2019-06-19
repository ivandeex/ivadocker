#!/bin/bash
cd /opt/runner
exec < /dev/null
set -x
exec /usr/bin/mono /opt/runner/wdmrc.exe $WDMRC_OPTIONS -p 8810 -h http://*
