#!/bin/bash

while read F  ; do
    
    # install package
    echo "Installing $F..."
    # https://stackoverflow.com/questions/25721884/how-should-i-deal-with-package-xxx-is-not-available-for-r-version-x-y-z-wa
    # sudo su - -c "R -e \"install.packages(c('${F}'), repos='https://cran.rstudio.com/')\""
    sudo su - -c "R -e \"withCallingHandlers(install.packages(c('${F}'), repos='https://cran.rstudio.com/'), warning = function(w) stop(w))\""
    
    # check for errors
    EXITCODE=$?
    echo "EXITCODE: $EXITCODE"
    if [ "$EXITCODE" -gt "0" ]; then
        echo "Some error occurred when installing package $F..."
        echo "Quitting!"
        # exit 1 # debug
    else    
        clear
        echo ""
        echo "$F installed successfully..."
        echo ""
    fi

done <r-packages.list

