#!/bin/bash
if [[ $1 == "" ]]; then
    echo "Не указан параметр"
    exit 0
fi

if [[ "$1" =~ [0-9] ]]; then 
    echo "incorrect input" 
else echo "$1"
fi
