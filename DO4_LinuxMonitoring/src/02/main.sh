#!/bin/bash
dataStart=`date`
START=$(date +%s%N)
source createDir.sh
check=$(checkInput "$1" "$2" "$3")

if [ $check -eq "0" ]; then
    is_have_fileLog
    mass=$(ls -la / | grep ^d | awk '{print $9}')
    sumDir=`ls -la / | grep ^d | wc | awk '{print $1}'`
    numFolders=$(( 50 / $(($sumDir - 5)) ))

    g=3
    while [[ $g -lt $sumDir ]]; do
        fold=`echo $mass | awk '{print $'$g'}'`
        # echo $fold
        randomNum=$(( $RANDOM % 100 + 1 ))
        if [ $fold != "sys" ] && [ $fold != "proc" ] && [ $fold != "mnt" ]; then
            createDir "$fold" "$numFolders" "$1" "$2" "$3"
        fi
        g=$(($g+1))
    done

    else 
    echo "incorrect input"

fi

if [ $check -eq "0" ]; then
END=$(date +%s%N)
DIFF=$(( $(( $END - $START )) /1000000 ))
if [ $DIFF -le "1000" ] ; then
    zero="0"
fi

echo start = $dataStart >> fileLog.log
echo start = $dataStart
echo "Script execution time (in seconds) = $zero$(bc<<<"scale=2;$DIFF / 1000")" >> fileLog.log
echo "Script execution time (in seconds) = $zero$(bc<<<"scale=2;$DIFF / 1000")"
echo finish = `date` >> fileLog.log
echo finish = `date`
fi
# mass=$(ls -la / | grep ^d | awk '{print $9}')
# fold=`echo $mass | awk '{print $3}'`
# echo $fold