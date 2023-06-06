#!/bin/bash

for ((i=1; i < "5"; i++))
    do
    if [[ ${!i} =~ ^[0-6]$ ]]; then 
        ok=ok
        else 
        echo "${!i} incorrect input"
        exit 0
    fi
    done
    
source ./help.sh

fonName="$(whichСolorBr $1)"
colorName="$(whichСolor $2)"
fonValue="$(whichСolorBr $3)"
colorValue="$(whichСolor $4)"
algFonName="`echo $fonName | grep -o [0-9][0-9]| awk 'NR==2 {print $0}'`"
algFonName="\033[$(($algFonName-10))m"
algFonValue="`echo $fonValue | grep -o [0-9][0-9]| awk 'NR==2 {print $0}'`"
algFonValue="\033[$(($algFonValue-10))m"

if [ $algFonName == $colorName ]; then
    echo "Цвет фона и текста названий одинаковый. Текст сливается с фоном. Попробуйте запустить скрипт ещё раз"
    exit
fi

if [ $algFonValue == $colorValue ]; then
    echo "Цвет фона и текста значений одинаковый. Текст сливается с фоном. Попробуйте запустить скрипт ещё раз"
    exit
fi

echo -e "${fonName}${colorName}HOSTNAME${normal} = ${fonValue}${colorValue}`hostname`${normal}"
echo -e "${fonName}${colorName}TIMEZONE${normal} = ${fonValue}${colorValue}`cat /etc/timezone`${normal}"
echo -e "${fonName}${colorName}USER${normal} = ${fonValue}${colorValue}$USER${normal}"
echo -e "${fonName}${colorName}OS${normal} = ${fonValue}${colorValue}`uname -mrs`${normal}"
echo -e "${fonName}${colorName}DATE${normal} = ${fonValue}${colorValue}`date +"%d %b %Y %H:%M:%S"`${normal}"
echo -e "${fonName}${colorName}UPTIME${normal} = ${fonValue}${colorValue}`uptime -p`${normal}"

if [[ ${my_array[2]} == "minutes" ]]; then 
    UPTIME_SEC=$((${my_array[1]} * 60))
else UPTIME_SEC=$((${my_array[1]} * 3600 + ${my_array[3]} * 60)) 
fi

echo  -e "${fonName}${colorName}UPTIME_SEC${normal} = ${fonValue}${colorValue}$UPTIME_SEC${normal}"
echo -e "${fonName}${colorName}IP${normal} = ${fonValue}${colorValue}`ip a | grep inet | awk 'NR==1 {print $2}'`${normal}"
echo -e -n "${fonName}${colorName}MASK${normal} = ${fonValue}${colorValue}`ipcalc /${masc} | awk 'NR==1 {print $3}'`"
echo -e "`ipcalc /${masc} | awk 'NR==1 {print $4}'`${normal}"
echo -e "${fonName}${colorName}GATEWAY${normal} = ${fonValue}${colorValue}`ip route | grep default | awk '{print $3}'`${normal}"
echo -e "${fonName}${colorName}RAM_TOTAL${normal} = ${fonValue}${colorValue}$ramTotal GB${normal}"
echo -e "${fonName}${colorName}RAM_USED${normal} = ${fonValue}${colorValue}$ramUsed GB${normal}"
echo -e "${fonName}${colorName}RAM_FREE${normal} = ${fonValue}${colorValue}$freeMemory GB${normal}"
echo -e "${fonName}${colorName}SPACE_ROOT${normal} = ${fonValue}${colorValue}$spaceRoot MB${normal}"
echo -e "${fonName}${colorName}SPACE_ROOT_USED${normal} = ${fonValue}${colorValue}$spaceRootUsed MB${normal}"
echo -e "${fonName}${colorName}SPACE_ROOT_FREE${normal} = ${fonValue}${colorValue}$spaceRootFree MB${normal}"