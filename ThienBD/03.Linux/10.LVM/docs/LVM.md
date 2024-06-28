# 1. LVM là gì 
## 1.1.Khái niệm
Logical Volume Manager (LVM) : LVM là kỹ thuật quản lý việc thay đổi kích thước lưu trữ của ổ cứng. Là một phương pháp ấn định không gian ổ đĩa thành những logicalvolume khiến cho việc thay đổi kích thước của một phân vùng trở nên dễ dàng. Điều này thật dễ dàng khi bạn muốn quản lý công việc của mình tại riêng một phân vùng mà muốn mở rộng nó ra lớn hơn.

Một số khái niệm liên quan:

- Physical volume: là một đĩa cứng vật lý hoặc là partition
- Volume group: là một nhóm các physical volume ( ổ đĩa ảo )
- logical volume: là các phân vùng ảo của ổ đĩa ảo

Một số lệnh cần thiết:

- Lệnh fdisk : Dùng để quản lý việc phân vùng trong ổ cứng. Là một công cụ hữu dụng tron linux tìm hiểu thêm FDISK
- Lệnh mount : Dùng để gắn một phân vùng vào thư mục root để có thể sử dụng được nó tìm hiểu thêm về mount
- Lệnh dd : Dùng Sao lưu và hồi phục toàn bộ dữ liệu ổ cứng hoặc một partition và kiểm tra tốc độ đọc của kiểu lưu trữ dữ liệu trong LVM
## 1.2.Ưu điểm và Nhược điểm của LVM#

**Ưu điểm**

- Không để hệ thống bị gián đoạn hoạt động
- Không làm hỏng dịch vụ
- Có thể kế hợp swap
- Có thể tạo ra các vùng dung lượng lớn nhỏ tuỳ ý.

**Nhược điểm**

- Các bước thiết lập phức tạp và khó khăn hơn
- Càng gắn nhiều đĩa cứng và thiết lập càng nhiều LVM thì hệ thống khởi động càng lâu.
- Khả năng mất dữ liệu cao khi một trong số các đĩa cứng bị hỏng.
- Windows không thể nhận ra vùng dữ liệu của LVM. Nếu Dual-boot ,Windows sẽ không thể truy cập dữ liệu trong LVM.


## 1.3.Những thành phần trong LVM#


- HDD : là một thiết bị lưu trữ máy tính. Nó là loại bộ nhớ không thay đổi và không bị mất dữ liệu khi ta ngừng cung cấp nguồn điện cho chúng
- Partition: là các phân vùng của ổ cứng. Mỗi một ổ cứng có 4 partition. Trong đó bao gồm 2 loại là primary partition và extended partition
- primary partition: còn được gọi là phân vùng chính, có thể khởi động và mỗi ổ cứng chỉ có tối đa 4 phân vùng này
- extended partition: Hay còn được gọi là phân vùng mở rộng của ổ cứng


## 1.4.Cách thức hoạt động các tầng của LVM:

- Tầng đầu tiên : hard drives là tầng các disk ban đầu khi chưa chia phân vùng
- Partitions: Sau đó ta chia các disk ra thành các phân vùng nhỏ hơn
- Physical volume : từ một partitions ta sẽ tạo ra được một physical
- group volume : Ta sẽ ghép nhiều physical volume thành một group volume
- Logical volume : Ta sẽ có thể tạo ra được logical volume





*Tài liệu tham khảo*

[1] [https://blog.cloud365.vn/linux%20tutorial/tong-quan-lvm/](https://blog.cloud365.vn/linux%20tutorial/tong-quan-lvm/)
