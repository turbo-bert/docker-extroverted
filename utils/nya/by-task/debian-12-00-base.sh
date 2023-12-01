#!/bin/bash



H=he
FIP4="89.204.137.78"
FIP6="2a02:3031:208:dbe5::/64"


set -x


while true; do
ssh $H "exit 0"
ec=$?
echo $ec
if [[ $ec = 0 ]]; then
    echo "okay, breaking"
    break
fi
sleep 5
done


set -x
ssh $H "DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y && apt install -y tmux emacs-nox mc ufw build-essential htop iotop iptraf curl wget openssl gnupg"

if [[ ! -z $OI ]]; then
    echo "exiting, running ONLY INSTALL mode"
    exit 0
fi

ssh $H "echo y | ufw enable; ufw allow from $FIP4 proto tcp to any port 22; ufw allow from $FIP6 proto tcp to any port 22"
ssh $H "systemctl enable ufw"
ssh $H "echo $H >/etc/hostname"
ssh $H "reboot"

sleep 60
