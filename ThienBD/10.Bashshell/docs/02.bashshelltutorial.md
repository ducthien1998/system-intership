# BASH SHELL TUTORIAL 

# 1. Interactive Shell và Non-Interactive Shell
- **Interactive Shell**: Nó cho phép bạn nhập và chỉnh sửa các lệnh, sau đó thực thi chúng khi bạn nhấn phím Return.
- **Non-Interactive Shell**: Bash shell cũng có thể được chạy non-interactively script, làm cho shell không cần sự tương tác của con người. Hành vi tương tác và hành vi theo tập lệnh phải giống hệt nhau 
# 2.Cách tạo 1 file bash shell

Thay vì phải thực thi nhiều câu lệnh phức tạp, mất thời gian, chúng ta có thể viết vào một file để thực thi nó, chúng ta gọi đó là shell script.

- Để tạo 1 file script bash shell ta dùng dòng lệnh 
```
touch example.sh
```
- Thêm quyền thực thi đối với file
```
chmod +x example.sh
```
- Thêm code vào file 
    - Dòng đầu tiên chuỗi ký tự #! được gọi là shebang1 `#!/bin/bash`
    - Phần phía dưới ta sẽ viết những dòng lệnh ta mong muốn 
*Ví dụ*
```
echo "Hello World"
```

- Để chạy được file ta có các cách sau 
    - `./example.sh`
    - `/bin/bash example.sh`
    - `bash example.sh`
    - `sh example.sh`


# 3.Biến và tham số

Shell không quan tâm tới kiểu dữ liệu nên bạn có thể truyền bất kì giá trị gì cho biến, nó có thể là strings, integers, real number,...

*Ví dụ*
```
#!/bin/sh
MY_MESSAGE="Hello World!"
echo $MY_MESSAGE
```
Lưu ý: Cú pháp khai báo biến không được chứa white space, ví dụ, nếu bạn khai báo như vậy sẽ bị lỗi MY_MESSAGE = "Hello World!"

Ngoài việc truyền giá trị trực tiếp cho biến trong file, shell còn cho phép bạn truyền biến khi excute bằng các biến đặc biệt

|Cú pháp	|Ý nghĩa|
|---|---|
|$0|	Tên tệp đang thực thi|
|$<n> (ex: $1, $2,...)|	Các biến này tương ứng với các đối số đã truyền khi thực thi file|
|$#|	Số lượng đối số được cung cấp cho một tập lệnh|
$*|	Danh sách đối số được đặt trong dấu nháy kép|
|$@|	Danh sách đối số được đặt trong dấu nháy kép riêng lẻ|
|$?|	"exit status" lệnh được thực thi gần nhất. Nếu lệnh thực| thi thành công, "exit status" sẽ bằng 0, ngược lại thì khác 0.|
|$$|	Số thứ tự của tiến trình trong shell hiện tại, thường là process ID của process đang thực thi.|
|$!|	Process ID của lệnh nền gần nhất đã được thực thi|

# 4. Mảng

# 4.1. Định nghĩa gián tiếp
Định nghĩa gián tiếp là việc bạn sẽ gán từng giá trị tới từng index của mảng

```
ARRAYNAME[INDEX]=value
```
*Ví dụ*

```
FRUIT[0]='APPLE'
FRUIT[1]='ORANGE'
FRUIT[2]='BANANA'
```
# 4.2. Định nghĩa hỗn hợp
Với kiểu này thì chúng ta có thể khai báo array với hàng loạt các giá trị, chúng ta cũng có thể thêm giá trị vào sau nếu muốn

```
ARRAYNAME=(VALUE1 VALUE2 VALUE3)
```
*Ví dụ*

```
CAR=(TOYOTA VOLVO VINFAST)
CAR=([0]=TOYOTA [1]=VOLVO [2]=VINFAST)
```
# 4.3. Lấy tất cả các giá trị

Để in ra tất cả các giá trị trong array, chúng ta sử dụng:
```
echo ${ARRAYNAME[@]}        
echo ${ARRAYNAME[*]}
```
*Ví dụ*
```
CAR=([0]=TOYOTA [1]=VOLVO [2]=VINFAST)
echo ${CAR[@]}        
echo ${CAR[*]}    
```
# 4.4. Lấy giá trị đầu tiên
```
echo ${ARRAYNAME}        
```
*Ví dụ*
```
CAR=([0]=TOYOTA [1]=VOLVO [2]=VINFAST)
echo ${CAR}
echo ${CAR[0]}
```
# 4.5. Lấy giá trị cụ thể

```
echo ${ARRAYNAME[INDEX]}
```
*Ví dụ*
```
echo ${CAR[2]}
```

# 4.6. Lấy giá trị theo index của string
```
echo ${ARRAYNAME[WHICH_ELEMENT]:STARTING_INDEX:COUNT_ELEMENT}
```
*Ví dụ*
```
STRING=('THIS IS A LONG STRING')
echo ${STRING[0]:8:13}
```

# 4.7. Độ dài giá trị cụ thể
```
echo ${#ARRAYNAME[INDEX]}
```
*Ví dụ*

```
CAR=(TOYOTA VOLVO VINFAST)
echo ${#CAR} // tương đương ${#CAR[0]}
echo ${#CAR[1]}
```

# 4.8. Độ dài mảng
```
CAR=(TOYOTA VOLVO VINFAST)
echo ${#CAR[@]}
echo ${#CAR[*]}
```
# 5.Lệnh điều kiện If

Cũng như các ngôn ngữ lập trình, với một danh sách dài các lệnh thì không thể thiếu được câu lệnh rẽ nhánh cơ bản để kiểm tra xem điều kiện đúng hay sai mà thực thi những việc mình cần.
Câu lệnh đơn giản nhất sẽ có cấu trúc như dưới

```
if điều kiện
then
	1 hoặc nhiều câu lệnh ở đây
fi
```
hoặc 
```
if điều kiện
then
	1 hoặc nhiều câu lệnh ở đây
else
    xử lý khác ở đây
fi
```
hoặc
```
if điều kiện 1
then
	xử lý 1
elif điều kiện 2
then
	xử lý 2
fi
```

**Một số điều kiện cho if, else khác**

*Lệnh so sánh với số*


| Cú pháp |Ý nghĩa|
|---|---|
|n1 -eq n2|Kiểm tra n1 = n2|
|n1 -ne n2|Kiểm tra n1 khác n2|
|n1 -lt n2|Kiểm tra n1 < n2|
|n1 -le n2|Kiểm tra n1 <= n2|
|n1 -gt n2|Kiểm tra n1 > n2|
|n1 -ge n2|Kiểm tra n1 >= n2|

*Lệnh so sánh với chuỗi*

| Cú pháp |Ý nghĩa|
|---|---|
|s1 = s2|Kiểm tra s1 = s2|
|s1 != s2|Kiểm tra s1 khác s2|
|-z s1|Kiểm tra s1 có kích thước bằng 0|
|-n s1|Kiểm tra s1 có kích thước khác 0|
|s1|Kiểm tra s1 khác rỗng|

*Toán tử kết hợp*

|Column 1|Column 2|
|---|---|
|!	|Phủ định (not)|
|-a	|Và (and)|
|-o	|Hoặc (or)|

*Lệnh kiểm tra file (nói chung cho cả tệp và thư mục)*

|Cú pháp|	Ý nghĩa|
|---|---|
|-f file	|Kiểm tra xem file có phải là tệp hay không|
|-d file	|Kiểm tra xem file có phải là thư mục hay không|
|-r file	|Kiểm tra file có đọc (read) được hay không|
|-w file	|Kiểm tra file có ghi (write) được hay không|
|-x file	|Kiểm tra file có thực thi (execute) được hay không|
|-s file	|Kiểm tra file có kích thước lớn hơn 0 hay không|
|-e file	|Kiểm tra xem file có tồn tại hay không|


# 6.Vòng lặp 

Shell hỗ trợ cả 4 kiểu vòng lặp bao gồm

**until**

`until test-commands; do consequent-commands; done`

**while**

`while test-commands; do consequent-commands; done`

**for**

`for name [ [in [words …] ] ; ] do commands; done`

**for**

`for (( expr1 ; expr2 ; expr3 )) ; do commands ; done`


# 7.Grep

- Tìm 1 chuỗi trong 1 file

```
$ grep "chuoi" ten_file
```
- Tìm kiếm chuỗi trong nhiều file cùng lúc

```
grep ‘chuỗi cần tìm’ file1 file2 file3…
```

- Tìm kiếm chuỗi mà không phân biệt chữ hoa/chữ thường

```
grep -i “chuỗi cần tìm” tên_file
```
- Tìm kiếm chuỗi sử dụng biểu thức chính quy (regular expression)

```
grep -E ‘^a’ example.txt
```
- Tìm kiếm chuỗi đúng với từ khóa cụ thể

```
grep -w “apple” fruits.txt
```

- Hiển thị các dòng kết quả với số dòng trước/sau

```
grep -A 2 -B 2 “pattern” example.txt
```
- Tìm kiếm chuỗi trong tất cả các file và thư mục con
```
grep -r “chuỗi tìm kiếm” /đường/dẫn/thư/mục
```
- Tìm kiếm chuỗi không có từ khóa cụ thể
```
grep -v ‘pattern’ filename
```

- Đếm số lần xuất hiện của chuỗi trong file

```
grep -c “chuỗi” file.txt
```

# 8.AWK

AWK là một ngôn ngữ kịch bản được sử dụng để thao tác dữ liệu và tạo báo cáo. Ngôn ngữ lập trình lệnh awk không yêu cầu biên dịch và cho phép người dùng sử dụng các biến, hàm số, hàm chuỗi và toán tử logic.

Định dạng cơ bản của một lệnh `awk`

```
awk '/search-pattern/ { action-to-take-on-matches; another-action; }' file-to-parse
```

*Chú thích tham số lệnh awk*
- `/search-patterm/`: Là nội dung mẫu tìm kiếm.
- `action-to-take-on-matches`: Biểu thức xử lí nội dung.
- `;`: Dấu kết thúc biểu thức xử lí nội dung.
- `another-action`: Biểu thức xử lí nội dung khác.
- `file-to-parse`: Là tên tệp hoăc đường dẫn đến tệp.

# 9.SED

- Thay thế chuỗi trong tệp

```
sed ‘s/old_string/new_string/g’ file.txt > new_file.txt
```

- Xóa các dòng chứa chuỗi cụ thể
```
sed ‘/delete_this_string/d’ file.txt > new_file.txt
```
- Chèn dòng vào giữa các dòng
```
sed ‘3i\new_line’ file.txt > new_file.txt
```
- Hiển thị các dòng cụ thể
```
sed -n ‘2,4p’ file.txt
```
- Thực hiện nhiều lệnh
```
sed -e ‘s/old_string/new_string/g’ -e ‘/delete_this_string/d’ file.txt > new_file.txt
```
- Thay thế theo biểu thức chính quy (regular expression)
```
sed ‘s/regex/new_string/g’ file.txt > new_file.txt
```
- Sử dụng biến trong lệnh Sed
```
variable=”new_string”

sed “s/old_string/$variable/g” file.txt > new_file.txt
```
- Xóa các dòng trống
```
sed ‘/^$/d’ file.txt > new_file.txt
```
- Xóa các dòng bắt đầu bằng ký tự cụ thể
```
sed ‘/^delete/d’ file.txt > new_file.txt
```
- Đánh số các dòng
```
sed = file.txt | sed ‘N;s/\n/\t/’ > new_file.txt
```

- Thêm text vào sau 1 dòng bất kỳ 
```
sed '6 a Listen 82' /etc/apache2/ports.conf
```