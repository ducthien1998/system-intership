#!/bin/bash
# Cai dat apache2
sudo apt update -y
sudo apt install apache2
sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service

# Cai dat MariaDB
sudo apt install mariadb-server mariadb-client -y
sudo systemctl stop mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

## Cai dat lai mat khau va quyen root
mysql_secure_installation <<SECURESQL
y
vnpt1
vnpt1
y
n
y
y
SECURESQL

## Tao database va user

mysql -u root -pvnpt1<<SECURESQL
create database wordpress;
create user 'bdt18'@'localhost' identified by 'vnpt1';
GRANT ALL PRIVILEGES ON wordpress.* TO 'bdt18'@'localhost';
flush privileges;
exit
SECURESQL
echo "Hoan thanh tao databases va user"

# Cai dat PHP
sudo apt install php libapache2-mod-php -y
sudo apt install php-cli -y
sudo apt install php-cgi -y
sudo apt install php-mysql -y
sudo apt install php-pgsql -y
cd /var/www/html/
touch info.php
echo "<?php phpinfo(); ?>" | sudo tee -a /var/www/html/info.php
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/wordpress.conf
# thay đổi thông tin `html` sang `wordpress``
sudo sed -i "s/html/wordpress/g" /etc/apache2/sites-available/wordpress.conf
# Thêm thông tin `ServerName localhost`` dưới dòng `DocumentRoot \/var\/www\/wordpress`
sudo sed -i '/DocumentRoot \/var\/www\/wordpress/a \   ServerName localhost ' /etc/apache2/sites-available/000-default.conf
sudo a2ensite wordpress.conf
sudo a2dissite 000-default.conf
echo "Hoàn tất quá trình cài đặt php"

# Cai dat wordpress

cd /var/www/html
wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
sudo chown -R www-data:www-data /var/www/wordpress/
sudo chmod -R 755 /var/www/wordpress/



## Sua ten database trong file cau hinh wp-config.php
sudo sed -i "s/database_name_here/wordpress/g" /var/www/wordpress/wp-config.php

## Sua ten user vào trong file cau hinh wp-config.php
sudo sed -i "s/username_here/bdt18/g" /var/www/wordpress/wp-config.php

## Sua mat khau user vào trong file cau hinh wp-config.php
sudo sed -i "s/password_here/vnpt1/g" /var/www/wordpress/wp-config.php


sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo systemctl restart apache2.service
