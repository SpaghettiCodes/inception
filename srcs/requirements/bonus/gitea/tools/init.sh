#! /bin/bash

# creates directory structure and sets permissions
mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
chown git: /var/lib/gitea/{data,indexers,log}
chmod 750 /var/lib/gitea/{data,indexers,log}
mkdir /etc/gitea
chown root:git /etc/gitea
chmod 770 /etc/gitea

exec tail -f
