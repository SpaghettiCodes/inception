FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git wget -y
RUN wget -O /tmp/gitea https://dl.gitea.io/gitea/1.15.3/gitea-1.15.3-linux-amd64

RUN adduser --system --group --disabled-password --shell /bin/bash --home /home/git --gecos 'Git Version Control' git

RUN mv /tmp/gitea /usr/local/bin
RUN chmod +x /usr/local/bin/gitea

COPY ./tools/init.sh ./init.sh
RUN chmod +x ./init.sh

COPY ./conf/gitea.conf /usr/local/bin/custom/conf/app.ini

RUN mkdir -p ./log

ENTRYPOINT ["./init.sh"]
