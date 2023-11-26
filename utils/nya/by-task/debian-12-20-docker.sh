#!/bin/bash


H=he

set -x

ssh $H "DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y"

#echo -en "purge incompat packages? CTRL-C to abort"
#read

ssh $H "DEBIAN_FRONTEND=noninteractive apt purge -y docker.io docker-doc docker-compose podman-docker containerd runc"

ssh $H "DEBIAN_FRONTEND=noninteractive apt install -y ca-certificates curl gnupg"
ssh $H "install -m 0755 -d /etc/apt/keyrings"
ssh $H "curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg"
ssh $H "chmod a+r /etc/apt/keyrings/docker.gpg"
ssh $H 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo $VERSION_CODENAME) stable" | tee /etc/apt/sources.list.d/docker.list'
ssh $H "DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y"

ssh $H "DEBIAN_FRONTEND=noninteractive apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
