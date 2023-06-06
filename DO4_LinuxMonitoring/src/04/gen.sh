#!/bin/bash
# 127.0.0.1 - [17/Sep/2021:13:51:42 -0400] "GET /invoke/pub.math/randomDouble" 200 136 https://mycompany.com/test/webapp/page "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36"
# date "+[%d/%b/%Y/%H:%M:%S %z]"



genIp() {
    for ((i=0; i < 4; i++))
        do  
            ip="$ip$(( $RANDOM % 255 + 1 ))"
            if [ "$i" -lt "3" ]; then
                ip="$ip."
            fi
        done
    echo $ip
}

genAnswer() {
    response=(200 201 400 401 403 404 500 502 503)
    num=$(( $RANDOM % 9 + 0 ))
    echo ${response[num]}
}

genMethod() {
    methods=(GET POST PUT PATCH DELETE)
    num=$(( $RANDOM % 5 + 0 ))
    echo ${methods[num]}
}

genDay() {
    echo $(( $RANDOM % 29 + 1 ))
}

day=$(genDay)

genDate() {
    echo `date "+[$day/%b/%Y:%H:%M:%S %z]" --date '-'$1' sec'`
}

# plusSecondsDate() {
#     newDate=`echo "$1"` `--date '+$2 sec'`
#     echo $newDate
# }

genAgent() {
    agent=(
"Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0"
"Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0"
"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
"Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.2.15 Version/10.00"
"Opera/9.60 (Windows NT 6.0; U; en) Presto/2.1.1"
"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36 OPR/38.0.2220.41"
"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 Edg/91.0.864.59"
"Mozilla/5.0 (iPhone; CPU iPhone OS 13_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Mobile/15E148 Safari/604.1"
"Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)"
"Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
"Mozilla/5.0 (compatible; YandexAccessibilityBot/3.0; +http://yandex.com/bots)"
"curl/7.64.1"
"PostmanRuntime/7.26.5")
    echo ${agent[$(( $RANDOM % 12 + 0 ))]}
}

genWords() {
    words=(script inside correct program simply first problem assignment broken blank shell starts interpreting remaining symbols ways intend could partially fixed changing quotation)
    echo ${words[$(( $RANDOM % 21 + 0 ))]}
}

genRequest() {
    for ((i=0; i < 3; i++))
    do
    url="$url/$(genWords)"
    done

    echo $url
}

genUrl() {
    url="https://$(genWords).com"
    for ((i=0; i < 3; i++))
    do
    url="$url/$(genWords)"
    done
    echo $url
}

genByte() {
    echo $(( $RANDOM % 500 + 0 ))
}


# generateIp
# genAnswer
# genMethod
# genAgent
# genUrl
# genRequest
# genDate "600"
# plusSecondsDate "$(genDate)" "600"
