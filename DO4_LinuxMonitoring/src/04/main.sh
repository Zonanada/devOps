#!/bin/bash
source gen.sh

for ((z=1; z < 6; z++))
    do
    nameLog="log$z.log"
    echo $nameLog

    record=$(( $RANDOM % 1000 + 100 ))
    day=$(genDay)
    everyRecordsec=$(( 36000 / $record ))
    startRecord=36000

    for ((i=0; i < $record; i++))
        do
        log="$(genIp) - - $(genDate "$startRecord") \"$(genMethod) $(genRequest)\" $(genAnswer) $(genByte) $(genUrl) $(genAgent)"
        echo $log >> $nameLog
        startRecord=$(($startRecord - $everyRecordsec))
        done
    
    done

# response codes
# 200 - OK
# 201 Created
# 400 Bad Request 
# 401 Unauthorized
# 403 Forbidden
# 404 Not Found
# 500 Internal Server Error (Внутренняя ошибка сервера)
# 501 Not Implemented
# 502 Bad Gateway
# 503 Service Unavailable
