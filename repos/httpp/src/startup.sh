#!/bin/bash



echo -en "\n\nAllow 0.0.0.0/0\n" >> /etc/tinyproxy/tinyproxy.conf
sed -Ei 's/^LogFile.*//g' /etc/tinyproxy/tinyproxy.conf

echo "http_proxy=127.0.0.1:8888 https_proxy=127.0.0.1:8888"

#/usr/bin/tinyproxy -d


. /venv/bin/activate
python3 -m turbofollow
