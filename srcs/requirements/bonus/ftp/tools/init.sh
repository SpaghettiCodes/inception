#! /bin/bash

ssldir=/etc/ssl/certs/ssl-cert-snakeoil.pem
keydir=/etc/ssl/private/ssl-cert-snakeoil.key

# oh boy its time to create a ssl certificate againnn
echo "Creating a SSL Certificate"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "$keydir" -out "$ssldir" -subj"/C=$country/ST=$state/L=$city/O=$org/OU=$position/CN=$domain_name" 2> /dev/null
echo "Created!"

# creating user
echo "Creating FTP User ..."
useradd -m "$FTP_USR_LOGIN"
usermod -a -G www-data "$FTP_USR_LOGIN"
echo "$FTP_USR_LOGIN:$FTP_USR_PASS" | chpasswd
echo "Created!"

echo "FTP Server is now running"
exec vsftpd

