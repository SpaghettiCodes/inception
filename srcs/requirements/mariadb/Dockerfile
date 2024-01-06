FROM debian:bookworm-slim

COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh 

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server -y

COPY ./config/maria.cnf /etc/my.cnf

RUN mkdir /run/mysqld
RUN chmod 755 /run/mysqld/
RUN chown mysql:mysql /run/mysqld/

EXPOSE 3306

CMD ["./init.sh"]
