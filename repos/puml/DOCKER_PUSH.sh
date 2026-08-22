#!/bin/bash


source .proxy

docker push   $PROXY_EXTRA  `cat DTAG`
