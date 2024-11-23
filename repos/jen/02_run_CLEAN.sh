#!/bin/bash



while true; do

    docker ps | grep jen
    EC=$?

    if [[ $EC = 0 ]]; then
        dk
        sleep 3
    else
        break
    fi

done



rm -fr jenkins_home

mkdir jenkins_home
