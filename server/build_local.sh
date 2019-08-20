#!/bin/bash
if [ $1 == "all" ]; then
    for srv in `ls code`; do
        if [[ ${srv:0-4} == "-srv" ]]; then
            cd ./code/$srv/cmd/
            echo "开始编译$srv"
            CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build 
            cd ../../../
        fi
    done
else
    for srv in "$@"
    do
        if [[ "${srv:0-4}" != "-srv" ]]; then
            srv="${srv}-srv"
        fi
        cd ./code/$srv/cmd/
        echo "开始编译$srv"
        CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build 
        cd ../../../
    done
fi