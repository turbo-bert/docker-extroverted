#!/bin/bash


echo "Publish and Update?"
read

PN=dcx
PP="../../$PN.pypi"

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
( cd $PP/$PN && make upload )

vpip uninstall -y $PN
vpip cache remove $PN
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
