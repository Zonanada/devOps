#!/bin/bash


searchErr() {
    responseErr=(400 401 403 404 500 502 503)
    for ((i=1; i < 6; i++))
    do
    failLog="../04/log$i.log"
    if [ -f "$failLog" ]; then
        while IFS= read -r line
            do
            answer=`echo $line | awk '{print $8}'`
            if [[ "$1" == "$answer" ]]; then
                echo `echo $line | awk '{print $6" "$7" "$8" "$10}'`
            fi

        done < $failLog
    fi
    done
}

sortRespError() {
    for ((x=0; x < 7; x++)) {
        searchErr "${responseErr[x]}"
    }
}