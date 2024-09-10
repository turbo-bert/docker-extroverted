#!/bin/bash


#. /venv/bin/activate

#python -m PYMOD -u
#python -m PYMOD

#echo "startup.sh not customized yet!"
#read
#cd /app && python -u -m YOUR_MODULE


if [[ $1 = enc ]]; then
    echo "ENCRYPT $1 - $2 - $3"
    #$2=pass
    #$3=./target

    # default pkzip
    rm -f "$3.zip"
    zip -r -e -P "$2" "$3.zip" "$3"
    
    exit 0
fi


find . -mindepth 1 -maxdepth 1 -type d -print0 | xargs -r0n1 $0 enc "$ZZZ_PASS"
