FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install vsftpd -y

RUN mkdir -p /var/run/vsftpd/empty

# create the ssl directories
RUN mkdir -p /etc/ssl/certs
RUN mkdir -p /etc/ssl/private

COPY ./tools/init.sh ./init.sh
RUN chmod +x ./init.sh

COPY ./config/ftp.conf /etc/vsftpd.conf

EXPOSE 20
EXPOSE 21
EXPOSE 990
EXPOSE 40000-40025

ENTRYPOINT ["./init.sh"]
