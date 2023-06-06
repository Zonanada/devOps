#!/bin/bash

search() {
    response=(200 201 400 401 403 404 500 502 503)
    for ((i=1; i < 6; i++))
    do
    failLog="../04/log$i.log"
    if [ -f "$failLog" ]; then
        while IFS= read -r line
            do
            answer=`echo $line | awk '{print $8}'`
            if [[ "$1" == "$answer" ]]; then
                # echo `echo $line | awk '{print $5" "$6}'`
                echo $line
            fi

        done < $failLog
    fi
    done
    
    }

sortResp() {
    for ((x=0; x < 9; x++)) {
        search "${response[x]}"
    }
}





