#! bin/bash

if [ -d /var/www/html/wordpress ]
then
	echo "Wordpress already installed"
else
	# this will not work as this leads to the GUI installation page
	# u r suppose to install it in this script

	# get Wordpress
	# wget -q https://wordpress.org/latest.zip
	# extract contents of Wordpress
	# unzip latest.zip -d /var/www/html
	# change the permission of the website directory
	# chown -R www-data:www-data /var/www/html/wordpress/

	mkdir -p /var/www/html/wordpress

	echo 'Downloading Wordpress Files ...'
	./wp-cli.phar core download --path=/var/www/html/wordpress --allow-root
	echo 'Setting Configuration File ...'
	./wp-cli.phar core config \
		--path=/var/www/html/wordpress \
		--dbhost="$DB_HOSTNAME" \
		--dbname="$WP_DATABASE" \
		--dbuser="$WP_DB_USER" \
		--dbpass="$WP_DB_PASS" \
		--allow-root

	echo 'Adding Required Constants for Redir'
	./wp-cli.phar config set WP_REDIS_PREFIX	cshi-xia	--allow-root	--path=/var/www/html/wordpress 
	./wp-cli.phar config set WP_REDIS_HOST		redis		--allow-root	--path=/var/www/html/wordpress 
	./wp-cli.phar config set WP_REDIS_PORT		6379		--allow-root	--path=/var/www/html/wordpress 

	echo 'Initializing Wordpress...'
	./wp-cli.phar core install \
		--path=/var/www/html/wordpress \
		--url="$WP_URL" \
		--title="$WP_TITLE" \
		--admin_name="$WP_ADMIN_NAME" \
		--admin_password="$WP_ADMIN_PASS" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--allow-root

	echo 'Create a New User'
	./wp-cli.phar user create \
		--path=/var/www/html/wordpress \
		"$WP_USR_LOGIN" \
		"$WP_USR_EMAIL" \
		--user_pass="$WP_USR_PASS" \
		--allow-root

	echo 'Setting File Permissions'
	chmod -R 755 /var/www/html/wordpress
	chmod -R 644 /var/www/html/wordpress/index.php
	chmod -R 640 /var/www/html/wordpress/wp-config.php
	chown -R www-data:www-data /var/www/html/wordpress

	# setting up redis

	# install plugin
	 ./wp-cli.phar plugin install	\
	 	redis-cache	\
		--allow-root	\
		--path=/var/www/html/wordpress
			
	#  activate redis plugin
	 echo 'Activating redis ... '
	 ./wp-cli.phar plugin activate redis-cache \
		--allow-root \
		--path=/var/www/html/wordpress

	 ./wp-cli.phar redis enable \
		--allow-root \
		--path=/var/www/html/wordpress 
fi

# run the php-fpm cgi for nginx to connect and communicate with 
# -F -> force the php-fpm to stay at the foreground, and ignore daemonize option from config file
# basically, causes ur program to hang (good, fantastic)
#
# -R -> allow running as root

echo 'Wordpress Server is Ready!'
exec php-fpm7.4 -F -R


