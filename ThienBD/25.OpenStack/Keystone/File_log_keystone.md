# TÌM HIỂU VỀ FILE LOG KEYSTONE 

File log keystone chứa các thông tin quan trọng về việc quản lý và xác thực người dùng trong môi trường OPS. Cụ thể, file log này thường bao gồm những thông tin sau 

**1. Thông tin đăng nhập** : Ghi lại các sự kiện liên quan đến việc người dùng đăng nhập và ra khỏi hệ thống, bao gồm thời gian, địa chỉ IP và trạng thái đăng nhập   
**2. Thông báo lỗi**: Các lỗi xảy ra trong quá trình xác thực hoặc phân quyền người dùng, giúp người quản trị nhận diện và khắc phục vấn đề    
**3. Các sự kiện không thành công**: Những nỗ lực đăng nhập không hợp lệ hoặc các hoạt động không hợp lệ khác   
**4. Thay đổi cấu hình**: Ghi lại các thay đổi đối với cấu hình của Keystone hoặc dịch vụ liên quan    
**5. Hoạt động của API**: Theo dõi các yêu cầu API đến Keystone, bao gồm thông tin như endpoint, thời gian xử lý và mã trạng thái trả về    
**6. Thời gian thực hiện** : Thời gian cần thiết để thực hiện các yêu cầu xác thực và phân quyền    

Đường dẫn đến file log của keystone : `/var/log/keystone/keystone.log`