#!/bin/bash


docker run --rm -it `cat DTAG` /bin/bash
#docker run --rm -v $PWD:/work -it `cat DTAG` /bin/bash