#!/bin/bash

#CAI DAT APACHE

## Cap nhat va nang cap he thong
sudo yum update -y
sudo yum upgrade -y

## Cai dat Apache HTTP server

yum install httpd -y

## Khoi dong Apache va cau hinh tu dong  khoi dong cung he thong

sudo systemctl start httpd
sudo systemctl enable httpd


## Cau hinh tuong lua cho phep truy cap Http qua cong 80
sudo firewall-cmd --permanent --add-service=http

## Chay lai dich vu firewall
sudo firewall-cmd --reload


## Kiem tra trang thai dich vu apache

sudo systemctl status httpd

## Hien thi thong bao cai dat hoan tat



echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
echo "x Hoan tat cai dat Apache HTTP Server x"
echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"