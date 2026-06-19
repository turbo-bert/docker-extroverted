#!/bin/bash


source .proxy

docker run                   --rm -v $PWD:/work -it `cat DTAG` /bin/bash
