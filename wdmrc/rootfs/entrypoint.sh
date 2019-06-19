#!/bin/bash
export WDMRC_OPTIONS="$1"
SVD_OPTIONS="--config /etc/supervisor/supervisord.conf --nodaemon --pidfile /run/supervisord.pid --logfile /dev/null"
exec /usr/bin/supervisord $SVD_OPTIONS
