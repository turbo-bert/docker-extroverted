# Sorted Chaos

Since I'm playing with docker - I created a mess I guess.

Do not expect anything to be perfect here - at all.

# Installation

What it does... it does create some shell wrapper scripts for each docker repo you find in the `repos` dir.


## Prereq

    DEBIAN_FRONTEND=noninteractive apt install -y git

## Get the current HEAD

    git clone https://github.com/turbo-bert/docker-extroverted.git

## Run the Installer

    ( cd docker-extroverted/repos && bash install_starters.sh )
