#!/bin/bash


docker run -d --rm -p 10514:10514 -it `cat DTAG` "$@"
