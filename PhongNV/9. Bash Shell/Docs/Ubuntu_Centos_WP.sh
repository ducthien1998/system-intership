#!/bin/bash
password="123"
database="phongnv"
user="phongnv07"
# Kiểm tra xem script được chạy với quyền root hay không
if [[ $EUID -ne 0 ]]; then
    echo "Script này cần chạy với quyền root."
    exit 1
fi
# Tạo database và user trên MySQL / MariaDB
function create_database(){
    mysql -u root -p -e "CREATE DATABASE $database;"
    mysql -u root -p -e "CREATE USER '$user'@'localhost' IDENTIFIED BY '$password';"
    mysql -u root -p -e "GRANT ALL PRIVILEGES ON $database.* TO '$user'@'localhost';"
    mysql -u root -p -e "FLUSH PRIVILEGES;"
}
# Cài đặt các gói cần thiết trên Ubuntu
function install_packages_ubuntu(){
    apt-get update
    # Cài đặt apache2
    apt install apache2 -y
    systemctl enable apache2
    systemctl start apache2
    echo "Cài đặt Apache HTTP Server hoàn tất"
    # cài đặt mariadb
    apt install mariadb-server
    systemctl enable mariadb
    systemctl start mariadb
    echo "Cài đặt Mariadb hoàn tất"
    # cài đặt php
    sudo apt install php libapache2-mod-php
    sudo apt install php-cli
    sudo apt install php-cgi
    sudo apt install php-mysql
    sudo apt install php-pgsql
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

    # Tải và cài đặt WordPress
     cd /var/www/html
     wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
     sudo tar -xzvf /tmp/wordpress.tar.gz -C /var/www
     sudo chown -R www-data.www-data /var/www/wordpress
     # Cấu hình database
    sudo sed -i "s/database_name_here/$database/g" /var/www/html/wp-config.php
    sudo sed -i "s/username_here/$user/g" /var/www/html/wp-config.php
    sudo sed -i "s/password_here/$password/g" /var/www/html/wp-config.php
     systemctl restart apache2

     echo "Hoàn tất cấu hình wordpress"

}

# Cài đặt các gói cần thiết trên CentOS
function install_packages_centos(){

    # Cài đặt apache

    yum install httpd -y
    systemctl enable httpd
    systemctl start httpd

    firewall-cmd --list-all | grep http
    firewall-cmd --add-service=http --permanent
    firewall-cmd --reload
    # Cài đặt Mariadb
    yum install mariadb-server
    systemctl enable mariadb
    systemctl start mariadb
    echo "Cài đặt Mariadb hoàn tất"

    # Cài đặt wordpress

    yum install wget -y
    cd /var/www/html
    wget https://wordpress.org/latest.tar.gz
    tar xvzf latest.tar.gz
    mv /var/www/html/wordpress/* /var/www/html
    mv wp-config-sample.php wp-config.php
    # Cấu hình database
    sudo sed -i "s/database_name_here/$database/g" /var/www/html/wp-config.php
    sudo sed -i "s/username_here/$user/g" /var/www/html/wp-config.php
    sudo sed -i "s/password_here/$password/g" /var/www/html/wp-config.php
    echo "Hoàn tất cấu hình wordpress"
    # cài đặt php
    sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
    sudo yum -y install yum-utils
    sudo yum-config-manager --enable remi-php74
    sudo yum update
    sudo yum install php php-cli
    yum install php php-mysql
    echo "<?php phpinfo(); ?>" | sudo tee -a /var/www/html/info.php
    systemctl restart httpd
    echo "Hoàn tất quá trình cài đặt php"
    
}

# Chạy script cài đặt trên Ubuntu
function ubuntu_install() {
    install_packages_ubuntu
    create_database
}

# Chạy script cài đặt trên CentOS
function centos_install() {
    install_packages_centos
    create_database
}

# Kiểm tra phiên bản hệ điều hành và chạy script tương ứng
if [[ $(grep -oP '(?<=^ID=).+' /etc/os-release) == "ubuntu" ]]; then
    ubuntu_install
elif [[ $(grep -oP '(?<=^ID=).+' /etc/os-release) == "centos" ]]; then
    centos_install
else
    echo "Hệ điều hành không được hỗ trợ."
    exit 1
fi

echo "Cài đặt WordPress đã hoàn tất."