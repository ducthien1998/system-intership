# KEYSTONE COMMAND LINE

# 1. Tổng quan 
`keystone-manage` là công cụ dòng lệnh tương tác với dịch vụ Keystone để khởi tạo và cập nhật dữ liệu trong Keystone. Nói chung, `keystone-manage` chỉ được sử dụng cho các hoạt động không thể thực hiện được bằng API HTTP, chẳng hạn như nhập/xuất dữ liệu và di chuyển cơ sở dữ liệu.

1. Cú pháp 
```
keystone-manage [options] action [additional args]
```

2. Tùy chọn các lệnh có sẵn 

- **bootstrap**: Thực hiện quá trình khởi động cơ bản.
- **credential_migrate**: Mã hóa thông tin xác thực bằng khóa chính mới.
- **credential_rotate**: Xoay vòng khóa Fernet để mã hóa thông tin xác thực.
- **credential_setup**: Thiết lập kho lưu trữ khóa Fernet để mã hóa thông tin xác thực.
- **db_sync**: Đồng bộ cơ sở dữ liệu.
- **db_version**: In phiên bản di chuyển hiện tại của cơ sở dữ liệu.
- **doctor**: Chẩn đoán các vấn đề thường gặp khi triển khai keystone.
- **domain_config_upload**: Tải lên tệp cấu hình tên miền.
- **fernet_rotate**: Xoay vòng khóa trong kho khóa Fernet.
- **fernet_setup**: Thiết lập kho lưu trữ khóa Fernet để mã hóa mã thông báo.
- **mapping_populate**: Chuẩn bị phần phụ trợ LDAP dành riêng cho từng miền.
- **mapping_purge**: Xóa bảng ánh xạ danh tính.
- **mapping_engine**: Kiểm tra các quy tắc ánh xạ liên bang của bạn.
- **saml_idp_metadata**: Tạo siêu dữ liệu nhà cung cấp danh tính.
- **token_flush**: Xóa các token đã hết hạn

3. Các option có sẵn 

- **-h** / **--help**: hiển thị thông báo trợ giúp này và thoát
- **--config-dir DIR**: Đường dẫn đến thư mục cấu hình để kéo các tệp *.conf từ đó. Bộ tệp này được sắp xếp để cung cấp thứ tự phân tích cú pháp có thể dự đoán được nếu các tùy chọn riêng lẻ bị ghi đè. Bộ được phân tích cú pháp sau các tệp được chỉ định qua `–config-file` trước đó, do đó các đối số do đó các tùy chọn bị ghi đè trong thư mục sẽ được ưu tiên.
- **--config-file PATH**: Đường dẫn đến tệp cấu hình để sử dụng. Có thể chỉ định nhiều tệp cấu hình, với các giá trị trong các tệp sau được ưu tiên. Mặc định là Không có.
- **--debug, -d**: Nếu đặt thành true, mức ghi nhật ký sẽ được đặt thành DEBUG thay vì mức INFO mặc định.
- **--log-config-append PATH, --log_config PATH**: Tên của tệp cấu hình ghi nhật ký. Tệp này được thêm vào bất kỳ tệp cấu hình ghi nhật ký nào hiện có. Để biết chi tiết về tệp cấu hình ghi nhật ký, hãy xem tài liệu mô-đun ghi nhật ký Python. Lưu ý rằng khi sử dụng tệp cấu hình ghi nhật ký thì tất cả cấu hình ghi nhật ký được đặt trong tệp cấu hình và các tùy chọn cấu hình ghi nhật ký khác bị bỏ qua (ví dụ: logging_context_format_string).
- **--log-date-format DATE_FORMAT**: Xác định chuỗi định dạng cho %(asctime)s trong bản ghi nhật ký. Mặc định: Không có. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.
- **--log-dir LOG_DIR, --logdir LOG_DIR**: (Tùy chọn) Thư mục cơ sở được sử dụng cho các đường dẫn log_file tương đối. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.
- **--log-file PATH, --logfile PATH**: (Tùy chọn) Tên của tệp nhật ký để gửi đầu ra nhật ký đến. Nếu không đặt mặc định, nhật ký sẽ chuyển đến stderr theo định nghĩa của use_stderr. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.
- **--nodebug**:	Nghịch đảo của –debug
- **--nostandard-threads**: Nghịch đảo của –standard-threads
- **--nouse-syslog**: Đảo ngược của –use-syslog
- **--noverbose**: Đảo ngược của –verbose
- **--nowatch-log-file**: Đảo ngược của –watch-log-file
- **--pydev-debug-host PYDEV_DEBUG_HOST**: Máy chủ kết nối để gỡ lỗi từ xa.
- **--pydev-debug-port PYDEV_DEBUG_PORT**: Cổng kết nối để gỡ lỗi từ xa.
- **--standard-threads**: Không vá các mô-đun hệ thống luồng.
- **--syslog-log-facility SYSLOG_LOG_FACILITY**: Tiện ích Syslog để nhận các dòng nhật ký. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.
- **--use-syslog**: Sử dụng syslog để ghi nhật ký. Định dạng syslog hiện tại đã BỊ LOẠI BỎ và sẽ được thay đổi sau để tuân thủ RFC5424. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.
- **--verbose, -v**: Nếu đặt thành false, mức ghi nhật ký sẽ được đặt thành CẢNH BÁO thay vì mức INFO mặc định.
- **--version**: Hiển thị số phiên bản của chương trình và thoát
- **--watch-log-file**: Sử dụng trình xử lý ghi nhật ký được thiết kế để theo dõi hệ thống tệp. Khi tệp nhật ký được di chuyển hoặc xóa, trình xử lý này sẽ mở tệp nhật ký mới với đường dẫn được chỉ định ngay lập tức. Điều này chỉ có ý nghĩa nếu tùy chọn log_file được chỉ định và nền tảng Linux được sử dụng. Tùy chọn này bị bỏ qua nếu log_config_append được đặt.


# 2. Quản lý user, project, role

## 2.1. Project

**1. Liệt kê project**
Liệt kê tất cả các dự án với ID, tên và trạng thái được bật hay tắt
```
openstack project list
```
```
+----------------------------------+--------------------+
| ID                               | Name               |
+----------------------------------+--------------------+
| f7ac731cc11f40efbc03a9f9e1d1d21f | admin              |
| c150ab41f0d9443f8874e32e725a4cc8 | alt_demo           |
| a9debfe41a6d4d09a677da737b907d5e | demo               |
| 9208739195a34c628c58c95d157917d7 | invisible_to_admin |
| 3943a53dc92a49b2827fae94363851e1 | service            |
| 80cab5e1f02045abad92a2864cfd76cb | test_project       |
+----------------------------------+--------------------+
```

**2. Tạo project**
Tạo một dự án mới tên là `new-project`
```
openstack project create --description 'my new project' new-project \
  --domain default
```
```
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | my new project                   |
| domain_id   | e601210181f54843b51b3edff41d4980 |
| enabled     | True                             |
| id          | 1a4a0618b306462c9830f876b0bd6af2 |
| is_domain   | False                            |
| name        | new-project                      |
| parent_id   | e601210181f54843b51b3edff41d4980 |
+-------------+----------------------------------+
```

**3. Cập nhật project**

- Tạm thời vô hiệu hóa dự án
```
openstack project set PROJECT_ID --disable
```
- Kích hoạt dự án bị vô hiệu hóa
```
openstack project set PROJECT_ID --enable
```
- Cập nhật tên dự án
```
openstack project set PROJECT_ID --name project-new
```
- Hiển thị thông tin đã cập nhật 

```
openstack project show PROJECT_ID
```

```
+-------------+----------------------------------+
| Field       | Value                            |
+-------------+----------------------------------+
| description | my new project                   |
| enabled     | True                             |
| id          | 0b0b995694234521bf93c792ed44247f |
| name        | new-project                      |
| properties  |                                  |
+-------------+----------------------------------+
```
**4. Xóa project**

Chỉ định và xóa project
```
openstack project delete PROJECT_ID
```

## 2.2. User

**1. Liệt kê user có sẵn** 
```
openstack user list
```
```
+----------------------------------+----------+
| ID                               | Name     |
+----------------------------------+----------+
| 352b37f5c89144d4ad0534139266d51f | admin    |
| 86c0de739bcb4802b8dc786921355813 | demo     |
| 32ec34aae8ea432e8af560a1cec0e881 | glance   |
| 7047fcb7908e420cb36e13bbd72c972c | nova     |
+----------------------------------+----------+
```

**2. Tạo User**
Để tạo người dùng, bạn phải chỉ định tên. Tùy chọn, bạn có thể chỉ định ID dự án, mật khẩu và địa chỉ email. Bạn nên bao gồm ID dự án và mật khẩu vì người dùng không thể đăng nhập vào bảng điều khiển nếu không có thông tin này.

Tạo người dùng mới có tên **new-user**
```
openstack user create --project new-project --password PASSWORD new-user
```

```
+------------+----------------------------------+
| Field      | Value                            |
+------------+----------------------------------+
| email      | None                             |
| enabled    | True                             |
| id         | 6322872d9c7e445dbbb49c1f9ca28adc |
| name       | new-user                         |
| project_id | 0b0b995694234521bf93c792ed44247f |
| username   | new-user                         |
+------------+----------------------------------+
```

**3. Cập nhật User**

- Tạm thời vô hiệu hóa tài khoản người dùng
```
openstack user set USER_NAME --disable
```
- Kích hoạt tài khoản người dùng bị vô hiệu hóa
```
openstack user set USER_NAME --enable
```
- Thay đổi tên mô tả cho tài khoản người dùng
```
openstack user set USER_NAME --name user-new --email new-user@example.com
```

**4. Xóa User**

Xóa tài khoản người dùng đã chỉ định 
```
openstack user delete USER_NAME
```
## 2.3. Group
**1. Tạo group**
```
openstack group create
    [--domain <domain>]
    [--description <description>]
    [--or-show]
    <group-name>
```

**2. Liệt kê các group**
```
openstack group list
```
**3. Thêm user vào group**
```
openstack group add user
    [--group-domain <group-domain>]
    [--user-domain <user-domain>]
    <group>
    <user>
    [<user> ...]
```

**4. Kiểm tra user có nằm trong group không**
```
openstack group contains user
    [--group-domain <group-domain>]
    [--user-domain <user-domain>]
    <group>
    <user>
```

**5. Xóa user khỏi group**
```
openstack group remove user
    [--group-domain <group-domain>]
    [--user-domain <user-domain>]
    <group>
    <user> [<user> ...]
```

**6. Đặt lại các thuộc tính của group**
```
openstack group set
    [--domain <domain>]
    [--name <name>]
    [--description <description>]
    <group>
```

**7. Hiển thị thông tin group**
```
openstack group show
    [--domain <domain>]
    <group>
```
## 2.4. Role và phân công vai trò của role

**1. Liệt kê danh sách các role có sẵn** 
```
openstack role list
```
```
+----------------------------------+---------------+
| ID                               | Name          |
+----------------------------------+---------------+
| 71ccc37d41c8491c975ae72676db687f | Member        |
| 149f50a1fe684bfa88dae76a48d26ef7 | ResellerAdmin |
| 9fe2ff9ee4384b1894a90878d3e92bab | _member_      |
| 6ecf391421604da985db2f141e46a7c8 | admin         |
| deb4fffd123c4d02a907c2c74559dccf | anotherrole   |
+----------------------------------+---------------+
```

**2. Tạo role**

Người dùng có thể là thành viên của nhiều dự án. Để chỉ định người dùng cho nhiều dự án, hãy xác định vai trò và chỉ định vai trò đó cho một cặp người dùng-dự án.

Tạo role mới có tên là `new-role`
```
openstack role create new-role
```
```
+-----------+----------------------------------+
| Field     | Value                            |
+-----------+----------------------------------+
| domain_id | None                             |
| id        | a34425c884c74c8881496dc2c2e84ffc |
| name      | new-role                         |
+-----------+----------------------------------+
```

**3. Chỉ định vai trò của role** 
Để chỉ định người dùng cho một dự án, bạn phải chỉ định vai trò cho một cặp người dùng-dự án. Để thực hiện việc này, bạn cần ID người dùng, vai trò và dự án.

- Liệt kê người dùng và ghi chú ID người dùng mà bạn muốn chỉ định cho role

```
openstack user list
```
```
+----------------------------------+----------+
| ID                               | Name     |
+----------------------------------+----------+
| 6ab5800949644c3e8fb86aaeab8275c8 | admin    |
| dfc484b9094f4390b9c51aba49a6df34 | demo     |
| 55389ff02f5e40cf85a053cc1cacb20c | alt_demo |
| bc52bcfd882f4d388485451c4a29f8e0 | nova     |
| 255388ffa6e54ec991f584cb03085e77 | glance   |
| 48b6e6dec364428da89ba67b654fac03 | cinder   |
| c094dd5a8e1d4010832c249d39541316 | neutron  |
| 6322872d9c7e445dbbb49c1f9ca28adc | new-user |
+----------------------------------+----------+
```

- Liệt kê ID vai trò và ghi chú ID vai trò bạn muốn chỉ định
```
openstack role list
```
```
+----------------------------------+---------------+
| ID                               | Name          |
+----------------------------------+---------------+
| 71ccc37d41c8491c975ae72676db687f | Member        |
| 149f50a1fe684bfa88dae76a48d26ef7 | ResellerAdmin |
| 9fe2ff9ee4384b1894a90878d3e92bab | _member_      |
| 6ecf391421604da985db2f141e46a7c8 | admin         |
| deb4fffd123c4d02a907c2c74559dccf | anotherrole   |
| bef1f95537914b1295da6aa038ef4de6 | new-role      |
+----------------------------------+---------------+
```
- Liệt kê các dự án và ghi chú ID dự án mà bạn muốn gán cho role
```
openstack project list
```
```
+----------------------------------+--------------------+
| ID                               | Name               |
+----------------------------------+--------------------+
| 0b0b995694234521bf93c792ed44247f | new-project        |
| 29c09e68e6f741afa952a837e29c700b | admin              |
| 3a7ab11d3be74d3c9df3ede538840966 | invisible_to_admin |
| 71a2c23bab884c609774c2db6fcee3d0 | service            |
| 87e48a8394e34d13afc2646bc85a0d8c | alt_demo           |
| fef7ae86615f4bf5a37c1196d09bcb95 | demo               |
+----------------------------------+--------------------+
```

- Chỉ định vai trò cho cặp user-project
```
openstack role add --user USER_NAME --project TENANT_ID ROLE_NAME
```
*Ví dụ*: gán `new-role` cho cặp `demo` và `test-project`:
```
openstack role add --user demo --project test-project new-role
```
- Xác minh việc chỉ định role
```
openstack role assignment list --user USER_NAME \
  --project PROJECT_ID --names
```
```
+----------------------------------+-------------+---------+------+
| ID                               | Name        | Project | User |
+----------------------------------+-------------+---------+------+
| a34425c884c74c8881496dc2c2e84ffc | new-role    | demo    | demo |
| 04a7e3192c0745a2b1e3d2baf5a3ee0f | Member      | demo    | demo |
| 62bcf3e27eef4f648eb72d1f9920f6e5 | anotherrole | demo    | demo |
+----------------------------------+-------------+---------+------+
```

**4. Xem chi tiết vai trò**

Xem chi tiết cho một role cụ thể 

```
openstack role show ROLE_NAME
```
```
+-----------+----------------------------------+
| Field     | Value                            |
+-----------+----------------------------------+
| domain_id | None                             |
| id        | a34425c884c74c8881496dc2c2e84ffc |
| name      | new-role                         |
+-----------+----------------------------------+
```

**5. Xóa một role**

- Lệnh xóa role openstack
```
openstack role remove --user USER_NAME --project TENANT_ID ROLE_NAME
```
- Xác minh lại việc xóa role
```
openstack role list --user USER_NAME --project TENANT_ID
```

*Tài liệu tham khảo*

[1] [https://docs.openstack.org/keystone/queens/admin/cli-manage-projects-users-and-roles.html](https://docs.openstack.org/keystone/queens/admin/cli-manage-projects-users-and-roles.html)

[2] [https://docs.openstack.org/keystone/queens/cli/index.html](https://docs.openstack.org/keystone/queens/cli/index.html)