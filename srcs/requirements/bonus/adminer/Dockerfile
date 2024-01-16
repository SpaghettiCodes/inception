FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install php php-fpm php-mysql -y

COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh

RUN mkdir -p /run/php

RUN mkdir -p /var/www/html/adminer

COPY ./config/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["./init.sh"]
