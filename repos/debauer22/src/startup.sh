#!/bin/bash



if [[ -f NEW ]]; then
    bash /run-template.sh
    rm -f /work/NEW
    exit 0
fi


PARTS="AUTHORNAME DEPS DESC MAIL NAME VERSION P3"
SCRIPTPARTS="postrm postinst"
export V=$(head -1 /work/VERSION)
export B="/work/build/$(date +%s)-$V"
mkdir -p $B

mkdir scripts
cp -a scripts $B
cp -a filesystem $B
for F in $PARTS; do
    cp -a $F $B

    if [[ ! $F = DESC ]]; then
        declare -x "$F=$(head -1 $F)"
    fi

done

export WORKDIR="$B/$NAME"
mkdir -p $WORKDIR

# inbuild
(
echo "will use $WORKDIR"
cd $WORKDIR
pwd

mkdir -p $WORKDIR/debian
mkdir -p $WORKDIR/usr/share/$NAME

#############################################################################################

cat >$WORKDIR/debian/changelog <<EOF
$NAME ($VERSION) unstable; urgency=medium

  * Initial release

 -- $AUTHORNAME <$MAIL>  $(date -R)
EOF

#############################################################################################

cat >$WORKDIR/debian/control <<EOF
Source: $NAME
Section: misc
Priority: optional
Maintainer: $MAIL
Build-Depends: debhelper-compat (= 13)
Standards-Version: 4.7.0
Rules-Requires-Root: no

Package: $NAME
Architecture: all
Depends: $DEPS
Recommends:
Description:
$(cat /work/DESC | sed 's/^/  /')
EOF

#############################################################################################

cat >$WORKDIR/debian/rules <<EOF
#!/usr/bin/make -f
export DH_VERBOSE=1
%:
$(printf '\t')dh \$@
EOF
chmod +x "$WORKDIR/debian/rules"

#############################################################################################

for SCRIPTPART in $SCRIPTPARTS; do
    if [[ -f $B/scripts/$SCRIPTPART ]]; then
        (
            cat <<EOF
#!/bin/bash


# settings
EOF
            for F in $PARTS; do
                if [[ $F = DESC ]]; then
                    continue
                fi
                echo "export $F=\"$(printenv $F)\""
            done

            echo ""


            if [[ $SCRIPTPART = postinst ]]; then
                echo "# POSTINST EXTENSIONS"
                echo "# POSTINST EXTENSIONS"
                echo "# POSTINST EXTENSIONS"
                echo "# POSTINST EXTENSIONS"
                echo ""
            fi


            cat $B/scripts/$SCRIPTPART 
        ) > "$WORKDIR/debian/$SCRIPTPART"
        chmod a+x "$WORKDIR/debian/$SCRIPTPART"
    fi
done

#############################################################################################

cat > "$WORKDIR/debian/install" <<EOF
EOF

for X in $( cd $B/filesystem && find . -type f ); do
    X=$(echo $X | sed 's|^\./||')
    XN=$(echo $X | sed "s/____NAME____/$NAME/g")
    XB=$(basename "$X")
    XX=$(dirname $X | sed "s/____NAME____/$NAME/g")
    ( cd $WORKDIR && mkdir -p $XX )
    set -x
    cp -a "../filesystem/$X" "$XX/"
    set +x
    echo "$XN $XX/" >>"$WORKDIR/debian/install"
done

## for X in $( cd $B/filesystem && find . -type f ); do
##     X=$(echo $X | sed 's|^\./||')
##     XX=$(dirname $X | sed "s/____NAME____/$NAME/g")
##     echo "../filesystem/$X $XX/" >>"$WORKDIR/debian/install"
## done

#debian/vp usr/bin/
#debian/vpip usr/bin/
#usr/share/$PKG/requirements.txt usr/share/$PKG/

#### #############################################################################################

#### cat > "$WORKDIR/debian/postrm" <<EOF
#### #!/bin/sh
#### set -e
#### 
#### #VENV_DIR="$VENV_TARGET"
#### 
#### case "\$1" in
####   purge)
####     echo "PURGE"
####     #rm -rf "\$VENV_DIR"
####     ;;
#### esac
#### 
#### exit 0
#### EOF
#### chmod 755 "$WORKDIR/debian/postrm"
#### 
#### #############################################################################################
#### 
#### cat > "$WORKDIR/debian/postinst" <<EOF
#### #!/bin/sh
#### set -e
#### #VENV_DIR="$VENV_TARGET"
#### #REQ_FILE="/usr/share/$PKG/requirements.txt"
#### #PY_BIN="/usr/bin/python3"
#### #log() { echo "python3-venv-myenv: \$*"; }
#### 
#### case "\$1" in
####   configure|triggered)
####     ;;
#### esac
#### exit 0
#### EOF
#### chmod 755 "$WORKDIR/debian/postinst"
#### 
#### #############################################################################################

( cd $WORKDIR && debuild -us -uc )

)
# inbuild leave

cp -v $B/*.deb .
