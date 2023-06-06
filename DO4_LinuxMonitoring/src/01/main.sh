#!/bin/bash
source correct.sh

generateFail() {
    failNameExp=($(echo $1 | tr "." "\n"))
    letters=$(is_correct_name "${failNameExp[0]}")
    exp=${failNameExp[1]}

    failGenF=0
    lapF=1
    index=0

    while [ "$failGenF" != "$3" ]
    do 
    symbol=${letters:$index:1}
    for (( c=0; c < $lapF; c++))
    do  
        insertF=$insertF$symbol
    done
    nameF=${letters:0:$index}$insertF${letters:$index:$((${#letters} - $index + 1))}
    index=$(($index+1))
    insertF=""

    if [ $index == ${#letters} ]; then
        index=0
        lapF=$(($lapF+1))
    fi

    if [ ! -f "$dirForFail/$nameF.$exp" ]; then
        fallocate -l $2 "$dirForFail/$nameF.$exp"
        echo "$dirForFail/$nameF.$exp "$date" "$2 >> fileLog.log
        failGenF=$(($failGenF+1));
    fi

    if [ $(is_no_memory) -eq "1" ]; then
        failGenF=$3
    fi

done
}

if [ $(checkInput  "$1" "$3" "$5" "$6") -eq "0" ]; then
    is_have_fileLog
    dir="$1"
    inputLetter=$(is_correct_name "$3")
    date="$(date +%d%m%y)"
    failGen=0
    lap=1
    i=0

    while [ "$failGen" != "$2" ]
    do 
        symbol=${inputLetter:$i:1}
        for (( z=0; z < $lap; z++))
        do  
            insert=$insert$symbol
        done
        name=${inputLetter:0:$i}$insert${inputLetter:$i:$((${#inputLetter} - $i + 1))}
        i=$(($i+1))
        insert=""
        if [ $i == ${#inputLetter} ]; then
            i=0
            lap=$(($lap+1))
        fi

        if [ ! -d "$dir/$name"_"$date" ]; then
            mkdir $dir"/"$name"_"$date
            dirForFail=$dir"/"$name"_"$date
            echo $dirForFail" "$date >> fileLog.log
            generateFail "$5" "$6" "$4"
            failGen=$(($failGen+1));
        fi

        if [ $(is_no_memory) -eq "1" ]; then
            failGen=$2
        fi
    done
    echo finish

    else 
    echo "incorrect input"

fi


