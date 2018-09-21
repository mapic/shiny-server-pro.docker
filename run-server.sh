#!/bin/bash
docker run -it -p 80:3838 --link shiny-floating-license-server mapic/shiny-server-pro:latest bash
