#!/bin/bash




tmux new-session -d -t MUX
tmux send-keys -t MUX "rsyslogd -n" ENTER
#tmux new-window -t MUX
#tmux send-keys -t MUX "player_loop" ENTER

sleep 1
tail -f /var/log/syslog
read
