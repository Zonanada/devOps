#!/bin/bash

source forLog.sh
source forData.sh
source forMask.sh

case "$1" in
    "1" )
    rmForLog
    ;;
    "2" )
    forDate
    ;;
    "3" )
    forMask
    ;;
    
    * )
    echo "Incorrect input"
    ;;
esac
