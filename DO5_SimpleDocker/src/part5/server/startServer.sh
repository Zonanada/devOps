#!/bin/bash
spawn-fcgi -a 127.0.0.1 -p 8080 -n /home/server &
  
nginx -g "daemon off;" &
  
wait -n

exit $?