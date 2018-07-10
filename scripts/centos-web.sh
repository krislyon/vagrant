#!/bin/sh

#Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

# Create html symlink to host
rm -rf /var/www/html
ln -s /vagrant /var/www/html

# start apache
service httpd start

# install php
yum install -y php php-cli php-common php-devel php-mysql

#Download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/krislyon/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/krislyon/vagrant/master/files/info.php

service httpd restart
