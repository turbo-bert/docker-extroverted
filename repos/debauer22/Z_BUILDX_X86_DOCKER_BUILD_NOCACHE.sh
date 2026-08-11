#!/bin/bash


source .proxy

docker buildx build  $PROXY_EXTRA  --platform linux/amd64 --no-cache -t `cat DTAG` .
