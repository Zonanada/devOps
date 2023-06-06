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
    if [[ $1 =~ ^[0-9][K-k]b ]]; then
        size=($(echo $1 | tr "kK" "\n"))
        if [ ${size[0]} -le "100" ] && [ ${size[0]} -gt "0" ]; then
            echo 0
            else
            echo 1;
        fi

    else 
        echo 1
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

checkInput() {
    # $1 - дирректория
    # $2 - имя папки
    # $3 - имя файла с расширением
    # $4 - размер файла
    incorrectInput=0
    if ! [ -d "$1" ]; then
        incorrectInput=1
    fi

    if [ ${#2} -gt "7" ]; then
        incorrectInput=1
    fi

    failNameExp=($(echo $3 | tr "." "\n"))
    letters=${failNameExp[0]}
    exp=${failNameExp[1]}

    if [ ${#letters} -gt "7" ]; then
        incorrectInput=1
    fi

    if [ ${#exp} -gt "3" ]; then
        incorrectInput=1
    fi

    # echo "$4"
    # echo $(is_correct_size "$4")

    if [ $(is_correct_size "$4") -eq "1" ]; then
        incorrectInput=1
    fi

    size=($(echo $4 | tr "kK" "\n"))

    if [[ ${size[1]} != "b" ]]; then
        incorrectInput=1
    fi

    if [ $(is_correct_size "$4") -eq "1" ]; then
        incorrectInput=1
    fi
    
    # if [ $incorrectInput -eq "0" ]; then
    #     if [ ${size[0]} -gt "100" ]; then
    #     incorrectInput=1
    #     fi
    # fi

    echo $incorrectInput
}

# echo $(checkInput "abcdwer" "arfgitg.afd" 100Kb)
# check="103450Kb"
# regex="k|Kb"
# if [[ $check != "k|Kb" ]]; then
#         echo "true"
# fi

