# TÌM HIỂU VỀ MONITORING NETWORK

# 1.Hệ thống giám sát Monitoring là gì 
## 1.1.Khái niệm
Giám sát hệ thống mạng là việc sử dụng một hệ thống để liên tục theo dõi một thành phần trong mạng máy tính , xem xét tình trạng hoạt động của thành phần đó bên trong mạng , thông báo lại cho quản trị viên khi thành phần đang được giám sát phát sinh vấn đề .Có rất nhiều các thành phần cần được giám sát khi hệ thống hoạt động như : người dùng ,hạ tầng, dịch vụ. Việc giám sát sẽ giúp quản trị viên nhanh chóng biết được những sự cố đang xảy ra từ đó đưa ra phương án giải quyết 

## 1.2.Công dụng
- Nắm bắt những gì đang diễn ra trên hệ thống của bạn
- Thiết bị gì hay kiểu lưu lượng gì là nguyên nhân gây chậm
- Dựa vào kết quả của hệ thống monitoring chúng ta có thể điều chỉnh việc sử dụng tài nguyên (cpu,ram,disk...) sao cho phù hợp 
- Ngăn chặn các sự cố có thể xảy ra , nếu có xảy ra chúng ta cũng có thể phát hiện sớm hơn
- Giảm thiểu thời gian quản lý hệ thống 

## 1.3.Thành phần 
Thông thường một hệ thống monitoring thường có 4 thành phần chính:

- **Collector**: Được cài trên các máy agent (các máy muốn monitor), có nhiệm vụ collect metrics của host và gửi về database. Ví dụ: Cadvisor, Telegraf, Beat, ...

- **Database**: Lưu trữ các metrics mà colletor thu thập được, thường thì chúng ta sẽ sử dụng các time series database. Ví dụ ElasticSearch, InfluxDB, Prometheus, Graphite (Whisper)

- **Visualizer**: Có nhiệm vụ trực quan hóa các metrics thu thập được qua các biểu đồ, bảng, .... Ví dụ: Kibana, Grafana, Chronograf

- **Alerter**: Gửi thống báo đến cho sysadmin khi có sự cố xảy ra

![alt text](../imgs/1.png)


# 2.Một số lệnh kiểm tra tài nguyên sử dụng, giám sát máy chủ Linux

*Tài liệu tham khảo*

[1] [https://devopsz.com/monitoring-system-part-1/](https://devopsz.com/monitoring-system-part-1/)

[2] [https://www.daihockhonggiay.com/blogs/post/cac-yeu-cau-giam-sat-he-thong-mang](https://www.daihockhonggiay.com/blogs/post/cac-yeu-cau-giam-sat-he-thong-mang)