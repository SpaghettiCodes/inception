FROM debian:bookworm-slim

COPY ./tools/init.sh ./init.sh
RUN chmod 755 ./init.sh

RUN apt update && apt upgrade
RUN apt install nano wget unzip -y
RUN apt install php-fpm # if i need more then i add here :P

CMD ["./init.sh"]
