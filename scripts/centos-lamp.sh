#!/bin/bash

# run yum to update but exclude kernel updates
yum update -y --exclude=kernel

#tools
yum install -y nano git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

# Create html symlink to host
rm -rf /var/www/html
ln -s /vargrant /var/www/html

# start apache
service httpd start

# install php
yum install -y php php-cli php-common php-devel php-mysql

# install mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

#Download starter content


service httpd restart
