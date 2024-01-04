FROM debian:bookworm-slim

COPY ./tools/init.sh ./init.sh
RUN chmod 755 ./init.sh

RUN apt-get update && apt-get upgrade
RUN apt-get install nano wget unzip -y
RUN apt-get install php-fpm -y # if i need more then i add here :P

CMD ["./init.sh"]
