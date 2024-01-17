#! /bin/bash

cd

echo
ls -la
echo

if [[ -f ".ssh/authorized_keys" ]]; then
	echo "SSH File Exist"
else
	mkdir -p .ssh
	chmod 700 .ssh
	touch .ssh/authorized_keys
	chmod 600 .ssh/authorized_keys
fi

if [[ -d "personal_repo.git" && -f "personal_repo.git/HEAD" ]]; then
	echo "Git Repo Already Instantiated"
else
	git init --bare personal_repo.git
fi
