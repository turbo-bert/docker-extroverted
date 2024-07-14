#!/bin/bash


docker run --rm -p 10514:10514 -it `cat DTAG` "$@"
