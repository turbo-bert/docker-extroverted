#!/bin/bash



. /py/bin/activate

export PYTHONPATH=/qrl/src


#we're already in /work whcih is PWD outside

set -x

if [[ -f text ]]; then
    cat text | python -m qrl text -
fi

if [[ -f wifi ]]; then
    cat wifi | python -m qrl wifi -
fi
