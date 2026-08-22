#!/bin/bash


source .proxy

docker build  $PROXY_EXTRA  --no-cache -t `cat DTAG` .
