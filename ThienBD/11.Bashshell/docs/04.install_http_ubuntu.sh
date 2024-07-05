
#!/bin/bash

# Cap nhat va nang cap he thong

sudo apt update -y
sudo apt upgrade -y

# Cai dat Apache HTTP server

sudo apt install apache2 -y

# Khoi dong Apache va cau hinh tu dong  khoi dong cung he thong

sudo systemctl start apache2
sudo systemctl enable apache2

# Cau hinh tuong lua cho phep truy cap Http qua cong 80
sudo ufw allow 80/tcp

# Hien thi thong bao cai dat hoan tat

echo " Hoan tat cai dat Apache HTTP Server "
