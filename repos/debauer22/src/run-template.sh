#!/bin/bash

cat /dev/null >P3
echo "testpaket" >NAME
echo "anon@github.com" >"MAIL"
echo "Anonymous" >"AUTHORNAME"
echo "1.0.0" >"VERSION"
echo "emacs-nox" >"DEPS"
(
cat <<EOF
Ein- oder mehrzeilige Beschreibung
des Paketinhalts.
EOF
)> DESC
mkdir filesystem
mkdir scripts

cat >scripts/postrm <<"EOF"
set -e

case "$1" in
  purge)
    echo "PURGE"

    # clean up python3 venv if existing
    if [ ! -z "$P3" ]; then
        if [ -d "$P3" ]; then
            rm -fr "$P3"
        fi
    fi

    ;;
esac

exit 0
EOF


cat >scripts/postinst <<"EOF"
set -e

case "$1" in
  configure|triggered)

    if [ ! -z "$P3" ]; then
        # python3 venv is requested, lets check if it's there already
        if [ ! -d "$P3" ]; then
            ( python3 -m venv $P3 )
        else
            echo "VENV already existing"
        fi
    fi

    # install requirements if existing
    if [ -f /usr/share/$NAME/requirements.txt ]; then
        ( $P3/bin/pip3 install -r /usr/share/$NAME/requirements.txt )
    fi

    # extract local deployment into python in existing
    SIPA=$(find "$P3" -name site-packages -type d | head -1)
    if [ -f /usr/share/$NAME/p3deploy.tar.gz ]; then
        ( cd $SIPA && tar xvfz /usr/share/$NAME/p3deploy.tar.gz )
    fi

    # extend postinst HERE with your custom code if you want

    ;;
esac
exit 0
EOF
