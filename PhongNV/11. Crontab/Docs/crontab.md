# ***1. Crontab là gì***
Crontab chính là một cách để tạo và thực hiện chạy các lệnh dựa theo một chu kỳ xác định nào đó. Đây là một tiện ích giúp cho người dùng lập lịch trình với mục đích chạy các dòng lệnh từ phía server để nhằm thực thi một hoặc nhiều hơn các công việc theo một khung thời gian đã được thiết lập sẵn. 
# ***2. Cách thức hoạt động của Crontab***
Về cách thức hoạt động, một cron schedule đơn giản chính là một text file. Mỗi một người dùng đều sẽ có cho mình một cron schedule riêng. File này thường sẽ nằm ở vị trí  /var/spool/cron. Ngoài ra, Crontab files sẽ không cho phép người dùng tạo hoặc thực hiện chỉnh sửa trực tiếp đối với bất cứ trình text editor nào. Ngoại trừ việc bạn sử dụng lệnh crontab.

## ***2.1 Một số lệnh crontab mà bạn thường dùng như sau:***
```crontab -e```: Đây là lệnh tạo hoặc chỉnh sửa file crontab 

```crontab -l```: Đây là lệnh hiển thị file crontab 

```crontab -r```: Đây là lệnh xóa file crontab
# ***3. Cấu trúc của crontab***
Một crontab file có 5 trường xác định thời gian, cuối cùng là lệnh sẽ được chạy định kỳ, cấu trúc như sau:
```
*     *     *     *     *     command to be executed
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- day of week (0 - 6) (Sunday=0)
|     |     |     +------- month (1 - 12)
|     |     +--------- day of month (1 - 31)
|     +----------- hour (0 - 23)
+------------- min (0 - 59)
```
1. Trường đầu tiên mô tả phút (giá trị từ 0-59)
2. Trường thứ 2 mô tả giờ (giá trị từ 0-23)
3. Trường thứ 3 mô tả ngày của tháng (giá trị từ 1-31)
4. Trường thứ 4 mô tả tháng (giá trị từ 1-12)
5. Trường thứ 5 mô tả ngày trong tuần (giá trị từ 0-6)
6. Trường thứ 6 mô tả chúng ta sẽ thực thi câu lệnh với quyền của account nào
7. Trường thứ 7 mô tả câu lệnh chúng ta sẽ thực thi

***Ví dụ***:
sẽ thực thi tác vụ mỗi 5 phút.
```
*/5 * * * *
```

sẽ thực thi tác vụ vào phút thứ 5 của mỗi giờ.
```
5 * * * * 
```
Chạy script vào 5 giờ sáng mỗi ngày
```
0 5 * * *
```

# ***Tài liệu tham khảo***
<https://vietnix.vn/crontab/>
<https://viblo.asia/p/crontab-cong-cu-lap-lich-huu-ich-tren-linux-L4x5xdMw5BM>








