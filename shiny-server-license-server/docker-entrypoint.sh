#!/bin/bash

if [ -z "$SHINY_FLOATING_LICENSE_SERVER_KEY" ]; then
    echo "No license key. Quitting!"
    exit 1
fi

# authenticate license server
sudo ssp-license-server deactivate
sudo ssp-license-server activate $SHINY_FLOATING_LICENSE_SERVER_KEY


# start license server
sudo /usr/lib/ssp-license-server/bin/license-server \
    -pdets=/usr/lib/ssp-license-server/bin/license-server.dat \
    -config=/etc/ssp-license-server.conf \
    -d -pidfile=/var/run/ssp-license-server.pid
