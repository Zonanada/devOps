#!/bin/bash
countIp=0
responseErr=(400 401 403 404 500 502 503)
getIpErr() {
    for ((i=1; i < 6; i++))
    do
    failLog="../04/log$i.log"
    # echo $failLog
    if [ -f "$failLog" ]; then
        while IFS= read -r line
            do
            answer=`echo $line | awk '{print $8}'`
            if [[ "$1" == "$answer" ]]; then
                arrIp[$countIp]=`echo $line | awk '{print $1}'`
                countIp=$(( $countIp + 1))
            fi

        done < $failLog
    fi
    done
}

errExclusiveIp() {
    for ((x=0; x < 7; x++)) {
        echo "search ip with err ${responseErr[x]}"
        getIpErr "${responseErr[x]}"
    }

    # echo $countIp

    unique=0
    for ((i=0; i < $countIp; i++))
        do
            coincidence=0
            for ((y=0; y < $countIp; y++))
            do
                if [[ "${arrIp[i]}" == "${arrIp[y]}" ]] && [[ "$i" != "$y" ]] ; then
                    coincidence=1
                fi
            done
            if [[ "$coincidence" == "0" ]]; then
                    echo ${arrIp[i]}
                    unique=$(( $unique + 1))
            fi
        done

    echo "unique ip $unique/$countIp"
}