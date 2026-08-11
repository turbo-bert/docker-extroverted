#!/bin/bash


source .proxy

docker run     --platform linux/amd64              --rm -v $PWD/work:/work -it `cat DTAG` # /bin/bash
