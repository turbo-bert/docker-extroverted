#!/bin/bash


source .proxy

docker run                   --rm                -it `cat DTAG` /bin/bash
