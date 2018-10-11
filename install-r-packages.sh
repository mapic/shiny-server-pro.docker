#!/bin/bash

while read F  ; do
    
    # install package
    echo "Installing $F..."
    sudo su - -c "R -e \"install.packages(c('${F}'), repos='https://cran.rstudio.com/')\""
    
    # check for errors
    EXITCODE=$?
    echo "EXITCODE: $EXITCODE"
    if [ "$EXITCODE" -gt "0" ]; then
        echo "Some error occurred when installing package $F..."
        echo "Quitting!"
        exit 1
    else    
        clear
        echo ""
        echo "$F installed successfully..."
        echo ""
    fi

done <r-packages.list

