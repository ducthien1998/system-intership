# 1. Tải bản ISO centos 7 
Truy cập đường link : [https://www.centos.org/download/](https://www.centos.org/download/)

Sau khi truy cập , chọn mục Centos Linux , chọn X86_64
![Alt text](../imgs/1.png)
Giao diện chuyển đến các đường link lưu trữ
![Alt text](../imgs/2.png)
Ở đây sẽ xuất hiện các phiên bản cài đặt , ta sẽ chọn bản đầy đủ 

![Alt text](../imgs/3.png)

# 2. Cài đặt 

Vào VMWare chọn file -> New virtual machine

![Alt text](../imgs/4.png)

Tiếp tục chọn Typical rồi bấm Next  

![Alt text](../imgs/5.png)

Chọn " I will install operating system later " rồi bấm Next

![Alt text](../imgs/6.png)

Tiếp tục chọn hệ điều hành Linux - phiên bản Centos 7 64-bit

![Alt text](../imgs/7.png)

Chọn thư mục lưu 

![Alt text](../imgs/8.png)

Chọn "Split virtual disk into multiple files" sau đó bấm Next

![Alt text](../imgs/9.png)

Tiếp tục bấm Finish

![Alt text](../imgs/10.png)


Sau khi thiết lập máy ảo ta sẽ thiết lập phần cứng 

Trong giao diện VMWare ta chọn "Edit virtual machine settings"

![Alt text](../imgs/11.png)

Ở mục CD/DVD(IDE) ta chọn Use ISO image file và chọn file Centos 7 đã tải về và bấm OK

![Alt text](../imgs/12.png)

Quay ra ngoài chọn Power on this virtual machine

![Alt text](../imgs/13.png)

Tại đây chọn ngôn ngữ 

![Alt text](../imgs/14.png)

Sau khi lựa chọn ngôn ngữ , ta sẽ cài đặt bên trong hệ điều hành , đầu tiên sẽ chỉnh lại thời gian ( date and time )

![Alt text](../imgs/15.png)

Ta chỉnh lại về múi giờ Asia - Ho Chi Minh rồi bấm Done

![Alt text](../imgs/16.png)

Trong mục software selection ta chọn mục minimal install

![Alt text](../imgs/17.png)

Trong mục installation destination , ta chọn ổ đĩa và bấm Done

![Alt text](../imgs/18.png)

Trong mục Network And Hostname ta chuyển trạng thái sang ON và bấm Done

![Alt text](../imgs/19.png)

Tiếp tục bấm Begin Installnation 

![Alt text](../imgs/20.png)


Giao diện hiện ra bao gồm Root password và user creation 

![Alt text](../imgs/21.png)


Ta sẽ vào phần Root password thiết lập mật khẩu 
Sau khi đặt password ta bấm Done

![Alt text](../imgs/22.png)

Tiếp tục vào phần user creation để tạo 

![Alt text](../imgs/23.png)

Sau khi thiết lập cài đặt xong ta bấm Reboot và để cho máy chạy 

![Alt text](../imgs/24.png)

Hoàn tất cài đặt 
![Alt text](../imgs/25.png)