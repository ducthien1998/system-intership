# QUẢN TRỊ USER VÀ GROUP

- User (người dùng) trong Linux là một tài khoản được đăng ký và có quyền truy cập vào các tài nguyên của hệ thống, chẳng hạn như tệp tin, thư mục hoặc các dịch vụ. Mỗi user trong hệ thống Linux được định danh bằng một User ID (UID) duy nhất và có thể thuộc vào một hoặc nhiều nhóm (group).
- Group (nhóm) trong Linux là một tập hợp các user được phân loại theo một tiêu chí nhất định, chẳng hạn như cùng một phòng ban, cùng một dự án hoặc cùng một quyền truy cập vào một tài nguyên nào đó. Mỗi group trong hệ thống Linux được định danh bằng một Group ID (GID) duy nhất và có thể được phân quyền truy cập vào các tài nguyên hệ thống như tệp tin và thư mục.

# 1.Quản trị User
Trên linux có 2 loại tài khoản user đó là : tài khoản user hệ thống và tài khoản user người dùng 

**User hệ thống** : Dùng để thực thi các module , script cần thiết phục vụ cho HĐH
**User người dùng** : là những tài khoản để login để sử dụng HDH. Trong các tài khoản user thì tài khoản root ( super user ) là tài khoản quan trọng nhất . Tài khoản này được tự động tạo ra khi cài đạt Linux. Tài khoản này không thể đổi tên hoặc xóa bỏ . User root còn được gọi là super user vì có toàn quyền trên hệ thống. Chỉ làm việc với tài khoản user root khi muốn thực hiện công tác quản trị hệ thống , trong các trường hợp khác chỉ nên làm việc với tài khoản user bình thường

*Đặc điểm của mỗi user*
- Tên mỗi user là duy nhất , chỉ có thể đặt tên chữ thường , chữ hoa 
- Mỗi user có một mã định danh duy nhất (uid)
- Mỗi user có thể thuộc về nhiều nhóm (group)
- Tài khoản superuser có uid = gid =0


## 1.1.File /etc/passwd

Là file văn bản chứa thông tin về các tài khoản user trên máy. Mọi user đều có thể đọc 
tập tin này nhưng chỉ có root mới có quyền thay đổi.
Để xem nội dung của file ta dùng lệnh: `#cat /etc/passwd`

Cấu trúc của file gồm nhiều hàng, mỗi hàng là thông tin của 1 user. Dòng đầu tiên của 
tập tin mô tả thông tin cho user root (có ID = 0), tiếp theo là các tài khoản khác của hệ thống, cuối cùng là các tài khoản người dùng thường. Mỗi hàng được chia làm 7 cột 
cách nhau bằng dấu “:”

## 1.2.File /etc/shadown
Là tập tin văn bản chứa thông tin về mật khẩu của các tài khoản user trên máy. Chỉ có 
root mới có quyền đọc tập tin này. User root có quyền reset mật khẩu của bất kỳ user 
nào trên máy.
Mỗi dòng trong tập tin chứa thông tin về mật khẩu của user, định dạng của dòng gồm 
nhiều cột giá trị, dấu “:” được sử dụng để phân cách các cột.

## 1.3.Các lệnh quản lý user

**Lệnh useradd** : Tạo tài khoản user

Cấu trúc lệnh : `useradd [options] login_name`

option: -c: comment, tạo bí danh
        -u: set user ID.Mặc định sẽ lấy số ID tiếp theo để gán user
        -d: chỉ định thư mục home
        -g: chỉ định nhóm chính
        -G: chỉ định nhóm phụ
        -s:chỉ định shell cho user sử dụng

*Ví dụ* : Tạo user với tên Thien và tên đầy đủ BD Thien (tham số -c)
    `#useradd -c "bd thien" thien`

**Lệnh usermod** : Sửa thông tin tài khoản 

Cấu trúc lệnh : `usermod [options] login name`
options: -c: comment , tạo bí danh
         -l -d: thay đổi thư mục home
         -g: chỉ định nhóm chính
         -G: chỉ định nhóm phụ(nhóm mở rộng)
         -s: chỉ định shell cho user sử dụng
         -L: Lock account

*Ví dụ*: Đổi tên tài khoản thien thành ngat(tham số -l) với thư mục user là /home/jenny (tham số -d)
    `#usermod -l ngat -c"hth ngat` -m -d /home/ngat thien

**Lệnh userdel** : Xóa tài khoản user
Cấu trúc lệnh: `userdel [options] login name`
options : -r: xóa thư mục khỏi home của user

*Ví dụ*: Xóa tài khoản user thien
`#userdel thien`

Thư mục home của user không bị xóa khi sử dụng lệnh userdel, để xóa cả thư mục home của user, sử dụng tham số -r
*Ví dụ*: Xóa tài khoản user thien và thư mục home của user

`userdel -r thien`

Khi xóa tài khoản user bằng lệnh userdel, dòng mô tả tương ứng của user trong các tập tin /etc/passwd và /etc/shadow cũng bị xóa


**Lệnh chage** : Dùng để thiết lập chính sách policy cho user

Cấu trúc lệnh: `chage [options] login name`
options: -l: xem chính sách của 1 user
         -E: thiết lập ngày hết hạn cho account, VD: chage -E 22/11/2023 al
         -I: thiết lập só ngày bị khóa sau khi hết hạn mật khẩu
         -m: thiết lập số ngày tối thiểu được phép thay đổi password
         -M: thiết lập số ngày tối đa được phép thay đổi password
         -W: thiết lập số ngày cảnh báo trước khi hết hạn mật khẩu

*Ví dụ*: chage -E 22/11/2023 -m 5 -M 90 -I 30 -W 14 newstarl

Lệnh trên sẽ thiết lập mật khẩu hết hạn vào ngày 22/11/2023 , ngoài ra số ngày tối thiếu/tối đa giữa các lần thay đổi mật khẩu được thiết lập để 5 và 90 tương ứng. Các tài khoản sẽ bị khóa 30 ngày sua khi mật khẩu hết hạn , và một tin nhắn cảnh báo sẽ được gửi ra 14 ngày trước khi hết hạn mật khẩu

# 2.Quản trị Group
Nhóm là tập hợp của nhiều user. Mỗi nhóm có tên duy nhất , và có một mã định danh duy nhất (gid) . Khi tạo một user(không dùng option -g) thì mặc định một group được tạo ra


## 2.1 File /etc/group

Là tập tin văn bản chứa thông tin về nhóm user trên máy. Mọi user đều có thể đọc tập tin này nhưng chỉ có root mới có quyền thay đổi
Mỗi dòng trong tập tin chứa thông tin về các nhóm user trên máy , định dạng của dòng gồm nhiều cột giá trị , dấu "." được sử dụng để phân cách các cột

## 2.2 Các lệnh quản lý group

**Lệnh groupadd** : Tạo nhóm

Cấu trúc lệnh : `groupadd [optiong] group`
options: -g GID : định nghĩa nhóm với mã nhóm GID

*Ví dụ* : Tạo nhóm user
`groupadd user`

*Ví dụ* : Tạo nhóm accounting với GID = 200
`groupadd -g 200 accounting`

**Lệnh groupmod**: Sửa thông tin nhóm

Cấu trúc lệnh : `groupmod [options] group`
options : -g GID : sửa mã nhóm thành GID
          -n group_name: sủa tên nhóm thành group
          _name

*Ví dụ* : Sửa gid của nhóm user thành 201
`#groupmod -g 201 user`
          Đổi tên nhóm accounting thành accountant
`#groupmod -n accountant accounting`

**Lệnh groupdel**: Dùng để xóa nhóm

Cấu trúc lệnh: `groupdel group`

*Ví dụ* : Xóa nhóm testgroup
`#groupdel testgroup`

