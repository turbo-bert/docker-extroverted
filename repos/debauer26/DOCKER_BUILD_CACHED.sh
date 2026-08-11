#!/bin/bash


source .proxy

docker build  $PROXY_EXTRA  -t `cat DTAG` .
