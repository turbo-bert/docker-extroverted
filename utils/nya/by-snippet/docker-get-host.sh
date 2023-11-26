#!/bin/bash


# logss in via ssh and gets the IP4 address of the docker0 netif

H=he


A=$(ssh -q $H 'ip -4 a s dev docker0 | grep "inet " | awk "{print \$2}" | cut -d "/" -f 1')

echo "___ $A ___"
