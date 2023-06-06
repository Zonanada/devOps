#!/bin/bash
is_correct_name() {
    # echo $1
    if [ ${#1} -lt "3" ]; then
        missing=$((3 - ${#1}))
        for (( z=0; z < $missing; z++ ))
        do  
            insert=$insert${1:0:1}$1
        done
        echo $insert
        else 
        echo $1
    fi
}

is_correct_exe() {
    if [ ${#1} -gt "3" ]; then
        echo 0;
        else
        echo 1;

    fi
}

is_correct_size() {
    size=($(echo $1 | tr "kK" "\n"))
    if [ ${size[0]} -gr "100" ]; then
        echo 0
        else
        echo 1;
    fi
}

is_no_memory() {
    memory=`df / | grep / | awk '{print $4}'`
    if [ $memory -lt "1048577" ]; then
        echo 1
        else
        echo 0
    fi
}

is_have_fileLog() {
    if [ -f "fileLog.log" ]; then
        sudo rm fileLog.log
    fi
}

have_space_mb() {
    var=`df $1 | awk '{print $4}'`
    availKb=`echo $var | awk '{print $2}'`
    echo $(( availKb / 1024 ))
}

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
        if [ "$(have_space_mb $dirForFail)" -ge `echo $2 | tr -d Mb` ] ; then
            echo "$dirForFail/$nameF.$exp $2"
            fallocate -l $2 "$dirForFail/$nameF.$exp"
            echo "$dirForFail/$nameF.$exp "$date" "$2 >> fileLog.log
            failGenF=$(($failGenF+1));

            else
            failGenF=$3
        fi
    fi

    if [ $(is_no_memory) -eq "1" ]; then
        failGenF=$3
    fi

done
}

createDir() {
    dir="$1"
    inputLetter=$(is_correct_name "$3")
    date="$(date +%d%m%y)"
    failGen=0
    lap=1
    i=0

    # echo $dir

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

            echo "/"$dir"/"$name"_"$date
        if [ ! -d "/$dir/$name"_"$date" ]; then
            echo "/"$dir"/"$name"_"$date
            mkdir "/"$dir"/"$name"_"$date
            dirForFail="/"$dir"/"$name"_"$date
            echo $dirForFail" "$date >> fileLog.log
            generateFail "$4" "$5" "$(( $RANDOM % 50 + 1 ))"
            failGen=$(($failGen+1));
        fi

        if [ $(is_no_memory) -eq "1" ]; then
            failGen=$2
        fi
    done
}

checkInput() {
    # $1 - имя папки
    # $2 - имя файла с расширением
    # $3 - размер файла
    incorrectInput=0

    if [ ${#1} -gt "7" ]; then
        incorrectInput=1
    fi

    failNameExp=($(echo $2 | tr "." "\n"))
    letters=${failNameExp[0]}
    exp=${failNameExp[1]}

    if [ ${#letters} -gt "7" ]; then
        incorrectInput=1
    fi

    if [ ${#exp} -gt "3" ]; then
        incorrectInput=1
    fi

    size=($(echo $3 | tr "mM" "\n"))

    if [[ ${size[1]} != "b" ]]; then
        incorrectInput=1
    fi
    
    if [ $incorrectInput -eq "0" ]; then
        if [ ${size[0]} -gt "100" ]; then
        incorrectInput=1
        fi
    fi
    echo $incorrectInput
}