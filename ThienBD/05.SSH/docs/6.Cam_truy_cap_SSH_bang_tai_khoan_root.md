# Cấm truy cập ssh bằng tài khoản root
Để vô hiệu hóa đăng nhập root, mở tập tin cấu hình ssh /etc/ssh/sshd_config

`vi /etc/ssh/sshd_config`

Tìm kiếm cho các dòng sau đây trong tập tin.

`#PermitRootLogin no`
Loại bỏ các '#' từ đầu dòng.

`PermitRootLogin no`

Tiếp theo, chúng ta cần phải khởi động lại dịch vụ SSH 
`/etc/init.d/sshd restart`

Như vậy ta đã cấm truy cập ssh bằng tài khoản root, chỉ có thể truy cập bằng user sau đó mới có thể đăng nhập root
Để cho phép truy cập bằng tài khoản root ta lại thêm `#` lại vào dòng `PermitRootLogin no`