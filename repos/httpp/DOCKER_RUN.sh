#!/bin/bash



touch httpp.hosts

docker run --rm -v $PWD:/work -it -p 8888:8888 -v `pwd`/httpp.hosts:/work/httpp.hosts `cat DTAG`
