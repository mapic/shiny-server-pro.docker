#!/bin/bash

docker build -t mapic/shiny-server-pro .

if [ "$?" -gt "0" ]; then
    echo "Build errored."
    exit 1
fi
docker push mapic/shiny-server-pro:latest