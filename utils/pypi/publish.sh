#!/bin/bash


if [[ ! -f DEPLOY ]]; then
    echo "Publish and Update?"
    read
fi

PN=$(head -1 NAME)
PP="../../$PN.pypi"

if [[ ! -x $PP/$PN/src/run.sh ]]; then
    echo "$PP/$PN/src/run.sh missing - RETURN to create - CTRL-C to cancel"
    read
    cat >$PP/$PN/src/run.sh <<EOF
#!/bin/bash

rsync -avP --delete /Users/robertdegen/src/github/$PN/src/$PN .

EOF
    chmod a+x $PP/$PN/src/run.sh
    cat $PP/$PN/src/run.sh
    echo "Press RETURN"
    read
fi


( cd $PP/$PN/src && ./run.sh )
ls -al $PP/$PN

VERSION_LINE=$(cat $PP/$PN/pyproject.toml | grep "^version = ")
VERSION_STRING=$(echo -n "$VERSION_LINE" | cut -d '"' -f 2)
A=$(echo -n "$VERSION_STRING" | cut -d '.' -f 1)
B=$(echo -n "$VERSION_STRING" | cut -d '.' -f 2)
C=$(echo -n "$VERSION_STRING" | cut -d '.' -f 3)
#set | grep ^VERSION | less

((BB=B+1))
#echo "$A $B $C - $A $BB $C" | less
VERSION_LINE_NEW="version = \"$A.$BB.$C\""

gsed -Ei "s/^$VERSION_LINE$/$VERSION_LINE_NEW/g" $PP/$PN/pyproject.toml

( cd $PP/$PN/dist && rm -fr * )
( cd $PP/$PN && make setup )
( cd $PP/$PN && make )



deployment=$(gfind ../../$PN.pypi/$PN/dist -name "*.gz")
echo "************************************************************************* local deployment"
if [[ -f PIP ]]; then


    set -x
    $(head -1 PIP) uninstall -y $PN
    set +x


    if [[ ! -f DEPLOY ]]; then
        echo "deploy? $deployment or CTRL-C to abort"
        echo "*************************************************************************"
        read
    else
        echo "*************** DEPLOY OVERRIDE **********************************************************"
    fi

    set -x
    $(head -1 PIP) install $deployment
    set +x
fi
echo "*************************************************************************"


if [[ ! -f SKIP_UPLOAD ]]; then
    echo "*************************************************************************"
    echo "2x RETURN to upload to PyPI? or CTRL-C to abort"
    echo "*************************************************************************"
    read
    read
    ( cd $PP/$PN && make upload )
fi

if [[ -f POST.sh ]]; then
    bash POST.sh "$deployment" "../../$PN.pypi/$PN/dist"
fi

sleep 2

exit 0

vpip uninstall -y $PN
vpip cache remove $PN
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
