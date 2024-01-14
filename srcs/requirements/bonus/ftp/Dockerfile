FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install vsftpd -y

COPY ./tools/init.sh ./init.sh
RUN chmod +x ./init.sh

COPY ./config/ftp.conf /etc/vsftpd.conf

ENTRYPOINT ["./init.sh"]
