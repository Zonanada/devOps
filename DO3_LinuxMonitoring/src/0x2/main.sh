#!/bin/bash
source ./help.sh

echo "HOSTNAME = `hostname`"
echo "TIMEZONE = `cat /etc/timezone`"
echo "USER = "$USER
echo "OS = `uname -mrs`"
echo "DATE = `date +"%d %b %Y %H:%M:%S"`"
echo "UPTIME = `uptime -p`"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = `ip a | grep inet | awk 'NR==1 {print $2}'`"
echo -n "MASK = `ipcalc /${masc} | awk 'NR==1 {print $3}'`"
echo `ipcalc /${masc} | awk 'NR==1 {print $4}'`
echo "GATEWAY = `ip route | grep default | awk '{print $3}'`"
echo "RAM_TOTAL = $ramTotal GB"
echo "RAM_USED = $ramUsed GB"
echo "RAM_FREE = $freeMemory GB"
echo "SPACE_ROOT = $spaceRoot MB"
echo "SPACE_ROOT_USED = $spaceRootUsed MB"
echo "SPACE_ROOT_FREE = $spaceRootFree MB"

read -p "Записать данные в файл ? Y/N : " ans
if [[ $ans =~ [yY] ]]; then
    failName="`date +"%d_%m_%Y_%H:%M:%S"`.status"
    touch $failName
    echo "HOSTNAME = `hostname`" >> $failName
    echo "TIMEZONE = `cat /etc/timezone`" >> $failName
    echo "USER = "$USER >> $failName
    echo "OS = `uname -mrs`" >> $failName
    echo "DATE = `date +"%d %b %Y %H:%M:%S"`" >> $failName
    echo "UPTIME = `uptime -p`" >> $failName
    echo "UPTIME_SEC = $UPTIME_SEC" >> $failName
    echo "IP = `ip a | grep inet | awk 'NR==1 {print $2}'`" >> $failName
    echo -n "MASK = `ipcalc /${masc} | awk 'NR==1 {print $3}'`" >> $failName
    echo `ipcalc /${masc} | awk 'NR==1 {print $4}'` >> $failName
    echo "GATEWAY = `ip route | grep default | awk '{print $3}'`" >> $failName
    echo "RAM_TOTAL = $ramTotal GB" >> $failName
    echo "RAM_USED = $ramUsed GB" >> $failName
    echo "RAM_FREE = $freeMemory GB" >> $failName
    echo "SPACE_ROOT = $spaceRoot MB" >> $failName
    echo "SPACE_ROOT_USED = $spaceRootUsed MB" >> $failName
    echo "SPACE_ROOT_FREE = $spaceRootFree MB" >> $failName
fi

