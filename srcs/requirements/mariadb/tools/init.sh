#! /bin/bash

# dear god someone please tell me what is wrong with mariadb
# service mariadb start

# 1. changes the root password
# 2. creates the wordpress database if it does not exist
# 3. creates a new user for the wordpress database

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
" > data.sql

mysql < data.sql

# kill off the started mariadb
# service mariadb stop

# activate the daemon verion of mariadb
mysqld_safe

# temp because what the fuck am i doing
# tail -f
