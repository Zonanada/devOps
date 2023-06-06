#!/bin/bash

rmForMask() {
    onRemove=`sudo find "$1" -name *$2`
    # echo $onRemove
    # var=`echo $onRemove | awk '{print $4}'`
    lengthRemove=`echo $onRemove | wc | awk '{print $2}'`
    # echo $lengthRemove
    if [ "$lengthRemove" -gt "0" ]; then
        for ((i=1; i <= $lengthRemove; i++))
            do
                nameDir=`echo $onRemove | awk '{print $'$i'}'`
                echo "rm -fr $nameDir"
                sudo rm -fr $nameDir
            done
    fi
}

forMask() {
    echo example: "_`date +%d%m%y`"
    read mask
    mass=$(ls -la / | grep ^d | awk '{print $9}')
    sumDir=`ls -la / | grep ^d | wc | awk '{print $1}'`

    g=3
    while [[ $g -lt $sumDir ]]; do
        fold=`echo $mass | awk '{print $'$g'}'`
        # echo $fold
        if [ $fold != "sys" ] && [ $fold != "proc" ] && [ $fold != "mnt" ]; then
            # echo "rmFordate /$fold '$date1' '$date2'"
            rmForMask /$fold "$mask"
        fi
        g=$(($g+1))
    done

    echo finish
}