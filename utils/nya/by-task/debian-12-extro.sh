#!/bin/bash


H=he

set -x

ssh $H "DEBIAN_FRONTEND=noninteractive apt install -y git dialog"
ssh $H "git clone https://github.com/turbo-bert/docker-extroverted.git"
ssh $H "( cd docker-extroverted/repos && bash install_starters.sh )"
ssh $H "echo OSD_ENV_DTAG=turbobert/test >.osd_env"
