#!/bin/bash

my_string=`uptime -p`
my_array=($(echo $my_string | tr " " "\n"))

if [[ ${my_array[2]} == "minutes" ]]; then 
    UPTIME_SEC=$((${my_array[1]} * 60))
else UPTIME_SEC=$((${my_array[1]} * 3600 + ${my_array[3]} * 60)) 
fi

normal="\033[0m"

masc=`ip a | grep inet | awk 'NR==1 {print $2}'`
my_array_masc=($(echo $masc | tr "/" "\n"))
masc=${my_array_masc[1]}

ramTotal=`vmstat -s | grep "total memory" | awk '{print $1}'`
ramTotal="$(bc<<<"scale=3;$ramTotal/1048576")"
if [[ $ramTotal =~ ^[.] ]] ; then
    ramTotal="0$ramTotal"
fi


ramUsed=`vmstat -s | grep "used memory" | awk '{print $1}'`
ramUsed=$(bc<<<"scale=3;$ramUsed/1048576")
if [[ $ramUsed =~ ^[.] ]] ; then
    ramUsed="0$ramUsed"
fi

freeMemory=`vmstat -s | grep "free memory" | awk '{print $1}'`
freeMemory=$(bc<<<"scale=3;$freeMemory/1048576")
if [[ $freeMemory =~ ^[.] ]] ; then
    freeMemory="0$freeMemory"
fi

spaceRoot=`df | grep '/$' | awk '{print $2}'`
spaceRoot=$(bc<<<"scale=2;$spaceRoot/1024")

spaceRootUsed=`df | grep '/$' | awk '{print $3}'`
spaceRootUsed=$(bc<<<"scale=2;$spaceRootUsed/1024")

spaceRootFree=`df | grep '/$' | awk '{print $4}'`
spaceRootFree=$(bc<<<"scale=2;$spaceRootFree/1024")