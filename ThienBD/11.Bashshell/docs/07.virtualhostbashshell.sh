#!/bin/bash
#===Cau hinh virtual host===
# ---Cai dat web server apache---
sudo apt -y update 
sudo apt install apache2 -y
# ---Thay doi cai dat tuong lua--- 
sudo ufw allow 'Apache'
# ---Thiet lap virtual host---
# Tao thu muc cho ducthien
sudo mkdir /var/www/ducthien
# Gan quyen cho thu muc
sudo chown -R $USER:$USER /var/www/ducthien
sudo chown -R 755 /var/www/ducthien
# Tao mot trang mau index
sudo tee /var/www/ducthien/index.html <<EOF
<html>
    <head>
        <title>Welcome to ducthien!</title>
    </head>
    <body>
        <h1>Success!  The ducthien virtual host is working!</h1>
    </body>
</html>
EOF
# Tao 1 file virtual host
sudo tee /etc/apache2/sites-available/ducthien.conf <<EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    ServerName ducthien.com
    ServerAlias www.ducthien.com
    DocumentRoot /var/www/ducthien
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
# Enable lai file
sudo a2ensite ducthien.conf
# Disable trang mac dinh
sudo a2dissite 000-default.conf
sudo apache2ctl configtest
# Restart lai apache de ap dung cac thay doi
sudo systemctl restart apache2

# ---Thiet lap virtual host thu 2---
sudo mkdir /var/www/hanquoc
sudo chown -R $USER:$USER /var/www/hanquoc
sudo chown -R 755 /var/www/hanquoc
sudo tee /var/www/hanquoc/index.html <<EOF
<html>
    <head>
        <title>Welcome to hanquoc!</title>
    </head>
    <body>
        <h1>Success!  The hanquoc virtual host is working!</h1>
    </body>
</html>
EOF


sudo tee /etc/apache2/sites-available/hanquoc.conf <<EOF
<VirtualHost *:81>
    ServerAdmin webmaster@localhost
    ServerName hanquoc.com
    ServerAlias www.hanquoc.com
    DocumentRoot /var/www/hanquoc
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo a2ensite hanquoc.conf

# ---Thiet lap virtual host thu 3---
sudo mkdir /var/www/vietnam
sudo chown -R $USER:$USER /var/www/vietnam
sudo chown -R 755 /var/www/vietnam
sudo tee /var/www/vietnam/index.html <<EOF
<html>
    <head>
        <title>Welcome to vietnam!</title>
    </head>
    <body>
        <h1>Success!  The vietnam virtual host is working!</h1>
    </body>
</html>
EOF


sudo tee /etc/apache2/sites-available/vietnam.conf <<EOF
<VirtualHost *:82>
    ServerAdmin webmaster@localhost
    ServerName vietnam.com
    ServerAlias www.vietnam.com
    DocumentRoot /var/www/vietnam
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo a2ensite vietnam.conf

# ---Them port trong file config---
sed -i '6 a Listen 81' /etc/apache2/ports.conf
sed -i '6 a Listen 82' /etc/apache2/ports.conf
# ---Cau hinh tuong lua allow port moi---
sudo ufw allow 82
sudo ufw allow 81
sudo systemctl restart apache2