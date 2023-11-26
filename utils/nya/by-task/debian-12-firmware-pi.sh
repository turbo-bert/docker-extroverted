#!/bin/bash


H=he

set -x



HIP=$(ssh -q $H 'ip -4 a s dev docker0 | grep "inet " | awk "{print \$2}" | cut -d "/" -f 1')



ssh $H "DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y"
ssh $H "DEBIAN_FRONTEND=noninteractive apt install -y qemu-user-static squid build-essential git openssl tmux coreutils quilt parted qemu-user-static debootstrap zerofree zip dosfstools libarchive-tools libcap2-bin grep rsync xz-utils file git curl bc qemu-utils kpartx gpg pigz"
ssh $H "mkdir -p ~/src/firmware && cd ~/src/firmware && git clone https://github.com/RPi-Distro/pi-gen.git"

# patch squid config to store "big" files beneath /squid-cache
ssh $H "mkdir -p /squid-cache"
ssh $H "chown -R proxy: /squid-cache"
(
cat <<"EOF"
LS0tIHNxdWlkLmNvbmYub3JpZwkyMDIzLTExLTIzIDE3OjUzOjA0LjUxMDcxMjEwOCArMDAwMAor
Kysgc3F1aWQuY29uZgkyMDIzLTExLTIzIDE4OjE0OjEwLjY0ODkyNDkxOSArMDAwMApAQCAtMTUy
Miw2ICsxNTIyLDggQEAKICMgRGVueSwgdW5sZXNzIHJ1bGVzIGV4aXN0IGluIHNxdWlkLmNvbmYu
CiAjCiAKK2h0dHBfYWNjZXNzIGFsbG93IGFsbAorCiAjCiAjIFJlY29tbWVuZGVkIG1pbmltdW0g
QWNjZXNzIFBlcm1pc3Npb24gY29uZmlndXJhdGlvbjoKICMKQEAgLTM3MTIsNyArMzcxNCw3IEBA
CiAjCXRoaXMgdmFsdWUgdG8gbWF4aW1pemUgdGhlIGJ5dGUgaGl0IHJhdGUgaW1wcm92ZW1lbnQg
b2YgTEZVREEhCiAjCVNlZSBjYWNoZV9yZXBsYWNlbWVudF9wb2xpY3kgZm9yIGEgZGlzY3Vzc2lv
biBvZiB0aGlzIHBvbGljeS4KICNEZWZhdWx0OgotIyBtYXhpbXVtX29iamVjdF9zaXplIDQgTUIK
K21heGltdW1fb2JqZWN0X3NpemUgNTAwIE1CCiAKICMgIFRBRzogY2FjaGVfZGlyCiAjCUZvcm1h
dDoKQEAgLTM3NDIsNiArMzc0NCw3IEBACiAjCWJlZW4gdGhlcmUuCiAjCiAjCVVzYWdlOgorY2Fj
aGVfZGlyIHVmcyAvc3F1aWQtY2FjaGUgMjAwMDAgMTYgNjQKICMJCWNhY2hlX2RpciB1ZnMgRGly
ZWN0b3J5LU5hbWUgTWJ5dGVzIEwxIEwyIFtvcHRpb25zXQogIwogIwknTWJ5dGVzJyBpcyB0aGUg
YW1vdW50IG9mIGRpc2sgc3BhY2UgKE1CKSB0byB1c2UgdW5kZXIgdGhpcwo=
EOF
) | ssh $H "base64 -d >/tmp/patch-squid-conf"
ssh $H "cd /etc/squid && patch </tmp/patch-squid-conf"

ssh $H "systemctl restart squid"

(
#APT_PROXY=http://$HIP:3128
cat <<EOF
IMG_NAME=firmewareX
PUBKEY_SSH_FIRST_USER="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIc1qH9jV1y8fp+AFiIMV4CpZPKkfhA5i4nPD2DTlH5n"
STAGE_LIST="stage0 stage1 stage2"
PUBKEY_ONLY_SSH=1
LOCALE_DEFAULT=en_US.UTF-8
TARGET_HOSTNAME=firmwareX
KEYBOARD_KEYMAP=de
FIRST_USER_PASS=foo123_
FIRST_USER_NAME=userx
DISABLE_FIRST_BOOT_USER_RENAME=1
TIMEZONE_DEFAULT=Etc/UTC
DEPLOY_COMPRESSION=none
ENABLE_SSH=1
EOF
) | ssh $H "cd ~/src/firmware/pi-gen && cat >config"

#ssh $H ""
#ssh $H ""
#ssh $H ""

