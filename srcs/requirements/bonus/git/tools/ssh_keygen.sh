#! /bin/bash

# script to geenrate ssh key and slap it into the file
# not copied to the dockerfile, im just lazy

if [[ -f "$HOME/.ssh/id_rsa" ]]; then
	echo "Using preexisting key"
else
	echo "Generating SSH key at $HOME/.ssh/id_rsa"
	ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa"
fi

cat $HOME/.ssh/id_rsa.pub >> /home/cshi-xia/data/git/.ssh/authorized_keys

