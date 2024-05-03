#!/bin/bash


docker run --rm -v $PWD/test:/work -it `cat DTAG` /bin/bash
