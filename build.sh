#!/bin/bash

docker build -t mapic/shiny-server-pro .

docker push mapic/shiny-server-pro:latest