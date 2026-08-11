#!/bin/bash



for X in 22 24 26; do
    cat master/run-template.sh > /Users/robertdegen/src/github/docker-extroverted/repos/debauer$X/src/run-template.sh
    cat master/startup.sh > /Users/robertdegen/src/github/docker-extroverted/repos/debauer$X/src/startup.sh
done
