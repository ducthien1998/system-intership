# TÌM HIỂU VỀ ANSIBLE ROLE

# 1. Role là gì 
Các tác vụ liên quan đến nhau có thể tập hợp lại 1 role, sau đó áp dụng cho một nhóm các máy khi cần thiết
Roles cho phép bạn tự động tải các var, file, task, handlers dựa trên cấu trúc file đã biết.Sau khi nhóm lại thành role, có thể sử dụng lại hoặc chia sẻ với người dùng khác.

# 2. Role Directory Structure
Một Ansible Role sẽ được định nghĩa cấu trúc thư mục với 7 thư mục tiêu chuẩn. Cần sử dụng ít nhất 1 trong các thư mục này và không nhất thiết phải sử dụng hết cả 7 thư mục.

Theo mặc định, Ansible sẽ tìm kiếm tệp `main.yml` có nội dung liên quan trong hầu hết Directory Structure
Để hỗ trợ chúng ta nhanh chóng tạo ra 1 bộ khung cấu trúc đường dẫn role, chúng ta có thể tận dụng lệnh `ansible-galaxy init <role_name>`. Lệnh `ansible-galaxy` được hỗ trợ sẵn khi cài đặt Ansible, vì vậy không cần thiết phải cài đặt thêm gói nào cả.
Tạo 1 cấu trúc khung cho 1 role tên là test_role:

```
ansible-galaxy init test_role
```

Tạo 1 cấu trúc khung cho 1 role tên là test_role:
- **tasks/main.yml**: Chứa các file yaml định nghĩa các nhiệm vụ chính khi triển khai.
- **handlers/main.yml**: Chứa các handler được sử dụng trong role
- **defaults/main.yml**: Định nghĩa các giá trị default của các variable được sử dụng trong roles. Nếu variable không được định nghiã trong thư mục vars, các giá trị default này sẽ được gọi.
- **vars/main.yml**: Định nghĩa các variable được sử dụng ở trong roles
- **files/stuff.txt**: Chứa các file được sử dụng bởi role, ví dụ như các file ảnh.
- **templates/something.j2**: Chứa các template file được sử dụng trong role, ví dụ như các file configuration... Các file này có đuôi *.j2, sử dụng jinja2 syntax
- **meta/main.yml**: Thư mục này chứa meta data của roles

Bạn có thể thêm các tệp YAML khác vào một số thư mục, nhưng chúng sẽ không được sử dụng theo mặc định. Chúng có thể được nhập trực tiếp hoặc chỉ định khi sử dụng `include_role/import_role` 

*Ví dụ*: Đặt các tác vụ dành riêng cho nền tảng vào các tệp riêng biệt và tham chiếu đến chúng trong tệp `tasks/main.yml`:

```
# roles/example/tasks/main.yml
- name: Install the correct web server for RHEL
  import_tasks: redhat.yml
  when: ansible_facts['os_family']|lower == 'redhat'

- name: Install the correct web server for Debian
  import_tasks: debian.yml
  when: ansible_facts['os_family']|lower == 'debian'

# roles/example/tasks/redhat.yml
- name: Install web server
  ansible.builtin.yum:
    name: "httpd"
    state: present

# roles/example/tasks/debian.yml
- name: Install web server
  ansible.builtin.apt:
    name: "apache2"
    state: present
```

Gọi trực tiếp các tác vụ khi tải role, bỏ qua các tệp `main.yml`

```
- name: include apt tasks
  include_role:
      name: package_manager_bootstrap
      tasks_from: apt.yml
  when: ansible_facts['os_family'] == 'Debian'
  
```