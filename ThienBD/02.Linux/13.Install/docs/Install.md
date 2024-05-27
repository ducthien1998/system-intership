# TÌM HIỂU CÁC CÁCH CÀI ĐẶT PHẦN MỀM TRÊN LINUX
## 1. Cấu tạo file cài đặt và các cách cài đặt trên Linux
### Cấu tạo file cài đặt 
Phần mềm cài đặt trên Linux thường được đóng gói dưới dạng các tập tin có định dạng đặc biệt, gọi là gói phần mềm. Các gói phần mềm này chứa tất cả các tệp tin cần thiết để cài đặt và chạy phần mềm trên hệ thống Linux.

Cấu trúc chung của một gói phần mềm Linux bao gồm:

1. Metadata:

- Thông tin mô tả gói phần mềm, bao gồm tên, phiên bản, nhà phát triển, mô tả, v.v.
- Danh sách các phụ thuộc, tức là các gói phần mềm khác cần được cài đặt trước khi cài đặt gói này.
- Danh sách các tập tin sẽ được cài đặt vào hệ thống, bao gồm vị trí cài đặt của mỗi tập tin.
- Script cài đặt và gỡ cài đặt, thực hiện các tác vụ cần thiết để cài đặt hoặc gỡ cài đặt phần mềm.

2. Tệp tin:

- Các tệp tin thực thi (binaries) của phần mềm.
- Các tệp tin thư viện (libraries) cần thiết cho phần mềm hoạt động.
- Các tệp tin tài liệu (documentation) hướng dẫn cách sử dụng phần mềm.
- Các tệp tin cấu hình (configuration files) để tùy chỉnh phần mềm theo nhu cầu của người dùng.

3. Script:

Script cài đặt (install script): Thực hiện các bước cần thiết để cài đặt phần mềm vào hệ thống, bao gồm tạo thư mục, sao chép tệp tin, tạo liên kết tượng trưng, v.v.
Script gỡ cài đặt (uninstall script): Thực hiện các bước cần thiết để gỡ cài đặt phần mềm khỏi hệ thống, bao gồm xóa tệp tin, thư mục, liên kết tượng trưng, v.v.

### Các cách cài đặt trên Linux


# 2.RPM

## 2.1.Tổng quan về RPM
RPM(Red Hat Package Manager) là một mã nguồn mở quản lý các gói trên hệ thống Red Hat.Một RPM package một là file chứa các chương trình thực thi, các scripts, tài liệu, và một số file cần thiết khác. Công cụ RPM cho phép người dùng cài đặt, cập nhật, gở cài đặt, truy vấn, xác minh và quản lý các gói rpm trên hệ điều hành Unix/Linux.

### Cấu trúc của một RPM package như sau

`<name>-<version>-<release>.<architecture>.rpm`

*Ví dụ: telnet-0.17-65.el7_8.x86_64.rpm*

- **telnet**: Package name
- **0.17**: Package Version
- **65.el7_8**: Package release
- **x86_64**: Package architecture
- **.rpm**: Package type

### Các chế độ của lệnh RPM

- **Install**: Lệnh này được sử dụng để cài đặt bất kỳ các gói RPM
- **Remove**: Lệnh này dùng để xoá, loại bỏ hoặc huỷ cài đặt bất ký gói RPM nào.
- **Upgrade**: Lệnh này để cập nhật goi RPM hiện có
- **Verify**: Lệnh này dùng để xác minh gói RPM
- **Query**: Lệnh này dùng để truy vấn bất kỳ gói RPM nào


### Một số trang web có thể tải gói cài đặt RPM

- rpmfind.net
- redhat.com
- freshrpms.net
- rpm.pbone.net

## 2.2. Cách sử dụng RPM
