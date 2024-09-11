#!/bin/bash



if [[ ! -f FROM ]]; then
    echo "No mail data found in CWD"
    echo "To test, you could:"
    echo ""
    cat <<EOF
echo "me@localhost" >FROM
echo "notme@localhost" >TO
echo "not so urgent but handy" >SUBJECT
echo "host.docker.internal" >HOST
echo "25000" >PORT
mkdir attachments
uptime >attachments/uptime.txt
ls -lsah >attachments/annaand.txt
echo "Another message for you." >BODY
echo "Best regards" >>BODY
EOF
    echo ""
    echo "And the re-run this container."
    exit 1
fi

MRC=/root/.muttrc

cat /dev/null >$MRC

echo "my_hdr \"From: $(cat FROM)\"" >>$MRC
echo "set from=\"$(cat FROM)\"" >>$MRC
echo "set ssl_force_tls=no" >>$MRC
echo "set ssl_starttls=no" >>$MRC
echo "set smtp_url=\"smtp://$(cat HOST):$(cat PORT)\"" >>$MRC


#cat $MRC

cat BODY | mutt -s "$(cat SUBJECT)" "$(cat TO)"
