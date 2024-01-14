#! /bin/bash

# creating user
echo "Creating FTP User ..."
adduser "$FTP_USR_LOGIN"
usermod -a -G www-data "$FTP_USR_LOGIN"
echo "$FTP_USR_LOGIN:$FTP_USR_PASS" | chpasswd
echo "Created"

echo "FTP Server is now running"
exec vsftpd

# tail -f
