#!/bin/bash

SERVER=shiny-floating-license-server
PORT=8979

export SHINY_LOG_LEVEL=DEBUG

# configure license manager
/opt/shiny-server/bin/license-manager license-server $SERVER:$PORT

# start shiny
shiny-server --pidfile=/var/run/shiny-server.pid 