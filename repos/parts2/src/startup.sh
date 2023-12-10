#!/bin/bash


#export OPENSCADPATH="$OPENSCADPATH:/parts2lib"

ln -s /parts2lib/parts

. /venv/bin/activate

python -m parts2

rm -f parts
