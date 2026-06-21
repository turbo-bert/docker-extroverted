#!/bin/bash


source .proxy

#docker run                   --rm -v $PWD/work:/work -it `cat DTAG` /dcx --help | less -S
#docker run                   --rm -v $PWD/work:/work -it `cat DTAG` /dcx --remote-host host.docker.internal --remote-port 44444 --remote-firefox --no-hub
docker run                   --rm -v $PWD/work:/work -it `cat DTAG`

