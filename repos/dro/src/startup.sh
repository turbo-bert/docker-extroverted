#!/bin/bash




export DBUS_SESSION_BUS_ADDRESS="$(dbus-daemon --system --print-address)"

sleep 1

F=$(ls -1 *.drawio | head -1)

if [[ -z $F ]]; then
    echo "No *.drawio files found in CWD"
    exit 1
fi


EXTS="pdf png"

for E in $EXTS; do
    mkdir full
    xvfb-run --server-args="-nolisten tcp -fbdir /var/run" /bin/bash -c "DRAWIO_DISABLE_UPDATE=true drawio $F --disable-gpu --headless -x -f $E -o full --no-sandbox"
    sleep 1
done

for E in $EXTS; do
    mkdir cropped
    xvfb-run --server-args="-nolisten tcp -fbdir /var/run" /bin/bash -c "DRAWIO_DISABLE_UPDATE=true drawio $F --disable-gpu --crop --headless -x -f $E -o cropped --no-sandbox"
    sleep 1
done
