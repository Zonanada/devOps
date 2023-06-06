#!/bin/bash
#Памятка, Таблица цветов и фонов
#Цвет		код			код фона
 
#black		30	40	\033[30m	\033[40m
#red		31	41	\033[31m	\033[41m
#green		32	42	\033[32m	\033[42m
#yellow		33	43	\033[33m	\033[43m
#blue		34	44	\033[34m	\033[44m
#purpure	35	45	\033[35m	\033[45m
#cyan		36	46	\033[36m	\033[46m
#white		37	47	\033[37m	\033[47m
#1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black

numColor() {
    case $1 in
    1)
        resFunc="$1 (white)" 
    ;;
    2)
        resFunc="$1 (red)" 
    ;;
    3)
        resFunc="$1 (green)" 
    ;;
    4)
        resFunc="$1 (blue)"
    ;;
    5)
        resFunc="$1 (purple)"
    ;;
    6)
        resFunc="$1 (black)"
    ;;
    *)
        resFunc="default"
    esac
        if [[ $resFunc == "default" ]]; then
            if [[ $2 == "fonName" ]]; then
                resFunc="default (black)"
            fi
            if [[ $2 == "colorName" ]]; then
                resFunc="default (white)"
            fi
            if [[ $2 == "fonValue" ]]; then
                resFunc="default (red)"
            fi
            if [[ $2 == "colorValue" ]]; then
                resFunc="default (blue)"
            fi

        fi

    echo  "$resFunc"
}


whichСolor() {
    case $1 in
    1)
        resFunc="\033[37m" 
    ;;
    2)
        resFunc="\033[31m" 
    ;;
    3)
        resFunc="\033[32m" 
    ;;
    4)
        resFunc="\033[34m"
    ;;
    5)
        resFunc="\033[35m"
    ;;
    6)
        resFunc="\033[30m"
    ;;
    *)
        resFunc="default"
    esac 

    if [[ $resFunc == "default" ]]; then
            if [[ $2 == "colorName" ]]; then 
                resFunc="\033[37m"
            else
                resFunc="\033[34m"
            fi
    fi
    echo $resFunc
}
declare -x -f whichСolor

whichСolorBr() {
    case $1 in
    1)
        resFunc="\033[47m"
    ;;
    2)
        resFunc="\033[41m"
    ;;
    3)
        resFunc="\033[42m"
    ;;
    4)
        resFunc="\033[44m"
    ;;
    5)
        resFunc="\033[45m"
    ;;
    6)
        resFunc="\033[40m"
    ;;
    *)
        resFunc="default"
    esac
    if [[ $resFunc == "default" ]]; then
            if [[ $2 == "fonName" ]]; then
                resFunc="\033[40m"
            else
                resFunc="\033[41m"
            fi
    fi
    echo $resFunc
}
declare -x -f whichСolorBr