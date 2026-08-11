#!/bin/bash


source .proxy

docker buildx build  $PROXY_EXTRA  --platform linux/amd64 -t `cat DTAG` --no-cache --output type=docker,dest=export-amd64.tar .
