#!/bin/bash


echo "Publish and Update?"
read

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
( cd $PP/$PN && make upload )

sleep 5

exit 0

vpip uninstall -y $PN
vpip cache remove $PN
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
vpip install $PN==$A.$BB.$C
sleep 1
