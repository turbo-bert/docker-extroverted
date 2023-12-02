#!/bin/bash


TARGETDIR=${1:-~/bin}

echo -en "If you want to install wrappers in $TARGETDIR, press ENTER to continue or CTRL-C to abort"
read

set -x
for A in costa lit mutter poc qrl; do
    echo "=========================================="
    cp -f $A/$A $TARGETDIR/$A # short
    cp -f $A/$A $TARGETDIR/turbobert-$A # with turbobert-prefix
done
