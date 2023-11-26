#!/bin/bash


# create a remote tmux session in detaxched mode with an initial command

H=he
N=sessname
D="~/src/firmware/pi-gen"

ssh $H "docker rm -v pigen_work"
ssh $H "tmux new-session -d -n $N"
ssh $H "tmux send-keys -l -t $N 'cd $D && ./build-docker.sh'"
ssh $H "tmux send-keys -t $N Enter"
