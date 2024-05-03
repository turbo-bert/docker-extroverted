#!/bin/bash


#. /venv/bin/activate

#python -m PYMOD -u
#python -m PYMOD



set | grep CFAF
echo -en "#!/bin/bash\n\n\nssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /key root@$CFAF_IP\n" >/porter


tmux new-session -d -t BLA
tmux send-keys -t BLA "cat /porter" ENTER


bash


echo "$CFAF_ACTION startup.sh not customized yet!"
read
#cd /app && python -u -m YOUR_MODULE

#tmux new-window -t CRONFORCE
