#!/bin/bash


docker run --rm -v $PWD:/work -it -p 8080:8080 `cat DTAG`
