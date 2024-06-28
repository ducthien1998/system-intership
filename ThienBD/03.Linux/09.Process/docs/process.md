# 1.Process là gì 
## 1.1.Định nghĩa
Tiến trình được hiểu đơn giản là một chương trình đang chạy trong hệ điều hành, một tiến trình có thể phân thanh một hay nhiều tiến trình con 
## 1.2.Phân loại 
- Init process : là tiến trình đầu tiên được khởi động sau khi bạn lựa chọ hệ điều hành trong boot loader. Trong cây tiến trình, Init process là tiến trình cha của các tiến trình khác . Init process có đặc điểm sau 
  - PID = 1
  - Không thể kill init process

- Parent process ~ Child process

Trong hệ điều hành linux các tiến trình được phân thành parents process và child process. Một tiến trình khi thực hiện lệnh fork để tạo ra một tiến trình mới thì được gọi là parent process . Tiến trình mới tạo được gọi là child process

![Alt text](../imgs/1.png)

Một parents process có thể có nhiều child process nhưng một child process chỉ có một parent process. Khi quan sát thông tin 1 tiến trình , ngoài PID ta cần để ý tới PPID , nó sẽ cho ta thông tin về parent process của tiến trình đó 

# 2.Quản lý tiến trình 

- Liệt kê các quy trình
`ps -A` hoặc `ps -e`

- Xem các tiến trình liên kết với terminal

`ps -T`

- Xem các tiến trình không liên kết với terminal

`ps -a`

- Phủ định các tùy chọn được chỉ định

`ps -T`
`ps -T --deselect`

- Hiển thị các cột tùy chỉnh đầu ra 

`ps -eo pid,name, pcpu, stime, pri, f`

- Đổi tên các cột đầu ra

`ps -e -o pid=Process_ID, uid=User_ID, com=COMMAND`

- Liệt kê các tiến trình đang chạy 

`ps -ax`

- Các tiến trình hiển thị ở định dang BSD

`ps au`

- Danh sách định dạng đầy đủ các tiến trình

`ps -ef`
`ps -eF`

Đầu ra được đề cập ở trên chứa các thông tin sau 

- UID :ID người dùng của người dùng chịu trách nhiệm tiến trình
- PID : ID quy trình của mục nhập 
- PPID : ID tiến trình cảu tiến trình cha 
- C: Thông tin về lịch chạy và lượng sử dụng CPU của tiến trình 
- STIME: Thời gian bắt đầu tiến trình 
- TTY : Tên của terminal mà bạn hiện đang sử dụng 
- TIME : Lương thời gian CPU được sử dụng bởi tiến trình 
- CMD : Lệnh thực hiện quy trình 
- 


*Tài liệu tham khảo*

[1] [https://wiki.tino.org/docs/tim-hieu-ve-tien-trinh-trong-linux/](https://wiki.tino.org/docs/tim-hieu-ve-tien-trinh-trong-linux/)

[2] [https://funix.edu.vn/chia-se-kien-thuc/cach-hien-thi-thong-tin-quy-trinh-tren-he-thong-linux-bang-lenh-ps/](https://funix.edu.vn/chia-se-kien-thuc/cach-hien-thi-thong-tin-quy-trinh-tren-he-thong-linux-bang-lenh-ps/)