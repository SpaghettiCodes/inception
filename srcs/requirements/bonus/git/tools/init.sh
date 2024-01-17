#! /bin/bash

# add a new git user
sudo -u git ./git_init.sh

# create git repo
# cd
# mkdir .ssh
# chmod 700 .ssh
# touch .ssh/authorized_keys
# chmod 600 .ssh/authorized_keys

# mkdir personal_repo.git
# git init --bare personal_repo.git

# assume root

# launch ssh server
echo 'SSH for Git Launched'

exec /usr/sbin/sshd -D
# exec sshd -D
