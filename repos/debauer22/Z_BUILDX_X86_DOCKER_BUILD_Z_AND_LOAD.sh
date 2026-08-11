#!/bin/bash


source .proxy
PROXY_EXTRA="--no-cache $PROXY_EXTRA"

docker buildx build $PROXY_EXTRA  --platform linux/amd64 --load -t `cat DTAG` .
