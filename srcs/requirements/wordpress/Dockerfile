FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade
RUN apt-get install nano wget unzip -y
RUN apt-get install php php-fpm php-mysql -y # if i need more then i add here :P

COPY ./tools/init.sh ./init.sh
RUN chmod 755 ./init.sh

# copy config
# COPY ./config/wp-config.php /var/www/html/wordpress/wp-config.php
COPY ./config/www.conf /etc/php/8.2/fpm/pool.d/www.conf 

ENTRYPOINT ["./init.sh"]
