# 1. Tải bản Window server 2022
Truy cập đường link : [https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022)

Bấm vào liên kết như phía dưới hình , dẫn đến một trang mới 

![Alt text](../imgs/73.png)

Ở đây ta chọn phiên bản phù hợp để tải 

![Alt text](../imgs/74.png)

Tiếp theo cần tải 1 bản win11.iso về , ta truy cập đường link [https://www.microsoft.com/software-download/windows11](https://www.microsoft.com/software-download/windows11)

Ở đây ta chọn phiên bản sau đó sẽ bấm tải 
![Alt text](../imgs/76.png)

Tiếp theo một đường link sẽ hiện lên có hiệu lực trong 24h , bây giờ đã có thể tải về 

![Alt text](../imgs/77.png)

# 2. Cài đặt 
Vào VMWare chọn file -> New virtual machine

![Alt text](../imgs/80.png)

Ở đây ta chọn mục Custom Advanced

![Alt text](../imgs/78.png)

Một bảng thông số sẽ hiện ra , ở đây ta có thể chọn phiên bản VMWare để cài đặt , ta tiếp tục bấm Next  

![Alt text](../imgs/79.png)

Ở cửa sổ mới ta chọn I will install operating system later rồi bấm Next

![Alt text](../imgs/81.png)

Cửa số mới hiện lên ta có thể chọn hệ điều hành và phiên bản cài đặt , ở đây ta sẽ chọn hệ điều hành Microsoft Windows , phiên bản window server 2022 

![Alt text](../imgs/82.png)

Tiếp tục bấm next ta đến bước chọn thư mục để lưu 

![Alt text](../imgs/83.png)

Tiếp theo ta chọn mục UEFI và bấm next

![Alt text](../imgs/84.png)

Tiếp tục bấm next

![Alt text](../imgs/85.png)

Bộ nhớ hệ thống ta để là 4gb

![Alt text](../imgs/86.png)

Chế độ card mạng ta chọn NAT

![Alt text](../imgs/87.png)

Tiếp tục bấm Next 

![Alt text](../imgs/88.png)

Với ổ đĩa máy ảo ta chọn SCSI hoặc SATA, ở đây ta sẽ chọn SATA

![Alt text](../imgs/89.png)

Chọn Create a new virtual disk để tạo một ổ đĩa ảo mới 

![Alt text](../imgs/90.png)

Chọn Splitting virtual disk into multiple files và bấm Next

![Alt text](../imgs/91.png)

Tiếp tục bấm Next

![Alt text](../imgs/92.png)

Ở cửa sổ mới ta chọn Customize Hardware

![Alt text](../imgs/93.png)

Vào mục CD/DVD (SATA) chọn Use ISO image file , ở đây ta sẽ chọn bộ cài đặt window server 2022 .iso. Sau đó ta bấm close, quay lại cửa sổ trước đó và bấm finish

![Alt text](../imgs/94.png)

Quay ra màn hình lớn ta bấm Power On This Virtual Machine

![Alt text](../imgs/95.png)

Sau khi chạy màn hình hiện lên với phần chọn ngôn ngữ

![Alt text](../imgs/96.png)

Tiếp tục nhấn Install now

![Alt text](../imgs/97.png)

Tiếp tục ta chọn phiên bản Datacenter và bấm next

![Alt text](../imgs/98.png)

Tích vào ô Accept và bấm next

![Alt text](../imgs/99.png)

Chọn custom 

![Alt text](../imgs/100.png)

Tiếp tục bấm Next

![Alt text](../imgs/101.png)

Sau khi chạy cài đặt xong , một bảng hiện lên yêu cầu tạo mật khẩu cho tài khoản admin

![Alt text](../imgs/102.png)

Như vậy là ta đã cài đặt thành công window server 2022
