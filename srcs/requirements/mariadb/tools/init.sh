#! /bin/bash

# dear god someone please tell me what is wrong with mariadb
service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
" > data.sql

cat data.sql

mariadb < data.sql

# kill off the started mariadb
service mariadb stop
 

mysqld_safe
# temp because what the fuck am i doing
# tail -f
