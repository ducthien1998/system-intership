#!/bin/bash

# Cập nhật và nâng cấp hệ thống
sudo apt update
sudo apt upgrade -y

# Cài đặt Apache HTTP Server
sudo apt install apache2 -y

# Khởi động Apache và cấu hình để tự động khởi động cùng hệ thống
sudo systemctl start apache2
sudo systemctl enable apache2

# Cấu hình tường lửa để cho phép truy cập HTTP qua cổng 80
sudo ufw allow 80/tcp

# Hiển thị thông báo cài đặt hoàn tất
echo "Cài đặt Apache HTTP Server hoàn tất"