# LUỒNG LÀM VIỆC CỦA KEYSTONE (WORKFLOW)

Keystone trong Openstack là một dịch vụ quản lý danh tính và cung cấp các tính năng xác thực, ủy quyền, và quản lý dịch vụ. Luồng làm việc của keystone bao gồm việc xác thực người dùng và cấp quyền truy cập đến các dịch vụ khác nhau trong Openstack. Dưới đây là luồng làm việc cơ bản của keystone trong Openstack
*Tóm tắt luồng làm việc chính của Keystone *
1. Xác thực người dùng bằng cách sử dụng thông tin đăng nhập(username/password hoặc token)
2. Cấp token cho người dùng sau khi xác thực thành công 
3. Xác thực token khi người dùng gửi yêu cầu truy cập dịch vụ 
4. Ủy quyền dựa trên vai trò của người dùng, dự án, và chính sách dịch vụ 
5. Truy cập dịch vụ nếu token hợp lệ và người dùng có quyền 
6. Quản lý danh tính, vai trò, và catalog dịch vụ

# 1. Xác thực(Authenticaion)

- **Bước 1: Người dùng gửi yêu cầu đăng nhập**
Người dùng (hoặc dịch vụ) gửi thông tin đăng nhập (username/password, token, hoặc thông tin xác thực khác) đến Keystone để xác thực danh tính 
- **Bước 2: Keystone xác thực thông tin** 
Keystone kiểm tra thông tin đăng nhập thông qua backend xác thực, có thể là cơ sở dữ liệu nội bộ, LDAP, hoặc các hệ thống xác thực khác
- **Bước 3: Cấp token**
Nếu thông tin đăng nhập hợp lệ, Keystone sẽ cấp một token(chứng chỉ ngắn hạn) cho người dùng. Token này sẽ được sử dụng cho các yêu cầu tiếp theo để truy cập dịch vụ khác trong openstack


# 2. Ủy quyền (Authorization)

- **Bước 4: Yêu cầu truy cập dịch vụ** 
Sau khi nhận toekn, người dùng gửi token cùng với yêu cầu truy cập đến dịch vụ Openstack (như Nova, Glance, Cinder)
- **Bước 5: Dịch vụ gửi yêu cầu xác thực token tới Keystone**
Dịch vụ(chẳng hạn Nova) không tự mình xác thực token mà gửi yêu cầu tới Keystone để xác minh tính hợp lệ của token
- **Bước 6: Keystone xác thực token**
Keystone kiểm tra token, xác minh người dùng có quyền truy cập vào dịch vụ được yêu cầu hay không. Keystone dựa vào `policy.json` hoặc `policy.yaml` để xác định quyền truy cập (ví dụ, kiểm tra người dùng cso vai trò "admin" hay không )
- **Bước 7: Dịch vụ cấp quyền truy cập**
Nếu token hợp lêj và người dùng có quyền, dịch vụ sẽ xử lý yêu cầu và cung cấp kết quả( chẳng hạn, tạo instance, xóa image,,,,)

# 3. Quản lý danh tính và vai trò (Identity and Role Management)
- **Quản lý dự án (Project)**
Keystone cho phép tạo và quản lý các dự án (project), là đơn vị tách biệt mà người dùng và tài nguyên được quản lý. Một người dùng có thể có quyền trong nhiều dự án khác nhau 
- **Quản lý vai trò (Roles)**
Các vai trò(roles) xác định quyền mà người dùng có trong dự án, Ví dụ, vai trò `admin` có quyền cao nhất, trong khi vai trò `member` có quyền hạn chế hơn 
- **Quản lý người dùng (User)**
Người dùng được tạo và liên kết với các dự án va vai trò cụ thể . Keystone lưu trữ thông tin người dùng và quyền của họ trong cơ sở dữ liệu hoặc backend xác thực (như LDAP)

# 4. Token Revocation (Thu hồi Token)
- **Token hết hạn** 
Token do Keystone cấp thường có thời gian sống giới hạn. Sau khi hết hạn, người dùng phải yêu cầu Keystone cấp token mới
- **Thu hồi token**
Keystone có thể thu hồi token trước thời gian hết hạn (ví dụ, khi người dùng bị khóa, Token sau khi bị thu hồi sẽ không thể sử dụng để truy cập dịch vụ nữa)

# 5. Catalog dịch vụ (Service Catalog)

- **Catalog**
Keystone duy trì một catalog dịch vụ, chứa danh sách các dịch vụ Openstack có sẵn (như Nova, Glancne, Neutron) và các endpoint của chúng. Sau khi xác thực, người dùng có thể yêu cầu Keystone cung cấp catalog dịch vụ này để biết được các endpoint của dichj vụ nòa có sẵn 
- **Yêu cầu dịch vụ**
Dựa trên thông tin từ catalog dịch vụ, người dùng có thể gửi yêu cầu đến các dịch vụ tương ứng 

 