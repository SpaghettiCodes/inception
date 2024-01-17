#! /bin/bash

# script to geenrate ssh key and slap it into the file
# not copied to the dockerfile, im just lazy

mkdir -p ./keys

ssh-keygen -t rsa -N "" -f "./keys/.shh"
cat ./keys/.shh.pub >> /home/cshi-xia/data/git/.ssh/authorized_keys

