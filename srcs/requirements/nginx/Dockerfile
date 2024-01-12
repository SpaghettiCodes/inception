FROM debian:bookworm-slim

# install nginx and openssl
RUN apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y

# copy over the init.sh bash script and set execute permissions
COPY ./tools/init.sh ./init.sh
RUN chmod 755 init.sh

COPY ./config/nginx.conf /etc/nginx/nginx.conf

# make the private directory for ssl
RUN mkdir -p /etc/ssl/private
RUN chmod 700 /etc/ssl/private

EXPOSE 443

# set the cmd to run as init.sh
ENTRYPOINT ["./init.sh"]
