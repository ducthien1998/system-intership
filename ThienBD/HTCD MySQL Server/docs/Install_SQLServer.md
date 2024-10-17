# CÀI ĐẶT SQL SERVER TRÊN WINDOW

# 1. Tải bộ cài 
Truy cập đường link : `https://www.microsoft.com/vi-vn/sql-server/sql-server-downloads` lựa chọn bản cài đặt 
Kéo xuống chọn thiết lập cài đặt như hình
![alt text](../imgs/1.png)

Chọn cài đặt trên Window

![alt text](../imgs/2.png)

Điền thông tin theo yêu cầu 

![alt text](../imgs/3.png)

Chấp nhận điều khoản và nhấp chọn download

![alt text](../imgs/4.png)

Chọn bản cài được cung cấp và chờ tải về 

![alt text](../imgs/5.png)

# 2. Cài đặt SQL server

Mở file đã tải về và bắt đầu cài đặt 
![alt text](../imgs/6.png)

Sau khi mở ứng dụng có 3 lựa chọn tùy mục đích khác nhau cho người dùng

![alt text](../imgs/7.png)

- **Basic**: đây là tùy chọn đơn giản nhất cho người dùng, tại đây ứng dụng sẽ tự động cài đặt các chức năng cơ bản cho bạn.
- **Custom**: đây là phần cài đặt cho các bạn muốn sử dụng chuyên sâu hơn, khi chọn bạn sẽ được tự cài đặt các cấu hình của phần mềm.
- **Download Media**: khi chọn vào mục này, hệ thống sẽ tải về cho bạn một file cài đặt offline nhằm mục đích cài được trên nhiều thiết bị khác nhau mà không cần load lại từ đầu. 

Ở đây ta sẽ chọn option là Custom   
Ở đây bộ cài đặt sẽ tự tạo một thư mục cho mình có tên SQL2022   
Tiếp tục bấm install và chờ cài đặt   

![alt text](../imgs/8.png)

**1. Cài đặt new sql server standalone installation or add features to an existing installation**

Ở cửa sổ mới chọn `Installation` -> `New SQL server standalone....`

![alt text](../imgs/10.png)

Ở mục Specify a free edition chọn Developer sau đó chọn Next

![alt text](../imgs/11.png)

Tiếp tục chọn accept và bấm next

![alt text](../imgs/12.png)

Tiếp tục bấm next

![alt text](../imgs/13.png)

Tích bỏ chọn Azure và bấm next khi chưa chưa sử dụng tới 

![alt text](../imgs/14.png)

Chọn các option mong muốn hoặc chọn select all nếu sử dụng tất cả , sau đó bấm next

![alt text](../imgs/15.png)

Chọ default instance và bấm next

![alt text](../imgs/16.png)

Tiếp tục chọn next

![alt text](../imgs/17.png)

Ở cửa sổ tiếp theo hiện tất cả các option sẽ cài đặt , tiếp tục bấm next

![alt text](../imgs/18.png)

Chọn Mixed mode -> điền password và chọn add current user 

![alt text](../imgs/19.png)

Tiếp tục chọn add current user và bấm next

![alt text](../imgs/20.png)

Tiếp tục chọn next

![alt text](../imgs/21.png)

Tiếp tục chọn next

![alt text](../imgs/22.png)

Tiếp tục chọn install

![alt text](../imgs/23.png)

Sau khi cài đặt xong sẽ hiện các dịch vụ lúc trước chọn cài đặt thành công 

![alt text](../imgs/24.png)

**2. Cài đặt SQL Server Management Tools**

Ở cửa sổ mới chọn `Installation` -> `SQL Server Management Tools`

![alt text](../imgs/25.png)

Đường dẫn sẽ chuyển hướng sang 1 trang web khác, ta chọn download theo đường dẫn được cung cấp 

![alt text](../imgs/26.png)

Sau khi tải về hãy chạy chương trình với quyền admin

![alt text](../imgs/27.png)

Chọn Install 

![alt text](../imgs/28.png)

Sau khi cài đặt xong sẽ có thông báo Setup Complete , bấm close để kết thúc 

![alt text](../imgs/29.png)

Sau khi cài đặt ta có thể tìm kiếm SQL Server Management Studio trên thanh tìm kiếm của window

![alt text](../imgs/30.png)

Trong màn hình đăng nhập chọn các option và bấm connection

![alt text](../imgs/31.png)

Như vậy là đã cài đặt xong 

![alt text](../imgs/32.png)

