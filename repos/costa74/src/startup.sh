#!/bin/bash


set -x

if [[ -f composer.json ]]; then
    composer install
else
    if [[ -f composer.lock ]]; then
        composer install
    fi
fi
