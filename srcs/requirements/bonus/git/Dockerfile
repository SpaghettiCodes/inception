FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git sudo -y
RUN apt-get install openssh-server -y

COPY	./tools/init.sh ./init.sh
COPY	./tools/git_init.sh ./git_init.sh
RUN		useradd -m git

RUN chmod +x ./git_init.sh
RUN chmod +x ./init.sh
RUN mkdir -p /run/sshd

# ssh service for git
EXPOSE 22

ENTRYPOINT ["./init.sh"]
