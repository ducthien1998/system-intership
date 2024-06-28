# 1.Systemd là gì 
## 1.1.Khái niệm

Systemd là 1 công cụ (System Tool) của Linux được phát triển bởi nhóm Red Hat. Nó bao gồm nhiều tính năng, bao gồm một hệ thống bootstrapping được sử dụng để khởi động và quản lý các tiến trình (proccess) trong hệ thống. Nó hiện là hệ thống khởi tạo mặc định trên hầu hết các bản phân phối Linux. Systemd thuộc nhóm chương trình: system and service manager – nó quản lý (bật/tắt/khởi động lại…) các dịch vụ chạy trên máy từ lúc bật máy cho đến lúc tắt máy. Nó cũng quản lý luôn cả hệ thống (system) cụ thể là các công việc: set tên máy (hostname), cấu hình loopback interface (lo trong output của lệnh `ip addr`), thiết lập và mount các filesystem như /sys /proc …

## 1.2.Tính năng chính

- Cơ chế khởi động đồng bộ 
- Quản lý dịch vụ
- Quản lý tiến trình
- Quản lý tập tin nhật ký
- Quản lý tài nguyên
- Phát triển và khắc phục lỗi 

## 1.3.Các thành phần của Systemd
Về cơ bản thì systemd tương đương với một chương trình quản lý hệ thống và các dịch vụ trong Linux .Nó cung cấp một số các tiện ích như sau 

- `systemctl` : dùng để quản lý trạng thái của các dịch vụ hệ thống ( bắt đầu , kết thúc, khởi động lại hoặc kiểm tra trạng thái hiện tại)
- `journald` : dùng để quản lý nhật ký hoạt động của hệ thống ( hay còn gọi là ghi log )
- `logind` : dùng để quản lý theo dõi việc đăng nhập/đăng xuất của người dùng
- `network` : dùng đẻ quản lý các kết nối mạng thông qua các cấu hình mạng 
- `timedated` : dùng để quản lý thời gian hệ thống hoặc thời gian mạng 
- `udev` : dùng đẻ quản lý các thiết bị firmware

# 2.Unit file

Tất cả các chương trình được quản lý bởi **systemd** đều được thực thi dưới dạng `daemon` hay `background` bên dưới nền và được cấu hình thành 1 file configuration gọi là unit file. Các unit file này sẽ bao gồm 12 loại 
- service (các file quản lý hoạt động cảu 1 số chương trình)
- socket (quản lý các kết nối)
- device(quản lý thiết bị)
- mount(gắn thiết bị)
- automount (tự động gắn thiết bị)
- swap (vùng không gian bộ nhớ trên điã cứng )
- target (quản lý tạo liên kết)
- path (quản lý các đường dẫn)
- timer(dùng cho cron-job để lập lịch)
- snapshot(dùng cho quản lý tiến trình)
- scope (quy định không gian hoạt động)

# 3.Service
Mặc dù có 12 loại unit file trong systemd , tuy nhiên có lẽ service là lọại thường được quan tâm nhất . Loại này sẽ được khởi động khi bật máy và luôn chạy ở chế độ nền ( `daemon hoặc background`) Các service thường sẽ được cấu hình trong các file riêng biệt và được quản lý thông qua câu lệnh `systemctl` .Ta có thể sử dụng câu lệnh sau để xem các `service` đã được kích hoạt bởi hệ thống : ` systemctl list-unit | grep -e `.service` ` hoặc `systemctl -t service` . Bộ ba tùy chọn quen thuộc của systemctl sẽ dùng khi muốn bật tắt một service

- start : bật service
- stop : tắt service
- restart : tắt service rồi bật lại ( ngoài ra còn reload để tải lại file cấu hình , tuy nhiên chỉ có 1 số chương trình hỗ trợ) 

Ba tùy chọn trên sẽ được sử dụng khi hệ thóng đang hoạt động , tuy nhiên `systemctl ` cũng cung cấp 2 tùy chọn khác để điều khiển việc hoạt động của service từ lúc khởi động hệ thống

- enbale : service sẽ được khởi động cùng hệ thống
- disable : service sẽ không được khởi động cùng hệ thống

# 4.Sử dụng Systemd

## 4.1.Quản lý dịch vụ 

Để khởi động một dịch vụ, sử dụng lệnh: `systemctl start <tên-dịch-vụ>`


Để tắt một dịch vụ, sử dụng lệnh : `systemctl stop <tên-dịch-vụ>`

Để khởi động lại một dịch vụ, sử dụng lệnh: `systemctl restart <tên-dịch-vụ>`

Để bật một dịch vụ khởi động cùng hệ thống, sử dụng lệnh :`systemctl enable <tên-dịch-vụ>`

Để tắt một dịch vụ không khởi động cùng hệ thống, sử dụng lệnh: `systemctl disable <tên-dịch-vụ>`


## 4.2.Quản lý tiến trình

Để liệt kê các tiến trình đang chạy, sử dụng lệnh: `systemctl status <Tên dịch vụ>`

Để xem các tiến trình đang chạy của một dịch vụ, sử dụng lệnh:`systemctl status <tên-dịch-vụ> -l`

## 4.3.Quản lý tập tin nhật ký

Để xem các thông báo của một dịch vụ trong tập tin nhật ký, sử dụng lệnh: `journalctl -u <tên-dịch-vụ>`

Để xem các thông báo trong tập tin nhật ký của toàn bộ hệ thống, sử dụng lệnh:`journalctl`

## 4.4.Cách list các dịch vụ đang chạy ở dưới system


Để liệt kê tất cả các dịch vụ được tải (dịch dụ đó đang hoạt động, đang chạy, đã thoát hoặc chạy không thành công) trên hệ thống thì chúng ta có thể sử dụng tùy chọn type và list-units để hiển thị như sau: `systemctl list-units --type=service`

Khi chúng ta muốn liệt kê tất cả các dịch vụ đang hoạt động, đang chạy và những dịch vụ đã thoát, bạn có thể thêm tùy chọn –state cùng với giá trị active như sau: `systemctl list-units --type=service --state=active`

Hoặc bạn cũng có thể sử dụng lệnh sau:` systemctl --type=service --state=active`


***Tài liệu tham khảo ***

[1] [https://dotrungquan.info/huong-dan-kiem-tra-dich-vu-dang-chay-duoi-systemd/](https://dotrungquan.info/huong-dan-kiem-tra-dich-vu-dang-chay-duoi-systemd/)

[2] [https://viblo.asia/p/tim-hieu-va-van-dung-systemd-de-quan-ly-he-thong-linux-phan-co-ban-WAyK8kN65xX](https://viblo.asia/p/tim-hieu-va-van-dung-systemd-de-quan-ly-he-thong-linux-phan-co-ban-WAyK8kN65xX)