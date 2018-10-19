#!/bin/bash

export SHINY_LOG_LEVEL=DEBUG

# configure license manager
/opt/shiny-server/bin/license-manager license-server $SHINY_LICENSE_SERVER:$SHINY_LICENSE_PORT

# start shiny
shiny-server --pidfile=/var/run/shiny-server.pid
