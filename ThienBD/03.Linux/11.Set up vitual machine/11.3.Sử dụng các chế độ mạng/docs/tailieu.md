# 1.Sử dụng chế độ NAT cho các máy ảo để truy cập Internet
## 1.1 CentOS 7
Mở CentOS 7 trên VMWare và login

![Alt text](../imgs/112.png)

Mở Setting Network Addapter

![Alt text](../imgs/113.png)

Chọn NAT và bấm OK

![Alt text](../imgs/114.png)

Ta sẽ ping đến trang web Google.com

![Alt text](../imgs/115.png)

Như ta thấy 4 gói tin đã được gửi đi và không bị mất trong quá trình gửi , như vậy ta đã có thể kết nối Internet bằng NAT

## 1.2 CentOS 9

Mở CentOS 9 trên VMWare và login

![Alt text](../imgs/116.png)

Mở Setting Network Addapter

![Alt text](../imgs/113.png)

Chọn NAT và bấm OK

![Alt text](../imgs/114.png)

Ta sẽ ping đến trang web Google.com

![Alt text](../imgs/117.png)

Như ta thấy 4 gói tin đã được gửi đi và không bị mất trong quá trình gửi , như vậy ta đã có thể kết nối Internet bằng NAT

## 1.3 Ubuntu 22.04

Mở Ubuntu 22.04 trên VMware và login

![Alt text](../imgs/118.png)

Mở Setting Network Addapter

![Alt text](../imgs/113.png)

Chọn NAT và bấm OK

![Alt text](../imgs/114.png)

Ta mở Terminal trên ubuntu và ping thử đến trang web Google.com

![Alt text](../imgs/119.png)

Như ta thấy 4 gói tin đã được gửi đi và không bị mất trong quá trình gửi , như vậy ta đã có thể kết nối Internet bằng NAT

## 1.4 Window server 2022
Mở Window server 2022 trên VMware và login

![Alt text](../imgs/120.png)

Ta kiểm tra card mạng đổi sang chế độ NAT chưa

![Alt text](../imgs/121.png)

Mở terminal và ping thử đến Google.com

![Alt text](../imgs/122.png)

4 gói được gửi đi và không bị mất mát , như vậy ta đã kết nối thành công internet trên window server 2022
# 2.Sử dụng chế độ Host-only để ping giữa hai máy ảo với nhau 

## 2.1 Ping giữa CentOS 7 và CentOS 9

Trước tiên ta đổi chế độ card mạng sang Host-only tại phần Network Adapter Setting

![Alt text](../imgs/113.png)

Ở đây ta đổi sang Host-only và bấm OK

![Alt text](../imgs/123.png)

Lần lượt ta kiểm tra thông tin ip của 2 máy ảo 

CentOS 9 

![Alt text](../imgs/124.png)

CentOS 7

![Alt text](../imgs/125.png)

Tiến hành ping thử từ CentOS 9 sang CentOS 7 

![Alt text](../imgs/126.png)

Như tay thấy 4 tập tin được gửi đi và không có dấu hiệu bị mất mát

Tiếp tục ping ngược lại từ CentOS 7 sang CentOS 9

![Alt text](../imgs/127.png)

Như vậy ta đã ping thành công giữa 2 máy ảo CentOS 7 và CentOS 9

## 2.2 Ping giữa Ubuntu và Window server
Trước tiên ta đổi chế độ card mạng sang Host-only tại phần Network Adapter Setting

![Alt text](../imgs/113.png)

Ở đây ta đổi sang Host-only và bấm OK

![Alt text](../imgs/123.png)

Lần lượt ta kiểm tra thông tin ip của 2 máy ảo  
Window server

![Alt text](../imgs/128.png)

Ubuntu

![Alt text](../imgs/129.png)

Tiến hành ping thử từ window server đến Ubuntu

![Alt text](../imgs/130.png)

Tiếp tục ping thử từ Ubuntu đến window server

![Alt text](../imgs/131.png)

Như vậy ta đã ping thành công giữa 2 máy ảo Ubuntu và Window server
# 3.Sử dụng 1 card Bridge để từ máy ảo ping ra máy laptop cá nhân

## 3.1 Window server
Trước tiên ta đổi chế độ card mạng sang Bridge tại phần Network Adapter Setting

![Alt text](../imgs/132.png)

Ta kiểm tra thông tin ip trên window server và laptop

Window server

![Alt text](../imgs/133.png)

Laptop

![Alt text](../imgs/134.png)

Ta tiến hành ping thử từ Window server đến laptop

![Alt text](../imgs/135.png)

Tiếp tục ping thử từ laptop đến Window server

![Alt text](../imgs/136.png)

Các gói tin được gửi đi và không bị mất mát , như vậy ta đã ping được từ máy ảo ra thiết bị vật lý 

## 3.2 Ubuntu 

Trước tiên ta đổi chế độ card mạng sang Bridge tại phần Network Adapter Setting

![Alt text](../imgs/132.png)

Ta kiểm tra thông tin ip trên Ubuntu và laptop

Ubuntu

![Alt text](../imgs/137.png)

Laptop

![Alt text](../imgs/134.png)

Ta tiến hành ping thử từ Ubuntu đến laptop

![Alt text](../imgs/138.png)

Tiếp tục ping thử từ laptop đến Ubuntu

![Alt text](../imgs/139.png)

Các gói tin được gửi đi và không bị mất mát , như vậy ta đã ping được từ máy ảo ra thiết bị vật lý

## 3.3 CentOS 7
Trước tiên ta đổi chế độ card mạng sang Bridge tại phần Network Adapter Setting

![Alt text](../imgs/132.png)

Ta kiểm tra thông tin ip trên CentOS 7 và laptop

CentOS 7

![Alt text](../imgs/140.png)

Laptop

![Alt text](../imgs/134.png)

Ta tiến hành ping thử từ CentOS 7 đến Laptop

![Alt text](../imgs/141.png)

Tiếp tục ping thử từ laptop đến CentOS 7

![Alt text](../imgs/142.png)

Các gói tin được gửi đi và không bị mất mát , như vậy ta đã ping được từ máy ảo ra thiết bị vật lý

## 3.3 CentOS 9

Trước tiên ta đổi chế độ card mạng sang Bridge tại phần Network Adapter Setting

![Alt text](../imgs/132.png)

Ta kiểm tra thông tin ip trên CentOS 9 và laptop

CentOS 9

![Alt text](../imgs/143.png)

Laptop

![Alt text](../imgs/134.png)

Ta tiến hành ping thử từ CentOS 9 đến Laptop

![Alt text](../imgs/144.png)

Tiếp tục ping thử từ laptop đến CentOS 9

![Alt text](../imgs/145.png)

Các gói tin được gửi đi và không bị mất mát , như vậy ta đã ping được từ máy ảo ra thiết bị vật lý