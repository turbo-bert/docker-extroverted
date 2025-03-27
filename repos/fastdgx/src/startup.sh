#!/bin/bash


if [[ -d /work/html ]]; then
    rm -fr /work/html
fi
rm -fr /work/latex


if [[ -f gen ]]; then
    doxygen gen
else
    cat /gen >gen
    mkdir src 2>/dev/null
    echo "No gen file found created one."
fi


echo DONE
