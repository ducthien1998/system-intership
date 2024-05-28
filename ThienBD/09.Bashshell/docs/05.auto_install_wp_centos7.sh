#!/bin/bash
## Cập nhật hệ thống
sudo yum update -y
# Cai dat Apache
yum install httpd -y

## Kich hoat dich vu httpd
systemctl enable httpd

## Khoi dong dich vu httpd
systemctl start httpd

##  Kiem tra firewall co chan ket noi apache khong
firewall-cmd --list-all | grep http

## Cau hinh firewall cho phep http truy cap qua cong 80
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

echo "Cài đặt Apache HTTP Server hoàn tất"

# Cai dat Mariadb
yum install mariadb-server -y

## Bat dich vu Mariadb
systemctl enable mariadb
systemctl start mariadb

## Kiem tra dich vu Mariadb
systemctl status mariadb

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
echo "Hoan thanh cai lai mat khau va quyen root"
## Tao database va user

mysql -u root -pvnpt1<<SECURESQL
create database wordpress;
create user 'bdt18'@'localhost' identified by 'vnpt1';
GRANT ALL PRIVILEGES ON wordpress.* TO 'bdt18'@'localhost';
flush privileges;
exit
SECURESQL
echo "Hoan thanh tao databases va user"

## Cài đặt PHP
yum install -y epel-release yum-utils
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php73
yum install -y php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd
php -v
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
systemctl restart httpd
## Thêm thông tin vào file cấu hình /var/www/html/info.php
echo "<?php phpinfo(); ?>" > /var/www/html/info.php

## Hiện thị thông báo cài đặt wordpress hoàn tất 
echo "Hoàn tất quá trình cài đặt wordpress"

# Cai dat wordpress

## Cai dat cong cu download wget
yum install wget -y

## Thay doi thu muc hien tai thanh thu muc web
cd /var/www/html

## Tai xuong tep Wordpress moi nhat bang lenh sau
wget https://wordpress.org/latest.tar.gz

## Giai nen tep WordPress trong thu muc hien tai 
tar xvzf latest.tar.gz

## Di chuyen cac tep tu thu muc wordpress vao thu muc web:
mv /var/www/html/wordpress/* /var/www/html

## Thay doi tep cau hinh WordPress bang co so du lieu da tao
mv wp-config-sample.php wp-config.php

## Sua ten database trong file cau hinh wp-config.php
sudo sed -i "s/database_name_here/wordpress/g" /var/www/html/wp-config.php

## Sua ten user vào trong file cau hinh wp-config.php
sudo sed -i "s/username_here/bdt18/g" /var/www/html/wp-config.php

## Sua mat khau user vào trong file cau hinh wp-config.php
sudo sed -i "s/password_here/vnpt1/g" /var/www/html/wp-config.php

## Hiện thị thông tin cài đặt wordpress hoàn tất
echo "Hoàn tất cấu hình wordpress"


