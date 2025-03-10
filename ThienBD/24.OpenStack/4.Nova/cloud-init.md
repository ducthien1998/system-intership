# TÌM HIỂU VỀ CLOUD-INIT

# 1. Giới thiệu về cloud-init

Cloud-init là một công cụ được sử dụng để thực hiện các thiết lập ban đầu đối với các máy ảo hóa và cloud. Dịch vụ này sẽ chạy trước quá trình boot, nó lấy dữ liệu từ bên ngoài và thực hiện một số tác động tới máy chủ

Các tác động mà cloud-init thực hiện phụ thuộc vào loại format thông tin mà nó tìm kiếm được. Các format hỗ trợ
- Shell script 
- Cloud config files ( bắt đầu với #cloud-config)
- MIME multipart archive
- Gzip Compressed Content
- Cloud Boothook

Một trong những định dạng thông dụng nhất dành cho các script đó là cloud-config. Cloud-config là các file script được thiết kế để chạy trong các tiến trình cloud-init. Nó được sử dụng cho các cài đặt cấu hình ban đầu trên server như networking, SSH keys, timezone, user data injection....
