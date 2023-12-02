#!/bin/bash


H=he

set -x

ssh $H "DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y"
