#!/bin/bash
#export WDMRC_OPTIONS="$1"
#SVD_OPTIONS="--config /etc/supervisor/supervisord.conf --nodaemon --pidfile /run/supervisord.pid --logfile /dev/null"
#exec /usr/bin/supervisord $SVD_OPTIONS
cd /opt/runner
exec < /dev/null
export WDMRC_OPTIONS="$@"
set -x
exec /usr/bin/mono /opt/runner/wdmrc.exe $WDMRC_OPTIONS -p 8810 -h http://*
