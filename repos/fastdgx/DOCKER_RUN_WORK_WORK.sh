#!/bin/bash


docker run --rm -v $PWD/work:/work -it `cat DTAG`
