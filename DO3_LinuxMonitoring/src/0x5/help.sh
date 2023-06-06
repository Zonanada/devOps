#!/bin/bash

topDir=`du $1 | sort -n -r | head -n 6 | awk '{print $2}'`
my_array_topDir=($(echo $topDir | tr " " "\n"))

topFiles=`find $1 -xdev -type f -size +1b -exec du -sh {} ';' | sort -rh | head -n 11 | awk '{print $2}'`
my_array_topFiles=($(echo $topFiles | tr " " "\n"))

topFilesPlay=`find $1 -xdev -perm /a=x -type f -size +1b -exec du -sh {} ';' | sort -rh | head -n 11 | awk '{print $2}'`
my_array_topFilesPlay=($(echo $topFiles | tr " " "\n"))