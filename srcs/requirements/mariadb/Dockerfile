FROM debian:bookworm-slim

COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh 

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

EXPOSE 3306

CMD ["./init.sh"]
