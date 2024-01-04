FROM debian:bookworm-slim

COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh

RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install systemctl -y
CMD ["./init.sh"]

