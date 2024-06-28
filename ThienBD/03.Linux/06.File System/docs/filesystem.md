# File system
File system là những thành phần vô cùng quan trọng trong một hệ điều hành,được sử dụng để điều khiển cách dữ liệu lưu trữ và truy vấn...Linux có khả năng hỗ trợ nhiều loại file system n
***Các kiểu file system***

- *xfs*: đây là file system mặc định trên centos 7, có các đặc điểm sau 
  - hạn chế được tình trạng phân mảnh dữ liệu 
  - hỗ trợ file system lên đến 6 exabyte tương đương 18 triêu terabyte
  - hỗ trợ file lên đến 8 exabyte
  - cấu trúc thư mục chứa hàng chục triệu đối tượng
  - kích thước tối đa của xfs partition là 500TB

- *ext4*: fiel system này giảm bớt hiện tượng phân mảnh dữ liệu trong ổ cứng , hỗ trợ file system và file có dung lượng lớn và tốc độ hoạt động nhanh
- *Vfat* : Đây là file system FAT trên Window
- *Swap* : partition swap được sử dụng để hỗ trợ virtual memory. Trong trường hợp không đủ RAM để xử lý thì data sẽ được lưu vào swap và xử lý . Swap còn gọi là không gian hoán đổi bộ nhớ vật lý. Kích thước để swap hoạt động hiệu quả nhất là bằng 2 lần bộ nhớ RAM
-*BIOS Boot* :Được sử dụng cho việc khởi động một thiết bị với một GUI partition table (GPT) .Kích thước của partition này rất nhỏ ( khoảng 1 MB ). Tuy nhiên bạn không cần phải tạo partition này nếu đã sử dụng Master Boot Record (MBR)
