# Bài 1 
Cho mạng và số bit mượn. Giả sử có hỗ trợ subnet zero. Hãy xác định : 
- Số subnet có thể có. 
- Số host/subnet. 
- Với mỗi subnet, hãy xác định: địa chỉ mạng, địa chỉ host đầu, địa chỉ host cuối, 
địa chỉ broadcast (nếu số lượng mạng quá nhiều chỉ cần ghi ra một vài mạng đầu 
và mạng cuối cùng), subnet mask và số prefix

a) 192.168.2.0/24 mượn 5 bit còn lại 3 bit host, bước nhảy là 2^3=8, Ta có 
- Số Subnet có thể có : 2^5=32 subnet
- Số host trên mỗi Subnet : 2^3-2=6 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 4) là bội số của 8
- Liệt kê các mạng như sau

192.168.2.0/29 : Địa chỉ mạng  
192.168.2.1/29 : Địa chỉ host đầu  
192.168.2.6/29 : Địa chỉ host cuối  
192.168.2.7/29 : Địa chỉ broadcast  

---
192.168.2.8/29 : Địa chỉ mạng  
192.168.2.9/29 : Địa chỉ host đầu  
192.168.2.14/29 : Địa chỉ host cuối  
192.168.2.15/29 : Địa chỉ broadcast  

---
192.168.2.16/29 : Địa chỉ mạng  
192.168.2.17/29 : Địa chỉ host đầu  
192.168.2.22/29 : Địa chỉ host cuối  
192.168.2.23/29 : Địa chỉ broadcast  

---
192.168.2.24/29 : Địa chỉ mạng  
192.168.2.25/29 : Địa chỉ host đầu  
192.168.2.254/29 : Địa chỉ host cuối  
192.168.2.255/29 : Địa chỉ broadcast

b) 192.168.12.0/24 mượn 3 bit còn lại 5 bit host, bước nhảy là 2^5=32, Ta có
- Số Subnet có thể có : 2^3=8 subnet
- Số host trên mỗi Subnet : 2^5-2=30 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 4) là bội số của 32
- Liệt kê các mạng như sau

192.168.12.0/27 : Địa chỉ mạng  
192.168.12.1/27 : Địa chỉ host đầu  
192.168.12.30/27 : Địa chỉ host cuối  
192.168.12.31/27 : Địa chỉ broadcast  

---
192.168.12.32/27 : Địa chỉ mạng  
192.168.12.33/27 : Địa chỉ host đầu  
192.168.12.62/27 : Địa chỉ host cuối  
192.168.12.63/27 : Địa chỉ broadcast  

---
192.168.12.64/27 : Địa chỉ mạng  
192.168.12.65/27 : Địa chỉ host đầu  
192.168.12.126/27 : Địa chỉ host cuối  
192.168.12.127/27 : Địa chỉ broadcast  

---
192.168.12.128/27 : Địa chỉ mạng  
192.168.12.129/27 : Địa chỉ host đầu  
192.168.12.254/27 : Địa chỉ host cuối  
192.168.12.255/27 : Địa chỉ broadcast

c)172.16.2.0/24 mượn 2 bit còn 6 bit host, bước nhảy là 2^6=64, Ta có
- Số Subnet có thể có : 2^2=4 subnet
- Số host trên mỗi Subnet : 2^6-2=62 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 4) là bội số của 64
- Liệt kê các mạng như sau

172.16.2.0/26 : Địa chỉ mạng  
172.16.2.1/26 : Địa chỉ host đầu  
172.16.2.62/26 : Địa chỉ host cuối  
172.16.2.63/26 : Địa chỉ broadcast  

---
172.16.2.64/26 : Địa chỉ mạng  
172.16.2.65/26 : Địa chỉ host đầu  
172.16.2.126/26 : Địa chỉ host cuối  
172.16.2.127/26 : Địa chỉ broadcast  

---
172.16.2.128/26 : Địa chỉ mạng  
172.16.2.129/26 : Địa chỉ host đầu  
172.16.2.190/26 : Địa chỉ host cuối  
172.16.2.191/26 : Địa chỉ broadcast  

---
172.16.2.192/26 : Địa chỉ mạng  
172.16.2.193/26 : Địa chỉ host đầu  
172.16.2.254/26 : Địa chỉ host cuối  
172.16.2.255/26 : Địa chỉ broadcast

d) 172.16.0.0/16 mượn 3 bit , bước nhảy là 2^5=32, số bit mạng bây giờ là 19 và số bit host còn lại là 13
Ta có
- Số Subnet có thể có : 2^2=4 subnet
- Số host trên mỗi Subnet : 2^13-2=8192 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 3) là bội số của 32
- Liệt kê các mạng như sau
- 
172.16.0.0/19 : Địa chỉ mạng  
172.16.0.1/19 : Địa chỉ host đầu  
172.16.31.254/19 : Địa chỉ host cuối  
172.16.31.255/19 : Địa chỉ broadcast  

---
172.16.32.0/19 : Địa chỉ mạng  
172.16.32.1/19 : Địa chỉ host đầu  
172.16.63.254/19 : Địa chỉ host cuối  
172.16.63.255/19 : Địa chỉ broadcast  

---
172.16.64.0/19 : Địa chỉ mạng  
172.16.64.1/19 : Địa chỉ host đầu  
172.16.95.254/19 : Địa chỉ host cuối  
172.16.95.255/19 : Địa chỉ broadcast  

---
172.16.96.0/19 : Địa chỉ mạng  
172.16.96.1/19 : Địa chỉ host đầu  
172.16.128.254/19 : Địa chỉ host cuối  
172.16.128.255/19 : Địa chỉ broadcast

e) 172.16.0.0/16 mượn 12 bit => octet bị chia cắt là octet thứ 4 
- Số bit mượn là 12 => số bit mạng là 28
- Số Subnet có thể có : 2^12=4096 subnet
- Số host trên mỗi Subnet : 2^4-2=14 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 4) là bội số của 16
- Liệt kê các mạng như sau

172.16.0.0/28 : Địa chỉ mạng  
172.16.0.1/28 : Địa chỉ host đầu  
172.16.0.14/28 : Địa chỉ host cuối  
172.16.0.15/28 : Địa chỉ broadcast  

---
172.16.0.16/28 : Địa chỉ mạng  
172.16.0.17/28 : Địa chỉ host đầu  
172.16.0.30/28 : Địa chỉ host cuối  
172.16.0.31/28 : Địa chỉ broadcast  

---
172.16.0.32/28 : Địa chỉ mạng  
172.16.0.33/28 : Địa chỉ host đầu  
172.16.0.62/28 : Địa chỉ host cuối  
172.16.0.63/28 : Địa chỉ broadcast  

---
172.16.0.240/28 : Địa chỉ mạng  
172.16.0.241/28 : Địa chỉ host đầu  
172.16.0.254/28 : Địa chỉ host cuối  
172.16.0.255/28 : Địa chỉ broadcast

.................................................................

172.16.1.0/28 : Địa chỉ mạng  
172.16.1.1/28 : Địa chỉ host đầu  
172.16.1.14/28 : Địa chỉ host cuối  
172.16.1.15/28 : Địa chỉ broadcast  

---
172.16.1.16/28 : Địa chỉ mạng  
172.16.1.17/28 : Địa chỉ host đầu  
172.16.1.30/28 : Địa chỉ host cuối  
172.16.1.31/28 : Địa chỉ broadcast  

---
172.16.1.32/28 : Địa chỉ mạng  
172.16.1.33/28 : Địa chỉ host đầu  
172.16.1.62/28 : Địa chỉ host cuối  
172.16.1.63/28 : Địa chỉ broadcast  

---
172.16.1.240/28 : Địa chỉ mạng  
172.16.1.241/28 : Địa chỉ host đầu  
172.16.1.254/28 : Địa chỉ host cuối  
172.16.1.255/28 : Địa chỉ broadcast

.................................................................

172.16.2.0/28 : Địa chỉ mạng  
172.16.2.1/28 : Địa chỉ host đầu  
172.16.2.14/28 : Địa chỉ host cuối  
172.16.2.15/28 : Địa chỉ broadcast  

---
172.16.2.16/28 : Địa chỉ mạng  
172.16.2.17/28 : Địa chỉ host đầu  
172.16.2.30/28 : Địa chỉ host cuối  
172.16.2.31/28 : Địa chỉ broadcast  

---
172.16.2.32/28 : Địa chỉ mạng  
172.16.2.33/28 : Địa chỉ host đầu  
172.16.2.62/28 : Địa chỉ host cuối  
172.16.2.63/28 : Địa chỉ broadcast  

---
172.16.2.240/28 : Địa chỉ mạng  
172.16.2.241/28 : Địa chỉ host đầu  
172.16.2.254/28 : Địa chỉ host cuối  
172.16.2.255/28 : Địa chỉ broadcast

.................................................................

172.16.255.0/28 : Địa chỉ mạng  
172.16.255.1/28 : Địa chỉ host đầu  
172.16.255.14/28 : Địa chỉ host cuối  
172.16.255.15/28 : Địa chỉ broadcast  

---
172.16.255.16/28 : Địa chỉ mạng  
172.16.255.17/28 : Địa chỉ host đầu  
172.16.255.30/28 : Địa chỉ host cuối  
172.16.255.31/28 : Địa chỉ broadcast  

---
172.16.255.32/28 : Địa chỉ mạng  
172.16.255.33/28 : Địa chỉ host đầu  
172.16.255.62/28 : Địa chỉ host cuối  
172.16.255.63/28 : Địa chỉ broadcast  

---
172.16.255.240/28 : Địa chỉ mạng  
172.16.255.241/28 : Địa chỉ host đầu  
172.16.255.254/28 : Địa chỉ host cuối  
172.16.255.255/28 : Địa chỉ broadcast

f) 10.0.0.0/8 mượn 5 bit octet bị chia cắt là octet 2 
- Số Subnet có thể có : 2^5=32 subnet
- Số bit host còn lại : 32-13=19 
- Số host trên mỗi Subnet : 2^19-2=524.286 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 2) là bội số của 32
- Liệt kê các mạng như sau

10.0.0.0/13 : Địa chỉ mạng  
10.0.0.1/13 : Địa chỉ host đầu  
10.7.255.254/13 : Địa chỉ host cuối  
10.7.255.255/13 : Địa chỉ broadcast  

---
10.8.0.0/13 : Địa chỉ mạng  
10.8.0.1/13 : Địa chỉ host đầu  
10.15.255.254/13 : Địa chỉ host cuối  
10.15.255.255/13 : Địa chỉ broadcast  

---
10.16.0.0/13 : Địa chỉ mạng  
10.16.0.1/13 : Địa chỉ host đầu  
10.23.255.254/13 : Địa chỉ host cuối  
10.23.255.255/13 : Địa chỉ broadcast  

---
10.248.0.0/13 : Địa chỉ mạng  
10.248.0.1/13 : Địa chỉ host đầu  
10.255.255.254/13 : Địa chỉ host cuối  
10.255.255.255/13 : Địa chỉ broadcast

g) 10.0.0.0/8 mượn 10 bit octet bị chia cắt là octet 3
- Số Subnet có thể có : 2^10=1024 subnet
- Số bit host còn lại : 32-18=14 
- Số host trên mỗi Subnet : 2^14-2=16382 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 2) là bội số của 64
- Liệt kê các mạng như sau

10.0.0.0/18 : Địa chỉ mạng  
10.0.0.1/18 : Địa chỉ host đầu  
10.0.63.254/18 : Địa chỉ host cuối  
10.0.64.255/18 : Địa chỉ broadcast  

---
10.0.64.0/18 : Địa chỉ mạng  
10.0.64.1/18 : Địa chỉ host đầu  
10.0.127.254/18 : Địa chỉ host cuối  
10.0.127.255/18 : Địa chỉ broadcast   

---
10.0.127.0/18 : Địa chỉ mạng  
10.0.127.1/18 : Địa chỉ host đầu  
10.0.191.254/18 : Địa chỉ host cuối  
10.0.191.255/18 : Địa chỉ broadcast   

---
10.0.192.0/18 : Địa chỉ mạng  
10.0.192.1/18 : Địa chỉ host đầu  
10.0.255.254/18 : Địa chỉ host cuối  
10.0.255.255/18 : Địa chỉ broadcast

xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

10.1.0.0/18 : Địa chỉ mạng  
10.1.0.1/18 : Địa chỉ host đầu  
10.1.63.254/18 : Địa chỉ host cuối  
10.1.64.255/18 : Địa chỉ broadcast  

---
10.1.64.0/18 : Địa chỉ mạng  
10.1.64.1/18 : Địa chỉ host đầu  
10.1.127.254/18 : Địa chỉ host cuối  
10.1.127.255/18 : Địa chỉ broadcast   

---
10.1.127.0/18 : Địa chỉ mạng  
10.1.127.1/18 : Địa chỉ host đầu  
10.1.191.254/18 : Địa chỉ host cuối  
10.1.191.255/18 : Địa chỉ broadcast   

---
10.1.192.0/18 : Địa chỉ mạng  
10.1.192.1/18 : Địa chỉ host đầu  
10.1.255.254/18 : Địa chỉ host cuối  
10.1.255.255/18 : Địa chỉ broadcast

xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

10.255.0.0/18 : Địa chỉ mạng  
10.255.0.1/18 : Địa chỉ host đầu  
10.255.63.254/18 : Địa chỉ host cuối  
10.255.64.255/18 : Địa chỉ broadcast  

---
10.255.64.0/18 : Địa chỉ mạng  
10.255.64.1/18 : Địa chỉ host đầu  
10.255.127.254/18 : Địa chỉ host cuối  
10.255.127.255/18 : Địa chỉ broadcast   

---
10.255.127.0/18 : Địa chỉ mạng  
10.255.127.1/18 : Địa chỉ host đầu  
10.255.191.254/18 : Địa chỉ host cuối  
10.255.191.255/18 : Địa chỉ broadcast   

---
10.255.192.0/18 : Địa chỉ mạng  
10.255.192.1/18 : Địa chỉ host đầu  
10.255.255.254/18 : Địa chỉ host cuối  
10.255.255.255/18 : Địa chỉ broadcast

h) 10.0.0.0/8 mượn 18 bit octet bị chia cắt là octet thứ 4
- Số Subnet có thể có : 2^18=262144 subnet
- Số bit host còn lại : 32-26=6 
- Số host trên mỗi Subnet : 2^6-2=62 host
- Các địa chỉ mạng sẽ có octet bị chia cắt (octet thứ 4) là bội số của 64
- Liệt kê các mạng như sau

10.0.0.0/26 : Địa chỉ mạng  
10.0.0.1/26 : Địa chỉ host đầu  
10.0.0.62/26 : Địa chỉ host cuối  
10.0.0.63/26 : Địa chỉ broadcast  

---
10.0.0.64/26 : Địa chỉ mạng  
10.0.0.65/26 : Địa chỉ host đầu  
10.0.0.126/26 : Địa chỉ host cuối  
10.0.0.127/26 : Địa chỉ broadcast   

---
10.0.0.128/26 : Địa chỉ mạng  
10.0.0.129/26 : Địa chỉ host đầu  
10.0.0.190/26 : Địa chỉ host cuối  
10.0.0.191/26 : Địa chỉ broadcast   

---
10.0.0.192/26 : Địa chỉ mạng  
10.0.0.193/26 : Địa chỉ host đầu  
10.0.0.254/26 : Địa chỉ host cuối  
10.0.0.255/26 : Địa chỉ broadcast

.................................................................

10.0.255.0/26 : Địa chỉ mạng  
10.0.255.1/26 : Địa chỉ host đầu  
10.0.255.62/26 : Địa chỉ host cuối  
10.0.255.63/26 : Địa chỉ broadcast  

---
10.0.255.64/26 : Địa chỉ mạng  
10.0.255.65/26 : Địa chỉ host đầu  
10.0.255.126/26 : Địa chỉ host cuối  
10.0.255.127/26 : Địa chỉ broadcast   

---
10.0.255.128/26 : Địa chỉ mạng  
10.0.255.129/26 : Địa chỉ host đầu  
10.0.255.190/26 : Địa chỉ host cuối  
10.0.255.191/26 : Địa chỉ broadcast   

---
10.0.255.192/26 : Địa chỉ mạng  
10.0.255.193/26 : Địa chỉ host đầu  
10.0.255.254/26 : Địa chỉ host cuối  
10.0.255.255/26 : Địa chỉ broadcast

xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

10.1.0.0/26 : Địa chỉ mạng  
10.1.0.1/26 : Địa chỉ host đầu  
10.1.0.62/26 : Địa chỉ host cuối  
10.1.0.63/26 : Địa chỉ broadcast  

---
10.1.0.64/26 : Địa chỉ mạng  
10.1.0.65/26 : Địa chỉ host đầu  
10.1.0.126/26 : Địa chỉ host cuối  
10.1.0.127/26 : Địa chỉ broadcast   

---
10.1.0.128/26 : Địa chỉ mạng  
10.1.0.129/26 : Địa chỉ host đầu  
10.1.0.190/26 : Địa chỉ host cuối  
10.1.0.191/26 : Địa chỉ broadcast   

---
10.1.0.192/26 : Địa chỉ mạng  
10.1.0.193/26 : Địa chỉ host đầu  
10.1.0.254/26 : Địa chỉ host cuối  
10.1.0.255/26 : Địa chỉ broadcast

.................................................................

10.1.255.0/26 : Địa chỉ mạng  
10.1.255.1/26 : Địa chỉ host đầu  
10.1.255.62/26 : Địa chỉ host cuối  
10.1.255.63/26 : Địa chỉ broadcast  

---
10.1.255.64/26 : Địa chỉ mạng  
10.1.255.65/26 : Địa chỉ host đầu  
10.1.255.126/26 : Địa chỉ host cuối  
10.1.255.127/26 : Địa chỉ broadcast   

---
10.1.255.128/26 : Địa chỉ mạng  
10.1.255.129/26 : Địa chỉ host đầu  
10.1.255.190/26 : Địa chỉ host cuối  
10.1.255.191/26 : Địa chỉ broadcast   

---
10.1.255.192/26 : Địa chỉ mạng  
10.1.255.193/26 : Địa chỉ host đầu  
10.1.255.254/26 : Địa chỉ host cuối  
10.1.255.255/26 : Địa chỉ broadcast

xxxxxxxxxxxxxxxxxxxxxxxxxxxxx

10.255.0.0/26 : Địa chỉ mạng  
10.255.0.1/26 : Địa chỉ host đầu  
10.255.0.62/26 : Địa chỉ host cuối  
10.255.0.63/26 : Địa chỉ broadcast  

---
10.255.0.64/26 : Địa chỉ mạng  
10.255.0.65/26 : Địa chỉ host đầu  
10.255.0.126/26 : Địa chỉ host cuối  
10.255.0.127/26 : Địa chỉ broadcast   

---
10.255.0.128/26 : Địa chỉ mạng  
10.255.0.129/26 : Địa chỉ host đầu  
10.255.0.190/26 : Địa chỉ host cuối  
10.255.0.191/26 : Địa chỉ broadcast   

---
10.255.0.192/26 : Địa chỉ mạng  
10.255.0.193/26 : Địa chỉ host đầu  
10.255.0.254/26 : Địa chỉ host cuối  
10.255.0.255/26 : Địa chỉ broadcast

.................................................................

10.255.255.0/26 : Địa chỉ mạng  
10.255.255.1/26 : Địa chỉ host đầu  
10.255.255.62/26 : Địa chỉ host cuối  
10.255.255.63/26 : Địa chỉ broadcast  

---
10.255.255.64/26 : Địa chỉ mạng  
10.255.255.65/26 : Địa chỉ host đầu  
10.255.255.126/26 : Địa chỉ host cuối  
10.255.255.127/26 : Địa chỉ broadcast   

---
10.255.255.128/26 : Địa chỉ mạng  
10.255.255.129/26 : Địa chỉ host đầu  
10.255.255.190/26 : Địa chỉ host cuối  
10.255.255.191/26 : Địa chỉ broadcast   

---
10.255.255.192/26 : Địa chỉ mạng  
10.255.255.193/26 : Địa chỉ host đầu  
10.255.255.254/26 : Địa chỉ host cuối  
10.255.255.255/26 : Địa chỉ broadcast

# Bài 2
![Alt text](<../imgs/bai 2.png>)

Sắp xếp các mạng theo thứ tự giảm dần số Host
Mạng 1 : 78 host  
Mạng 2 : 50 host  
Mạng 3 : 20 host  
Mạng 4 : 10 host   
Mạng 5 : 5 host  
1: Lấy địa chỉ 172.16.5.0/24 chia cho mạng 1 yêu cầu 78 host  
Ta có 2^h-2>=78 => h=7 => số bit mượn n=32-24-7=1  
=> ta có 2^1 = 2 mạng con , bước nhảy = 2^7=128  
SN1 : 172.16.5.0/25  ( gán cho Mạng 1)  
SN2 : 172.16.5.128/25 
2: Lấy địa chỉ N2 : 172.16.5.128/25 chia cho mạng 2 yêu cầu 50 host  
Ta có 2^h-2>=50 => h=6 => số bit mượn n=32-25-6=1  
=> ta có 2^1 = 2 mạng con, bước nhảy = 2^6=64  
SN1: 172.16.5.128/26 ( gán cho Mạng 2)  
SN2: 172.16.5.192/26  
3: Lấy địa chỉ N2 : 172.16.5.192/26 chia cho mạng 3 yêu cầu 20 host  
Ta có 2^h-2>=20 => h=5 => số bit mượn n=32-26-5=1  
=> ta có 2^1 = 2 mạng con, bước nhảy = 2^5=32  
SN1: 172.16.5.192/27 ( gán cho Mạng 3)  
SN2: 172.16.5.224/27  
4: Lấy địa chỉ N2 : 172.16.5.224/27 chia cho mạng 4 yêu cầu 10 host  
Ta có 2^h-2>=10 => h=4 => số bit mượn n=32-27-4=1  
=> ta có 2^1 = 2 mạng con, bước nhảy = 2^4=16  
SN1: 172.16.5.224/28 ( gán cho Mạng 4)  
SN2: 172.16.5.240/28  
5: Lấy địa chỉ N2 : 172.16.5.240/28 chia cho mạng 5 yêu cầu 5 host  
Ta có 2^h-2>=5 => h=3 => số bit mượn n=32-28-3=1  
=> ta có 2^1 = 2 mạng con, bước nhảy = 2^3=8   
SN1: 172.16.5.240/29 ( gán cho Mạng 5)  
SN2: 172.16.5.248/29  
Tiếp đó ta xét đến các mạng có 2 host là các liên kết điểm – điểm serial, ta xem thử mượn bao nhiêu bit là phù hợp:
Ta có 2^h-2>=2 => h=2 => số bit mượn n=32-29-2=1 
=> ta có 2^1 = 2 mạng con, bước nhảy = 2^2=4  
SN1: 172.16.5.248/30 ( gán cho Mạng 6)  
SN2: 172.16.5.252/30 ( gán cho Mạng 7)  

![Alt text](<../imgs/bai 2 - gán subnet.png>)

# Bài 3 
a, 192.168.1.130/29  
/29 nên sẽ có 29 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 5 , bước nhảy là 8 . Lấy octet thứ 4 của địa chỉ host là 130 chia cho 8 được 16 còn dư , ta lấy 16 nhân 8 được 128   
Host này thuộc mạng 192.168.1.128/29  
b, 172.16.34.57/18  
/18 nên sẽ có 18 bit mạng , octet chia cat là octet thứ 3 , số bit mượn của octet này là 2 , bước nhảy là 64 . Lấy octet thứ 3 của địa chỉ host là 34 chia cho 64 được 0  
Host này thuộc mạng 172.16.0.0/18  
c, 203.162.4.191/28  
/28 nên sẽ có 28 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 4 , bước nhảy là 16 . Lấy octet thứ 4 của địa chỉ host là 191 chia cho 16 được 11 còn dư , ta lấy 11 nhân 16 ta được 176   
Host này thuộc mạng 203.162.4.176/28  
d, 1.1.1.1/30  
/30 nên sẽ có 30 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 6 , bước nhảy là 4 . Lấy octet thứ 4 của địa chỉ host là 1 chia cho 4 được 0  
Host này thuộc mạng 1.1.1.0/30  
e, 10.10.10.89/29
/29 nên sẽ có 29 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 5 , bước nhảy là 8 . Lấy octet thứ 4 của địa chỉ host là 89 chia cho 8 được 11 còn dư , ta lấy 11 nhân 8 ta được 88     
Host này thuộc mạng 10.10.10.88/29
f, 70.9.12.35/30  
/30 nên sẽ có 30 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 6 , bước nhảy là 4 . Lấy octet thứ 4 của địa chỉ host là 35 chia cho 4 được 8 còn dư , ta lây 8 nhân với 4 được 32    
Host này thuộc mạng 70.9.12.32/30  
g, 158.16.23.208/29  
/29 nên sẽ có 29 bit mạng , octet chia cat là octet thứ 4 , số bit mượn của octet này là 5 , bước nhảy là 8 . Lấy octet thứ 4 của địa chỉ host là 208 chia cho 8 được 26   
Host này không dùng làm địa chỉ mạng   
# Bài 4 Tóm tắt địa chỉ mạng 
a,   
192.168.0.0/24  
192.168.1.0/24  
192.168.2.0/24  
192.168.3.0/24  
Octet thứ 3 có sự khác biệt , ta có
192.168.|000000|00.0
192.168.|000000|01.0
192.168.|000000|10.0
192.168.|000000|11.0
Ta thấy octet thứ ba còn có thêm 6 bit giống nhau. Vậy ta có mạng tóm tắt là 192.168.0.0/22. 

b,   
172.16.16.0/24  
172.16.20.0.24  
172.16.24.0/24  
172.16.28.0/24  
Octet thứ 3 có sự khác biệt , ta có
172.16.|000|10000.0
172.16.|000|10100.0
172.16.|000|11000.0
172.16.|000|11100.0
Ta thấy octet thứ ba còn có thêm 3 bit giống nhau. Vậy ta có mạng tóm tắt là 172.16.0.0/19.