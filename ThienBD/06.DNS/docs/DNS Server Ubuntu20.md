# Triển khai mô hình DNS Server trên Ubuntu 20.04

**Mô hình LAB**

`Máy chủ DNS chính:`

Hệ điều hành: Ubuntu 20.04 Minimal Server.
Tên máy chủ: ds.ducthien.com
Địa chỉ IP: 192.168.3.186/24.


`Máy khách:`

Hệ điều hành: Ubuntu 20.04 Minimal Server.
Tên máy chủ: client.ducthien.com
Địa chỉ IP: 192.168.3.228/24.

![alt text](../imgs/MHTK2.png)
## 1.Trên server
**1.Thay đổi tên máy chủ DNS Server**

```
hostnamectl set-hostname ds.ducthien.com

```
**2.Cài đặt DNS Server trên ds**
```
apt install bind9 bind9utils bind9-doc

```

Hãy thiết lập BIND sang chế độ IPv4

```
sudo nano /etc/default/named
```

Thêm `-4` vào cuối của dòng OPTIONS:

![Alt text](../imgs/20.png)

Khởi động lại BIND để áp dụng các thay đổi:

```
sudo systemctl restart bind9
```
**3.Cấu hình server DNS**
*Cấu hình tệp named.conf.options*
Tệp này named.conflà tệp cấu hình chính của BIND 9. Tệp chính đó bao gồm một tham chiếu đến /etc/bind/named.conf.optionsnơi chúng tôi có thể chỉ định các tùy chọn mà chúng tôi cần cho cấu hình của mình. Chúng tôi sẽ thực hiện bốn sửa đổi đối với /etc/bind/named.conf.optionstệp:

Trên server ds, mở file named.conf.options

```
vi /etc/bind/named.conf.options
```

Ở trên khối options, hãy tạo mới một khối ACL với tên trusted như dưới hình 

```
acl "trusted" {
        192.168.3.186;    # ds 
        192.168.3.228;    # client
};

options {
```
![Alt text](../imgs/21.png)

Bây giờ bạn đã có danh sách server DNS tin cậy, giờ thì hãy chỉnh sửa khối options:

```
options {
        directory "/var/cache/bind";
        
        recursion yes;                 # enables recursive queries
        allow-recursion { trusted; };  # allows recursive queries from "trusted" clients
        listen-on { 192.168.3.186; };   # ds private IP address - listen on private network only
        allow-transfer { none; };      # disable zone transfers by default

        forwarders {
                8.8.8.8;
                8.8.4.4;
        };

};
```

- Một `acl` lệnh xác định mạng cục bộ (LAN) của chúng tôi.
- Lệnh `allow-query` xác định địa chỉ IP nào có thể gửi truy vấn DNS đến máy chủ.
- Một `forwarders` lệnh xác định máy chủ DNS nào mà máy chủ này sẽ chuyển tiếp các truy vấn đệ quy tới.
- Lệnh `recursion` cho phép truy vấn DNS đệ quy tới máy chủ.


![Alt text](../imgs/22.png)


*Cấu hình tệp named.conf.local*
`named.conf.local` thường được sử dụng để xác định các vùng DNS cục bộ cho một miền riêng. Chúng tôi sẽ cập nhật tệp này để bao gồm các vùng DNS chuyển tiếp và đảo ngược của chúng tôi.


Trong ds, mở tệp named.conf.local để chỉnh sửa:

```
sudo nano /etc/bind/named.conf.local
```
Ngoại trừ một vài comments, tệp này sẽ trống. Ở đây bạn sẽ chỉ định các forward zones và reverse zones của mình


```
zone "ds.ducthien.com" {
    type primary;
    file "/etc/bind/zones/ds.ducthien.com.db"; # zone file path
};
zone "3.168.192.in-addr.arpa" {
     type master;
     file "/etc/bind/zones/rev.3.168.192.in-addr.arpa";
};
```

![Alt text](../imgs/23.png)


**4.Khởi tạo forward zone file**
Tạo một thư mục nơi chứa các zone file. Theo như tệp cấu hình named.conf.local, ví trí của zone file sẽ là `/etc/bind/zones:`

```
sudo mkdir /etc/bind/zones
```

Bạn sẽ dựa trên forward zone file tại mẫu db.local. Sao chép nó đến vị trí đúng bằng các lệnh sau:

```
sudo cp /etc/bind/db.local /etc/bind/zones/db.ds.ducthien.com
```

Tiếp đến, hãy chỉnh sửa forward zone file:

```
sudo nano /etc/bind/zones/db.ds.ducthien.com
```
Đây là file cấu hình defaul 
![Alt text](../imgs/24.png)

Ta sẽ sửa lại như dưới hình 

![Alt text](../imgs/25.png)

**5.Khởi tạo reverse zone file**

Tạo một reverse zone file.

```
sudo cp /etc/bind/db.127 /etc/bind/zones/db.192.168
```

Chỉnh sửa reverse zone file tương ứng với các reverse zones được xác định trong tệp `named.conf.local:`

```
sudo nano /etc/bind/zones/db.192.168
```

File mặc định sẽ như dưới hình 
![Alt text](../imgs/26.png)

Sau khi sửa file sẽ như dưới hình

![Alt text](../imgs/27.png)

**6.Kiểm tra cú pháp cấu hình BIND**

```
sudo named-checkconf
```
Lệnh `named-checkzone` có thể được sử dụng để kiểm tra tính chính xác của các zone file. Đối số đầu tiên chỉ định tên zone, và đối số thứ hai chỉ định zone file tương ứng, hai đối số này đều được xác định trong tệp named.conf.local.
Ví dụ, để kiểm tra cấu hình forward zone ds.ducthien.com, hãy chạy lệnh sau

```
sudo named-checkzone ds.ducthien.com /etc/bind/zones/db.ds.ducthien.com
```

Để kiểm tra cấu hình reverse zone 128.10.in-addr.arpa, hãy chạy lệnh sau

```
sudo named-checkzone 168.192.in-addr.arpa /etc/bind/zones/db.192.168

```
![Alt text](../imgs/28.png)


**7.Khởi động lại BIND**


Để khởi động lại BIND, thực hiện lệnh sau:

```
sudo systemctl restart bind9
```

## 2.Trên client

Tạo một tệp mới trong /etc/netplan gọi là 00-private-nameservers.yaml:

```
sudo nano /etc/netplan/00-private-nameservers.yaml
```

Ta sửa file như hình dưới 

![Alt text](../imgs/29.png)

Tiếp theo, cho Netplan sử dụng tệp cấu hình mới bằng cách sử dụng lệnh netplan try. Nếu có vấn đề gây mất kết nối mạng, Netplan sẽ tự động hoàn tác các thay đổi sau một khoảng thời gian chờ đợi:

