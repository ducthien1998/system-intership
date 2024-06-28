# QUYỀN TRÊN HỆ THỐNG TẬP TIN , THƯ MỤC 

Phân quyền truy xuất đến các tài nguyên Server Linux là một vấn đề quan trọng. Phân 
quyền giúp tăng mức độ an toàn, đảm bảo đúng trách nhiệm – quyền hạn của từng user 
khi sử dụng tài nguyên trên Server. Chương này sẽ giới thiệu các quyền truy cập, cách 
thiết lập quyền trên hệ thống tập tin và thư mục.

# 1.Quyền truy xuất 

Quyền truy xuất trên thư mục và tập tin được trình bày khi thực hiện lệnh ls-l , danh sách quyền truy xuất trình bày ở cột đầu tiên trong kết quả . Các loại quyền truy cập bao gồm 

- **Đọc(read)** : Cho phép đọc nội dung tập tin và xem nội dung thư mục bằng lệnh `ls`
- **Ghi(write)** : Cho phép thay đổi nội dung hoặc xóa tập tin . Đối với thư mục , quyền này cho phép tạo , xóa hoặc đổi tên tập tin mà không phụ thuộc vào quyền sở hữu trên tập tin chứa trong thư mục 
- **Thực thi(execute)** : Cho phép thực thi chương trình , đối với thư mục , quyền này cho phép chuyển vào thư mục bằng lệnh `cd`

***Quyền truy xuất gồm 3 nhóm***

- **Quyền người sử hữu(owner hoặc user)** : Ký hiệu bằng ký tự `u`, người tạo ra thư mục / tập tin hoặc được gán quyền sử hữu
- **Quyền của nhóm(group)** : Ký hiệu bằng ký tự `g` , nhóm người sử dụng được gán quyền 
- **Quyền của những người dùng khác (others)** : Ký hiệu bằng ký tự `o` , là những người sử dụng khác không thuộc 2 loại trên 

# 2.Biểu diễn quyền truy xuất 
Biểu diễn quyền truy xuất theo 2 cách 
***Bằng chữ***: Trong cách biểu diễn này , quyền truy xuất được viết bằng các ký tự 
    - r : read
    - w : write
    - x : excute
    - - : không có quyền
    - rwx : có toàn quyền
    - r-- : chỉ có quyền đọc
    - rw- : chỉ có quyền đọc và ghi 
    - --- : không có quyền gì 

Quyền hạn trên 1 file sẽ gồm cả 3 nhóm quyền (owner, group, others) nên danh sách quyền sẽ gồm 9 ký tự 

*Ví dụ*

|rwxrw---|Người sở hữu có toàn quyền , các user cùng nhóm chỉ có quyền đọc /ghi còn mọi người khác không có quyền truy xuất|
|----|----|
|rw-r-----| Người sở hưu có quyền đọc/ghi , các user cùng nhóm chỉ có quyền đọc còn mọi người khác không có quyền truy xuất |
|rwxr-xr--| Người sở hữu có toàn quyền , các user cùng nhóm chỉ có quyền đọc và thực thi chương trình , còn mọi người khác chỉ có quyền đọc |


***Bằng số*** : Trong cách biểu diễn này , mỗi quyền được gán cho một giá trị số theo bảng sau 

|Quyền|Giá trị|
|---|----|
|r|4|
|w|2|
|x|1|

*Ví dụ*

|Quyền| Ý nghĩa| Biểu diễn bằng số |
|--|---|---|
|rwx|Có toàn quyền|7|
|r--|Chỉ có quyền đọc|4|
|rw|Chỉ có quyền đọc và ghi|6|
|---|Không có quyền gì |0|

Vì quyền thực sự gồm 3 nhóm ( owner, group, others) nên danh sách quyền biểu diễn dạng số sẽ gồm 3 chữ số 


*Ví dụ*


|Dạng chữ|Dạng số|Ý nghĩa|
|--|---|---|
|rwxrw----|760|Người sở hữu có toàn quyền , các user cùng nhóm chỉ có quyền đọc/ghi còn mọi người khác không có quyền truy xuất|
|rw-r--r--|644|Người sở hưu có quyền đọc/ghi , các user cùng nhóm chỉ có quyền đọc còn mọi người khác không có quyền truy xuất |
|rwxr-xr--|754|Người sở hữu có toàn quyền , các user cùng nhóm chỉ có quyền đọc và thực thi chương trình còn mọi người khá chỉ có quyền đọc|

# 3.Các lệnh về quyền 

**Lệnh chmod** : Thay đổi quyền truy xuất trên thư mục/tập tin
Cấu trúc lệnh : `chmod [options] mode file`

Options:
    - -R: Áp dụng đối với thư mục làm cho lệnh chmod có tác dụng trên cả các thư mục con (đệ quy)
    - Mode: Quyền truy xuất mới trên tập tin

Quyền truy xuất mới có thể gán cho từng nhóm quyền bằng cách  sử dụng ký tự `u` đại diện cho quyền của người sở hữu (owner), g đại diện cho quyền của nhóm (group) và o đại diện cho quyền của mọi người dùng khác (others). Ký tự "+" có ý nghĩa gán thêm quyền , "-" có ý nghĩa rút bớt quyền và "=" có nghĩa là gán

*Ví dụ*

|g+w|thêm quyền ghi cho nhóm|
|---|---|
|o-rwx |loại bỏ tất cả các quyền của mọi người dùng khác|
|u+x |thêm quyền thực thi cho người sở hữu|
|+x |thêm quyền thực thi cho tất cả (mọi người)|
|a+rw |thêm quyền ghi đọc cho tất cả|
|ug+r |thêm quyền đọc cho owner và group|
|o=x |chỉ cho phép thực thi với mọi ngườ|

**Lệnh chown** : Thay đổi người sở hữu thư mục / tập tin
Cấu trúc lệnh : `chown [Options] Owner file`

Opions: 
    - -R : Áp dụng đối với thư mục làm cho lệnh chmod có tác dụng trên cả các thư mục con
    - Owner : Người sở hữu mới trên tập tin 

**Lệnh chgrp** : Thay đổi nhóm sở hữu thư mục / tập tin
Cấu trúc lệnh : `chgrp [Options] Group file`
Opions: 
    - -R : Áp dụng đối với thư mục làm cho lệnh chmod có tác dụng trên cả các thư mục con
    - Group : Nhóm sở hữu mới trên tập tin 
