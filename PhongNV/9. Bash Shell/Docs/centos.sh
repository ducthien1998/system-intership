#!/bin/bash
# Cài đặt Apache
yum install httpd -y


## Kích hoạt dịch vụ httpd
systemctl enable httpd

## Bật dịch vụ httpd
systemctl status httpd

## Khởi động dịch vụ httpd
systemctl start httpd

##  Kiểm tra xem Firewall có chặn kết nối đến Apache không
firewall-cmd --list-all | grep http

## Cấu hình tường lửa để cho phép truy cập HTTP qua cổng 80
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

## Hiển thị thông báo cài đặt hoàn tất
echo "Cài đặt Apache HTTP Server hoàn tất"

# Cài đặt Mariadb
yum install mariadb-server

## Bật dịch vụ Mariadb
systemctl enable mariadb
systemctl start mariadb

## Kiểm tra dịch vụ Mariadb
systemctl status mariadb

## Tạo database sử dụng cho wordpress
mysql -u root -p -e "CREATE DATABASE phongnv;"

## Tạo user sử dụng cho wordpress
mysql -u root -p -e "CREATE USER 'phongnv07'@'localhost' IDENTIFIED BY '123';"

## Cấp quền cho database
mysql -u root -p -e "GRANT ALL PRIVILEGES ON phongnv.* TO 'phongnv07'@'localhost';"
mysql -u root -p -e "FLUSH PRIVILEGES;"

## Hiển thị thông báo cài đặt Mariadb hoàn tất

echo "Cài đặt Mariadb hoàn tất"


# Cài đặt wordpress

## Cài đặt công cụ download wget
yum install wget -y

## Thay đổi thư mục hiện tại thành thư mục web
cd /var/www/html

## Tải xuống tệp WordPress mới nhất bằng cách chạy lệnh sau
wget https://wordpress.org/latest.tar.gz

## Giải nén tệp WordPress trong thư mục hiện tại:
tar xvzf latest.tar.gz

## Di chuyển các tệp từ thư mục wordpress vào thư mục web:
mv /var/www/html/wordpress/* /var/www/html

## Thay đổi tệp cấu hình WordPress bằng cơ sở dữ liệu đã tạo.
mv wp-config-sample.php wp-config.php

## Sửa tên database trong file cấu hình wp-config.php
sudo sed -i "s/database_name_here/phongnv/g" /var/www/html/wp-config.php

## Sửa tên user vào trong file cấu hình wp-config.php
sudo sed -i "s/username_here/phongnv07/g" /var/www/html/wp-config.php

## sửa mật khẩu user vào trong file cấu hình wp-config.php
sudo sed -i "s/password_here/123/g" /var/www/html/wp-config.php

## Hiện thị thông tin cài đặt wordpress hoàn tất
echo "Hoàn tất cấu hình wordpress"
# Cài đặt PHP
## Thêm kho lưu trữ EPEL và REMI
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php74


## Cập nhật hệ thống
sudo yum update

## Cài đặt PHP
sudo yum install php php-cli
yum install php php-mysql


## Thêm thông tin vào file cấu hình /var/www/html/info.php
echo "<?php phpinfo(); ?>" | sudo tee -a /var/www/html/info.php

## Hiện thị thông báo cài đặt wordpress hoàn tất 
echo "Hoàn tất quá trình cài đặt wordpress"