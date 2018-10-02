#!/bin/bash

SERVER=shiny-floating-license-server
PORT=8979

export SHINY_LOG_LEVEL=DEBUG

# /opt/shiny-server/bin/license-manager license-server $SERVER:$PORT
echo "SHINY_LICENSE_SERVER: $SHINY_LICENSE_SERVER"
echo "SHINY_LICENSE_PORT: $SHINY_LICENSE_PORT"

# configure license manager
# /opt/shiny-server/bin/license-manager license-server $SHINY_LICENSE_SERVER:$SHINY_LICENSE_PORT
/opt/shiny-server/bin/license-manager license-server localhost:$SHINY_LICENSE_PORT

# start shiny
shiny-server --pidfile=/var/run/shiny-server.pid 