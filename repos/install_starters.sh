#!/bin/bash


TARGETDIR=${1:-~/bin}

if [[ ! -d $TARGETDIR ]]; then
    TARGETDIR="/usr/local/bin"
fi

echo -en "If you want to install wrappers in $TARGETDIR, press ENTER to continue or CTRL-C to abort"
read

set -x
for A in costa costa74 lit mutter poc qrl dro parts2 puml dcx bk; do
    echo "=========================================="
    cp -f $A/$A $TARGETDIR/$A # short
    cp -f $A/$A $TARGETDIR/turbobert-$A # with turbobert-prefix
done


cp -f ../utils/ds/ds $TARGETDIR/ds
cp -f ../utils/osd/osd $TARGETDIR/osd
cp -f ../utils/osc/osc $TARGETDIR/osc
cp -f ../utils/defi/defi $TARGETDIR/defi
cp -f ../utils/otable/otable $TARGETDIR/otable
