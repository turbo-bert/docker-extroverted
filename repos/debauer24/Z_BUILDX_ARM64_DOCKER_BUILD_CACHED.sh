#!/bin/bash


source .proxy

docker buildx build  $PROXY_EXTRA  --platform linux/arm64 -t `cat DTAG` .
