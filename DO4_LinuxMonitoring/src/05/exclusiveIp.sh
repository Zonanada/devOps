#!/bin/bash

countIp=0
getIp() {
    for ((i=1; i < 6; i++))
    do
    failLog="../04/log$i.log"
    echo $failLog
    if [ -f "$failLog" ]; then
        while IFS= read -r line
            do
            arrIp[$countIp]=`echo $line | awk '{print $1}'`
            countIp=$(( $countIp + 1))

        done < $failLog
    fi
    done
}

unique=0
exclusiveIp() {
    getIp
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