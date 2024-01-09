#! bin/bash

if [ -d /var/www/html/wordpress ]
then
	echo "Wordpress already installed"
else
	# TODO: fix this
	# this will not work as this leads to the GUI installation page
	# u r suppose to install it in this script

	# get Wordpress
	# turn off wget output because its noisy as shit
	# wget -q https://wordpress.org/latest.zip
	# extract contents of Wordpress
	# unzip latest.zip -d /var/www/html
	# change the permission of the website directory
	# chown -R www-data:www-data /var/www/html/wordpress/

	mkdir -p /var/www/html/wordpress

	echo 'Getting Wordpress ...'
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	# mv wp-cli.phar /usr/local/bin/wp

	echo 'Downloading Wordpress Files ...'
	./wp-cli.phar core download --path=/var/www/html/wordpress --allow-root
	echo 'Setting Configuration File ...'
	./wp-cli.phar core config \
		--path=/var/www/html/wordpress \
		--dbhost=$DB_HOSTNAME \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--allow-root

	echo 'Initializing Wordpress...'
	./wp-cli.phar core install \
		--path=/var/www/html/wordpress \
		--url=$WP_URL \
		--title="$WP_TITLE" \
		--admin_name=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASS \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	chmod 777 /var/www/html/wordpress/*
	# chmod 644 /var/www/html/wordpress/wp-config.php

	./wp-cli.phar user create \
		--path=/var/www/html/wordpress \
		$WP_USR_LOGIN \
		$WP_USR_EMAIL \
		--user_pass=$WP_USR_PASS \
		--allow-root
fi

# i love nuking old codes

# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

# time to change the wp-config.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
# sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php
# sed -i "s/localhost/$DB_HOSTNAME/g" /var/www/html/wordpress/wp-config.php

# run the php-fpm cgi for nginx to connect and communicate with 
# -F -> force the php-fpm to stay at the foreground, and ignore daemonize option from config file
# basically, causes ur program to hang (good, fantastic)
#
# -R -> allow running as root

php-fpm8.2 -F -R

