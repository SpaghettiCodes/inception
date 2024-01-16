#! /bin/bash

if [ -f /var/www/html/adminer/adminer.php ]; then
	echo "Adminer already installed"
else
	wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php

	chown -R www-data:www-data /var/www/html/adminer/adminer.php
	chmod 755 /var/www/html/adminer/adminer.php
fi

# echo 'Adminer is installed and ready!'
echo 'Adminer server is up!'
exec php-fpm7.4 -F -R
