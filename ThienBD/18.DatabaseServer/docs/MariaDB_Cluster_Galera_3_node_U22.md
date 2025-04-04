# HƯỚNG DẪN TRIỂN KHAI CLUSTER GALERA 3 NODE MARIADB TRÊN UBUNTU 22.04

# 1.1. Tổng quan 

MariaDB là một sản phẩm mã đóng tách ra từ mã mở do cộng đồng phát triển của hệ quản trị cơ sở dữ liệu quan hệ MySQL nhằm theo hướng không phải trả phí với GNU GPL. MariaDB được phát triển từ sự dẫn dắt của những nhà phát triển ban đầu của MySQL, do lo ngại khi MySQL bị Oracle Corporation mua lại. Những người đóng góp được yêu cầu chia sẽ quyền tác giả của họ với MariaDB Foundation.

MariaDB được định hướng để duy trì khả năng tương thích cao với MySQL, để đảm bảo khả năng hỗ trợ về thư viện đồng thời kết hợp một cách tốt nhất với các API và câu lệnh của MySQL. MariaDB đã có công cụ hỗ lưu trữ XtraDB thay cho InnoDB.

MariaDB Galera Cluster là giải pháp sao chép đồng bộ nâng cao tính sẵn sàng cho MariaDB. Galera hỗ trợ chế độ Active-Active tức có thể truy cập, ghi dữ liệu đồng thời trên tất các node MariaDB thuộc Galera Cluster.

# 2. Chuẩn bị

## 2.1. Phân hoạch IP

|Hostname|	hardware|	Interface|
|------|------|------|
|db-nc-1|	4 CPU - 8GB RAM - 50GB Disk|	eth0: 14.225.165.71- eth1: 192.168.11.71|
|db-nc-2|	4 CPU - 8GB RAM - 50GB Disk|	eth0: 14.225.165.72- eth1: 192.168.11.72|
|db-nc-3|	4 CPU - 8GB RAM - 50GB Disk|	eth0: 14.225.165.73- eth1: 192.168.11.73|


![alt text](../imgs/9.png)

# 3. Triển khai

**Thiết lập ban đầu**

*Thực hiên trên cả 3 Node: db-nc-1, db-nc-2, db-nc-3*

**Bước 1: Cập nhật và nâng cấp hệ thống**

```
sudo apt update -y && sudo apt upgrade -y

```

**Bước 2: Cài đặt MariaDB**

```
sudo apt install mariadb-server mariadb-client -y
systemctl start mariadb
systemctl enable mariadb
systemctl status mariadb
```
- Cài lại mật khẩu mật khẩu cho quyền root của cơ sở dữ liệu:
```
mysql_secure_installation
```
![alt text](../imgs/20.png)
![alt text](../imgs/21.png)
**Bước 3: Cấu hình secure cho MariaDB**

```
mysql_secure_installation
```
**Bước 4: Cấu hình Galera Cluster**

*Thực hiên trên từng Node*
1. Tắt dịch vụ MariaDB
```
systemctl stop mariadb
```

2. Thực hiện trên Node db-nc-1

Cấu hình Galera tại node db-nc-1, tạo một tệp trong thư mục `vi /etc/mysql/conf.d/galera.cnf`. Thêm nội dung sau vào tệp:

```
[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0

# Galera Provider Configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so

# Cluster Configuration
wsrep_cluster_name="galera_cluster"
wsrep_cluster_address="gcomm://192.168.11.71,192.168.11.72,192.168.11.73"

# Galera Synchronization Configuration
wsrep_sst_method=rsync

# Node Configuration
wsrep_node_address="192.168.11.71"
wsrep_node_name="node1"
```
- Ta sẽ dùng node db-nc-1 làm node khởi tạo Galera cluster ( Tức là các node khác sẽ đồng bộ dữ liệu từ db-nc-1 )

```
galera_new_cluster
systemctl start mariadb
systemctl enable mariadb
```

**Lưu ý:**
- **wsrep_cluster_address**: Danh sách các node thuộc Cluster, sử dụng địa chỉ IP (Ví dụ sử dụng dải IP Replicate 192.168.11.71,192.168.11.72,192.168.11.73)
- **wsrep_cluster_name**: Tên của cluster
- **wsrep_node_address**: Địa chỉ IP của node đang thực hiện.
- **wsrep_node_name**: Tên node 
- Không được bật mariadb (Quan trọng, nếu không sẽ dẫn tới lỗi khi khởi tạo Cluster)


3. Thực hiện trên Node db-nc-2

Cấu hình Galera tại node db-nc-2, tạo một tệp trong thư mục `vi /etc/mysql/conf.d/galera.cnf`. Thêm nội dung sau vào tệp:

```
[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0

# Galera Provider Configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so

# Cluster Configuration
wsrep_cluster_name="galera_cluster"
wsrep_cluster_address="gcomm://192.168.11.71,192.168.11.72,192.168.11.73"

# Galera Synchronization Configuration
wsrep_sst_method=rsync

# Node Configuration
wsrep_node_address="192.168.11.72"
wsrep_node_name="node2"
```

4. Thực hiện trên Node db-nc-3

Cấu hình Galera tại node db-nc-3, tạo một tệp trong thư mục `vi /etc/mysql/conf.d/galera.cnf`. Thêm nội dung sau vào tệp:

```
[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0

# Galera Provider Configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so

# Cluster Configuration
wsrep_cluster_name="galera_cluster"
wsrep_cluster_address="gcomm://192.168.11.71,192.168.11.72,192.168.11.73"

# Galera Synchronization Configuration
wsrep_sst_method=rsync

# Node Configuration
wsrep_node_address="192.168.11.73"
wsrep_node_name="node3"
```

5. Bật MariaDB

```
systemctl start mariadb
systemctl enable mariadb
```

# 4.Kiểm tra hệ thống

1. Kiểm tra trạng thái MariaDB trên các node
```
systemctl status mariadb
```

2. Kiểm tra số lượng node
```
mysql -u root -p -e"SHOW STATUS LIKE 'wsrep_cluster_size'"
```

3. Tạo database trên một node bất kỳ

- Thực hiện tạo database trên node db-nc-1
```
mysql -u root -p
CREATE DATABASE dbt1;
CREATE DATABASE dbt2;
FLUSH PRIVILEGES;
```

- Kết quả Node db-nc-2

```
mysql -uroot -p
SHOW DATABASES;
```

- Kết quả Node db-nc-3

```
mysql -u root -p
SHOW DATABASES;
```