#! /bin/bash

# i wasted so much hours on this stupid mariadb
# i have given up on trying to fix my bash file
# thanks william and some random guy on the internet

# dear god someone please tell me what is wrong with mariadb
# /etc/init.d/mariadb start

# 1. changes the root password
# 2. creates the wordpress database if it does not exist
# 3. creates a new user for the wordpress databasei
# 4. change root password

echo "FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $WP_DATABASE;
CREATE DATABASE IF NOT EXISTS $GITEA_DATABASE CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
GRANT ALL PRIVILEGES ON $WP_DATABASE.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';
GRANT ALL PRIVILEGES ON $GITEA_DATABASE.* TO '$GITEA_DB_USER'@'%' IDENTIFIED BY '$GITEA_DB_PASS';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;" > init.sql

# so mariadb uses an older version of sql :P
# initialize the files needed in /var/lib/mysql
mysql_install_db

# run the command
# --bootstrap is mainly used by mysql_install_db to create MySQL privilege tables
# we dont care bout that, the important part is it does not start the MariaDB server
# and it also accepts sql commands
# this means we can run the pre-requisite commands in the above w/o starting the server
mysqld --user=mysql --bootstrap < init.sql
# kill off the started mariadb
#
# This did not work because somehow i need the password????
#
# i also need to close the mysql service to launch the mysqld???? so im like fucked???
#
# /etc/init.d/mariadb stop
# sudo killall mysqld

# echo 'launching mysqld'

# runs mariadb in the foreground
exec mysqld_safe --user=mysql
