# 1. Tải bản ISO CentOS Stream 9 
Truy cập đường link :[https://centos.org/download/](https://centos.org/download/)

Sau khi truy cập , chọn mục CentOS Stream , chọn bản 9, chọn X86_64

![Alt text](../imgs/26.png)

# 2. Cài đặt 

Vào VMWare chọn file -> New virtual machine
![Alt text](../imgs/27.png)

Tiếp tục chọn Typical rồi bấm Next  

![Alt text](../imgs/28.png)

Chọn " I will install operating system later " rồi bấm Next 

![Alt text](../imgs/29.png)

Tiếp tục chọn hệ điều hành Linux - phiên bản CentOS 8 64-bit 

![Alt text](../imgs/30.png)

Đặt tên và chọn thư mục lưu

![Alt text](../imgs/31.png)

Chọn "Split virtual disk into multiple files" sau đó bấm Next

![Alt text](../imgs/32.png)

Tiếp tục bấm Finish

Sau khi thiết lập máy ảo ta sẽ thiết lập phần cứng  
Trong giao diện VMWare ta chọn "Edit virtual machine settings"

![Alt text](../imgs/33.png)

Ở mục CD/DVD(IDE) ta chọn Use ISO image file và chọn file CentOS 9 đã tải về và bấm OK

![Alt text](../imgs/34.png)

Quay ra ngoài chọn Power on this virtual machine

![Alt text](../imgs/35.png)

Tại đây chọn ngôn ngữ 

![Alt text](../imgs/36.png)

Sau khi lựa chọn ngôn ngữ , ta sẽ cài đặt bên trong hệ điều hành , đầu tiên sẽ chỉnh lại thời gian ( date and time )
Ta chỉnh lại về múi giờ Asia - Ho Chi Minh rồi bấm Done
![Alt text](../imgs/37.png)

Trong mục software selection ta chọn mục minimal install
![Alt text](../imgs/38.png)

Ta vào mục Installation Destination để thiết lập 
Chọn mục Custom và bấm Done
![Alt text](../imgs/39.png)

Bấm vào dấu cộng để thêm từng mục 
![Alt text](../imgs/40.png)

Vùng /boot ta để 500MB rồi bấm add mount point

![Alt text](../imgs/41.png)

Vùng /home ta để 2GiB rồi bấm add mount point

![Alt text](../imgs/42.png)

Vùng /swap ta để 2GiB rồi bấm add mount point

![Alt text](../imgs/43.png)

Vùng /var ta để 15GiB rồi bấm add mount point

![Alt text](../imgs/44.png)

Thư mục gốc / để 10.5GiB rồi bấm add mount point

![Alt text](../imgs/45.png)

Sau khi thiết lập xong thì bấm Done hiện cửa sổ mới chọn Accept Changes
![Alt text](../imgs/46.png)

Tiếp theo ta vào đặt mật khẩu cho Root
Sau khi tạo password thì chọn Allow root SSH login with password và bấm Done

![Alt text](../imgs/47.png)

Tiếp tục vào phần user creation để tạo, sau khi tạo thông tin xong thì bấm Done

![Alt text](../imgs/48.png)

Sau khi khai báo thông tin và thiết lập thì bấm Begin installation 

![Alt text](../imgs/49.png)

Cài đặt thành công 


![Alt text](../imgs/50.png)