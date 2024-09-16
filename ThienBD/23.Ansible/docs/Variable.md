# CÁCH SỬ DỤNG VARIABLE TRONG ANSIBLE PLAYBOOK

# 1. Varible trong Ansible
Khái niệm biến trong Ansible tương tự như khái niệm biến trong bất kỳ ngôn ngữ lập trình nào. Trong Ansible, một giá trị được gán cho một biến có thể được tham chiếu trong playbook hoặc trên dòng lệnh trong thời gian chạy playbook. Biến có thể sử dụng trong playbook, inventory và trên dòng lệnh .

# 2. Quy tắc đặt tên biến

*Các quy tắc đặt tên biến trong Ansible* 

- Tên biến hợp lệ phải bắt đầu bằng ký tự viết hoa hoặc viết thường
- Tên biến chỉ có thể chứa các chữ cái (chữ hoa hoặc chữ thường hoặc kết hợp cả hai), dấu gạch dưới, chữ số 
- Khi định nghĩa biến, một số chuỗi được dành riêng cho mục đích đặc biệt và không đủ điều kiện là tên biến hợp lệ 
- Nên giữ cho các biến của mình ngắn gọn và có ý nghĩa để có thể mô tả chức năng biến 

**Ví dụ biến hợp lệ**
- blackmyth
- blackmyth_wukong
- wukong2024

**Ví dụ không biến hợp lệ**
- #blackmyth#
- blackmyth-wukong
- 2024wukong

# 3. Simple Variable

Cách sử dụng cơ bản của biến là định nghĩa một biến bằng một giá trị duy nhất trong tệp YAML của playbook. 

```
---
- host: all
  vars:
    greetings: Hello everyone!

  tasks:
  - name: Ví dụ sử dụng biến đơn giản trong Ansible
    debug:
    msg:"{{greetings}}, hello 2024"
```

Định nghĩa của biến bắt đầu bằng `vars` , khối theo sau là tên biến và giá trị tương ứng. Trong ví dụ này, `greeting` là tên biến trong khi `Hello everyone!` là giá trị được gán cho biến đó. 

Để tham chiếu giá trị của biến, hãy đóng gói biến bên trong cặp dấu ngoặc nhọn như sau `{{greetings}}`

Sau khi chạy playbook ta sẽ nhận được kết quả như sau 

ảnh

# 4. Ansible Variable with Arrays

Giống các ngôn ngữ lập trình, mảng được sử dụng để lưu trữ một tập hợp các mục có cùng kiểu dữ liệu, trong Ansible, Mảng được sử dụng để định nghĩa các biến có nhiều giá trị 

Mảng được định nghĩa bằng cú pháp được hiển thị 
```
vars:
    arrayname:
    - item1
    - item2
    - item3
```

Ví dụ ta sẽ in ra stdout danh sách thú cưng . Thay vì định nghĩa riêng lẻ, hãy định nghĩa một mảng với tên thú cưng là các giá trị 

```
vars:
    arrayname:
    - Chó
    - Mèo
    - Lợn
```
*Ví dụ tệp playbook in ra tên nhân viên có trong mảng*

```
---
- hosts: all
  vars:
pets:
  - Chó
  - Mèo
  - Lợn

  tasks:
  - name: Ví dụ sử dụng biến trong mảng
    debug:
      msg: "{{ pets }}"
```

Sau khi chạy playbook ta sẽ nhận được kết quả như sau 

ảnh 

Ngoài ra, bạn cũng có thể truy cập các mục riêng lẻ từ một mảng bằng cách sử dụng các giá trị chỉ mục (bắt đầu từ 0). Khi playbook được sửa đổi như minh họa, nó sẽ in ra giá trị thứ 3 trong mảng là `Lợn`

```
 tasks:
  - name: Ví dụ sử dụng biến trong mảng
    debug:
      msg: "{{ pets[2] }}"
```

ảnh

Giống như trong python, bạn cũng có thể cắt một phạm vi các phần tử trong một mảng. Giới hạn dưới là bao gồm,trong khi giới hạn trên là loại trừ. Playbook in ra giá trị Chó và Mèo khi cắt mảng như thế này 

```
 tasks:
  - name: Ví dụ sử dụng biến trong mảng
    debug:
      msg: "{{ pets[0:2] }}"
```

ảnh

# 5. Ansible Variable with Dictionaries

Dictionaries là một tập hợp không theo thứ tự các mục có thể thay đổi, trong đó mỗi mục được biểu diễn dưới dạng một cặp `key-value`. Trong một cặp `key-value`, mỗi key được ánh xạ tới giá trị liên kết của nó và dấu hai chấm (:) được sử dụng để phân tách khóa khỏi giá trị tương ứng của nó

*Cú pháp*

```
vars:
 arrayname:
   dictionary_1:
      key1: value1
      key2: value2

   dictionary_2:
      key1: value1
      key2: value2
```

Ta sẽ thêm thuộc tính vào các giá trị của mảng pets. Playbook sẽ thêm 3 cặp key-value vào mỗi phần tử Dictionaries 


```
---
- hosts: all
  vars:
    pets:
        Chó:
          gender: female
          age: 2
          city: Mỹ

        Mèo:
          gender: male
          age: 2
          city: Pháp

        Lợn:
          gender: male
          age: 1
          city: Nhật

  tasks:
  - name: Ví dụ sử dụng Ansible Dictionaries 
    debug:
      msg: " Danh sách chi tiết thú cưng: {{ pets }}"
```
Sau khi chạy playbook ta sẽ nhận được kết quả như sau 

ảnh 

Giống như mảng, ta có thể truy cập các phần tử riêng lẻ trong một dictionaries. Có 2 cách để thực hiện việc này, có thể sử dụng ký hiệu **dấu chấm** hoặc **dấu ngoặc**

*Ví dụ in thông tin khi dùng định dạng `variable.value`*

```
tasks:
  - name: Ví dụ sử dụng Ansible Dictionaries
    debug:
      msg: " Danh sách chi tiết thú cưng: {{ pets.Mèo }} "
```

ảnh 

Ngoài ra ta có thể thu hẹp hơn nữa và in ra giá trị cuả một khóa cụ thể. Ví dụ bạn có thể in ra giới tính mà Cat thuộc về bằng cách tham chiếu đến như sau 

```
tasks:
  - name: Ví dụ sử dụng Ansible Dictionaries
    debug:
      msg: " Danh sách chi tiết thú cưng: {{ pets.Mèo.gender }} "
```

ảnh 

*Ví dụ in thông tin khi dùng định dạng `variable['value']`*

```
tasks:
  - name: Ví dụ sử dụng Ansible Dictionaries
    debug:
      msg: " Danh sách chi tiết thú cưng: {{ pets.['Mèo'] }} "
```

ảnh 

# 6. Ansible Variable with Loops

Giống như trong ngôn ngữ lập trình, vòng lặp được sử dụng để lặp qua các phần tử trong một mảng hoặc mảng đa chiều cho đến khi một điều kiện được đáp ứng. Chúng được sử dụng để đơn giản hóa việc thựuc hiện các tác vụ lặp đi lặp lại có thể là một công việc tốn thời gian 

Ví dụ : Tạo một user mới trên một host có tên là `thien` . Tệp playbook sẽ xuất hiện như được hiển thị với một tác vụ duy nhất để tạo 1 user mới 

```
---
- hosts: all
  tasks:
    - name: Tạo user mới tên thien
      user:
        name: thien
        state: present

```

ảnh 

Trong trường hợp muốn tạo nhiều người dùng buộc phải viết nhiều tác vụ lặp đi lặp lại 

```
---
- hosts: all
  tasks:
    - name: Tạo user mới tên thien
      user:
        name: thien
        state: present
    - name: Tạo user mới tên thinh
      user:
        name: thinh
        state: present
```


ảnh 

Để xử lý việc này ta dùng một vòng lặp qua danh sách tên 

```
---
- hosts: all
  tasks:
    - name: Tạo user mới
      user:
        name: '{{ item }}'
        state: present

      loop:
        - thien
        - thinh
```

Lệnh `loop` sẽ lặp lại toàn bộ danh sách các tên được định nghĩa bởi vòng lặp và lưu trữ từng tên trong một biến có tên là `item` 

ảnh 

Ngoài ra có thể lặp qua Dictionaries, nếu muốn đính kèm các thuộc tính bổ sung cho người dùng như `uid` và `comment`.
Trong trường hợp này có 3 thuộc tính người dùng , `name`, `uid`, `comment` , do đó không thể định nghĩa biến đơn item như ví dụ trước. Trong tasks phần này ta sẽ định nghĩa các biến là `item.name`, `item.uid` và `item.comment`. Các biến sẽ tham chiếu đến các thuộc tính người dùng được định nghĩa trong vòng lặp 

```
---
- hosts: all
  tasks:
    - name: Tạo user mới
      user:
        name: '{{ item.name }}'
        uid:  '{{ item.uid }}'
        comment:  '{{ item.comment }}' 
        state: present

      loop:
        - name: thien
          uid: 1001
          comment: Administrator

        - name: thinh
          uid: 1002
          comment: Techie
```

ảnh 




*Tài liệu tham khảo*

[1] [https://www.cherryservers.com/blog/how-to-use-variables-in-ansible-playbooks](https://www.cherryservers.com/blog/how-to-use-variables-in-ansible-playbooks)