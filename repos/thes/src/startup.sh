#!/bin/bash


#. /venv/bin/activate

#python -m PYMOD -u
#python -m PYMOD


for X in $(ls *.de.txt); do
    cat $X | aspell -l de pipe >$X.thes
done


echo -en "done, press RETURN to continue..."
read
#cd /app && python -u -m YOUR_MODULE
