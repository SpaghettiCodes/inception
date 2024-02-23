#! /bin/bash

# creates directory structure and sets permissions
# mkdir -p /var/lib/gitea/{custom,data,indexers,public,log}
# chown git: /var/lib/gitea/{data,indexers,log}
# chmod 750 /var/lib/gitea/{data,indexers,log}
# mkdir /etc/gitea
# chown root:git /etc/gitea
# chmod 770 /etc/gitea

# replace database information

CONFIG_PATH=/usr/local/bin/custom/conf/app.ini

sed -i "s/database_name/$GITEA_DATABASE/g" $CONFIG_PATH
sed -i "s/database_username/$GITEA_DB_USER/g" $CONFIG_PATH
sed -i "s/database_userpass/$GITEA_DB_PASS/g" $CONFIG_PATH

if [ -f /repo/done_init.txt ]
then
	echo "Gitea admin user already added!"
else

gitea migrate
# make admin
gitea admin user create --username "$GITEA_ADMIN_USER" --password "$GITEA_ADMIN_PASS" --admin --email "$GITEA_ADMIN_EMAIL" --must-change-password=false

touch /repo/done_init.txt

fi

echo "Gitea Server Running now!"
exec gitea web 
