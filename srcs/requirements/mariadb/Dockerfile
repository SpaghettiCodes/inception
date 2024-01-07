FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install mariadb-server mariadb-client -y

COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh 

COPY ./config/sql.cnf /etc/my.cnf
COPY ./config/maria.cnf /etc/mysql/mariadb.conf.d/50-server.cnf 

EXPOSE 3306

CMD ["./init.sh"]
