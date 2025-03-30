#!/bin/bash


if [[ -f README.md ]]; then
    if [[ -d src ]]; then
        rm -fr html 2>/dev/null
        jsdoc -d html -r --readme README.md --access all src
    fi
fi
