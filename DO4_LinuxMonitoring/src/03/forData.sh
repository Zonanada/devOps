#!/bin/bash

is_correct_date() {
    if [[ $1 =~ 2022-[0-1][0-9]-[0-3][0-9][[:space:]][0-2][0-9]:[0-5][0-9] ]]; then
    echo 1
    else 
    echo 0
    fi
}

rmFordate() {
    onRemove=`sudo find $1 -maxdepth 1 -newermt "$2" ! -newermt "$3"`
    # echo $onRemove
    # var=`echo $onRemove | awk '{print $4}'`
    lengthRemove=`echo $onRemove | wc | awk '{print $2}'`

    for ((i=2; i <= $lengthRemove; i++))
    do  
        nameDir=`echo $onRemove | awk '{print $'$i'}'`
        # echo $nameDir
        if [[ $nameDir =~ "_`date +%d%m%y`" ]]; then
            echo "sudo rm -fr $nameDir"
            sudo rm -fr $nameDir
        fi

        # sudo rm -fr `echo $onRemove | awk '{print $'$i'}'`
        # echo `echo $onRemove | awk '{print $'$i'}'`
    done
}

forDate() {
    echo example: `date "+%Y-%m-%d %H:%M" --date '-15 min'`
    read date1
    echo example: `date "+%Y-%m-%d %H:%M"`
    read date2
    # echo $(is_correct_date "$date1")
    # echo $(is_correct_date "$date2")
    if [ $(is_correct_date "$date1") -eq "1" ] && [ $(is_correct_date "$date2") -eq "1" ]; then
        mass=$(ls -la / | grep ^d | awk '{print $9}')
        sumDir=`ls -la / | grep ^d | wc | awk '{print $1}'`

        g=3
        while [[ $g -lt $sumDir ]]; do
            fold=`echo $mass | awk '{print $'$g'}'`
            # echo $fold
            if [ $fold != "sys" ] && [ $fold != "proc" ] && [ $fold != "mnt" ]; then
                # echo "rmFordate /$fold '$date1' '$date2'"
                rmFordate /$fold "$date1" "$date2"
            fi
            g=$(($g+1))
        done
        echo finish

        else
        echo incorrect input
    fi
}

