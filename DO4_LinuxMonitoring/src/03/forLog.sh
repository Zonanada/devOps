#!/bin/bash


rmForLog() {
    
    echo example: "../02/fileLog.log"
    read logFile

    if [ -f "$logFile" ]; then

        while IFS= read -r line
        do  
            if [[ ${line:0:1} == "/" ]]; then
                sudo rm -fr $line
                echo "rm -fr $line"
            fi
            # sudo rm -fr $line
        done < $logFile
        echo finish
    else 
    echo incorrect input
    fi
}
