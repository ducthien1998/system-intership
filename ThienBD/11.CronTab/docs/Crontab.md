# 1.Tổng quan về Crontab
## 1.1.Crontab là gì?

Crontab là một cách để tạo và chạy các lệnh theo một chu kỳ xác định. Đây là tiện ích giúp lập lịch trình để chạy những dòng lệnh bên phía server, nhằm thực thi một hoặc nhiều công việc nào đó theo thời gian được lập sẵn.

## 1.2.Cách hoạt  động 
Một cron schedule đơn giản là một text file. Mỗi người dùng có một cron schedule riêng, file này thường nằm ở /var/spool/cron . Crontab files không cho phép bạn tạo hoặc chỉnh sửa trực tiếp với bất kỳ trình text editor nào, trừ phi bạn dùng lệnh crontab.

*Một số lệnh phổ biến *
crontab -e: tạo,  chỉnh sửa các crontab
crontab -l: Xem các Crontab đã tạo
crontab -r: xóa file crontab
## 1.3.Cài đặt Crontab

Câu lênh cài đặt
yum install cronie
Start crontab và tự động chạy mỗi khi reboot
service crond start
chkconfig crond on
# 2.Cách sử dụng 
Cron hoạt động dựa trên các lệnh được chỉ định trong cron table (crontab). Mỗi người dùng, kể cả root, đều có thể có một file cron. Các file này theo mặc định sẽ không tồn tại. Nhưng ta có thể tạo nó trong thư mục /var/spool/cron bằng cách dùng lệnh crontab -e. Ngoài ra, lệnh này cũng có thể được dùng để chỉnh sửa một file cron.

## 2.1.Cấu trúc file Crontab
Một crontab file có 5 trường xác định thời gian, cuối cùng là lệnh sẽ được chạy định kỳ, cấu trúc như sau:
Ảnh 1
Nếu một cột được gán ký tự *, nó có nghĩa là tác vụ sau đó sẽ được chạy ở mọi giá trị cho cột đó.
Ảnh 2

*Ví dụ*
Chạy script 30 phút 1 lần
30 * * * * command
Chạy script vào 3 giờ sáng mỗi ngày