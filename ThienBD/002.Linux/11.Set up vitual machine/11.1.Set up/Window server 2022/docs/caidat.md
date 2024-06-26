# 1. Tải bản Window server 2022
Truy cập đường link : [https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022)

Bấm vào liên kết như phía dưới hình , dẫn đến một trang mới 

![Alt text](../imgs/1.png)

Ở đây ta chọn phiên bản phù hợp để tải 

![Alt text](../imgs/2.png)

Tiếp theo cần tải 1 bản win11.iso về , ta truy cập đường link [https://www.microsoft.com/software-download/windows11](https://www.microsoft.com/software-download/windows11)

Ở đây ta chọn phiên bản sau đó sẽ bấm tải 
![Alt text](../imgs/4.png)

Tiếp theo một đường link sẽ hiện lên có hiệu lực trong 24h , bây giờ đã có thể tải về 

![Alt text](../imgs/5.png)

# 2. Cài đặt 
Vào VMWare chọn file -> New virtual machine

![Alt text](../imgs/8.png)

Ở đây ta chọn mục Custom Advanced

![Alt text](../imgs/6.png)

Một bảng thông số sẽ hiện ra , ở đây ta có thể chọn phiên bản VMWare để cài đặt , ta tiếp tục bấm Next  

![Alt text](../imgs/7.png)

Ở cửa sổ mới ta chọn I will install operating system later rồi bấm Next

![Alt text](../imgs/9.png)

Cửa số mới hiện lên ta có thể chọn hệ điều hành và phiên bản cài đặt , ở đây ta sẽ chọn hệ điều hành Microsoft Windows , phiên bản window server 2022 

![Alt text](../imgs/10.png)

Tiếp tục bấm next ta đến bước chọn thư mục để lưu 

![Alt text](../imgs/11.png)

Tiếp theo ta chọn mục UEFI và bấm next

![Alt text](../imgs/12.png)

Tiếp tục bấm next

![Alt text](../imgs/13.png)

Bộ nhớ hệ thống ta để là 4gb

![Alt text](../imgs/14.png)

Chế độ card mạng ta chọn NAT

![Alt text](../imgs/15.png)

Tiếp tục bấm Next 

![Alt text](../imgs/16.png)

Với ổ đĩa máy ảo ta chọn SCSI hoặc SATA, ở đây ta sẽ chọn SATA

![Alt text](../imgs/17.png)

Chọn Create a new virtual disk để tạo một ổ đĩa ảo mới 

![Alt text](../imgs/18.png)

Chọn Splitting virtual disk into multiple files và bấm Next

![Alt text](../imgs/19.png)

Tiếp tục bấm Next

![Alt text](../imgs/20.png)

Ở cửa sổ mới ta chọn Customize Hardware

![Alt text](../imgs/21.png)

Vào mục CD/DVD (SATA) chọn Use ISO image file , ở đây ta sẽ chọn bộ cài đặt window server 2022 .iso. Sau đó ta bấm close, quay lại cửa sổ trước đó và bấm finish

![Alt text](../imgs/22.png)

Quay ra màn hình lớn ta bấm Power On This Virtual Machine

![Alt text](../imgs/23.png)

Sau khi chạy màn hình hiện lên với phần chọn ngôn ngữ

![Alt text](../imgs/24.png)

Tiếp tục nhấn Install now

![Alt text](../imgs/25.png)

Tiếp tục ta chọn phiên bản Datacenter và bấm next

![Alt text](../imgs/26.png)

Tích vào ô Accept và bấm next

![Alt text](../imgs/27.png)

Chọn custom 

![Alt text](../imgs/28.png)

Tiếp tục bấm Next

![Alt text](../imgs/29.png)

Sau khi chạy cài đặt xong , một bảng hiện lên yêu cầu tạo mật khẩu cho tài khoản admin

![Alt text](../imgs/30.png)

Như vậy là ta đã cài đặt thành công window server 2022
