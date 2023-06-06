#!/bin/bash
source sortResp.sh
source exclusiveIp.sh
source sortRespError.sh
source errExclusiveIp.sh


case "$1" in
    "1" )
    sortResp
    ;;
    "2" )
    exclusiveIp
    ;;
    "3" )
    sortRespError
    ;;
    "4" )
    errExclusiveIp
    ;;
    
    * )
    echo "Incorrect input"
    ;;
esac