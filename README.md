# Sorted Chaos

Since I'm playing with docker - I created a mess I guess.

Do not expect anything to be perfect here - at all.

# Overview

## Containers

| Name of container | Purpose                                                          |
| ----------------- | ---------------------------------------------------------------- |
| `costa`           | a quick `composer` wrapper for downloading `php` libraries |

## Helper Bash Scripts

| Name of script | Purpose                                                          |
| ----------------- | ---------------------------------------------------------------- |
| `osd`               | one-shot-docker |
| `ds`               | a quick `dialog` based terminal to conatiner shells |

# Installation

What it does... it does create some shell wrapper scripts for each docker repo you find in the `repos` dir. __In addition__: it installs two binaries called `osd` (one shot docker commands) and `ds` (docker shell) which I find useful.

__Note__: Always run the `install_starters.sh` from its own origin directory of the fully checked out repository to make the relative paths work.

## Prereq

    DEBIAN_FRONTEND=noninteractive apt install -y git

## Get the current HEAD

    git clone https://github.com/turbo-bert/docker-extroverted.git

## Run the Installer

    ( cd docker-extroverted/repos && bash install_starters.sh )
