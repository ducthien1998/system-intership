# TOKEN FORMAT

# 1. Tổng quan các loại token format 

**1. UUID**
- Kích thước nhỏ : 32 ký tự
- Dễ dàng sử dụng, đủ đơn giản để thêm vào lệnh cURL
- Hạn chế của UUID là không đủ thông tin để các dịch vụ khác xác định Role của user. Do đó, các dịch vụ khác phải gửi token này quay lại cho keystone để xác thực 

**2. PKI**
- Chứa đủ thông tin để thực hiện ủy quyền user ngay tại từng dịch vụ và cả một danh mục dịch vụ của user(catalog service)
- Token được ký danh và dịch vụ có thể cache lại token, sử dụng cho tới khi token hết hạn hoặc bị hủy bỏ
- PKI làm giảm traffic đến keystone server nhưng kích thước lớn (8kb) khó khăn để gửi trong HTTP header vì nhiều webserver không xử lý được HTTP header 8KB trừ khi cấu hình lại
- Khó sử dụng bằng cURL command -> chuẩn PKI được cải tiến thành PKLz - nén token PKI lại nhưng kích thước vẫn lớn 

**3. Fernet Token**
- Kích thước nhỏ - 255 bytes
- Chứa đủ thông tin cho tiến trình authorization cục bộ tại các Openstack Service khi người dùng request tới 
- Fernet token không lưu trong database của keystone. Trong các chuẩn token cũ, keystone phải lưu token trong database dẫn tới việc fill up, làm giảm hiệu năng của Keystone 

# 2. UUID Tokens

## 2.1. Thông tin cơ bản
- Kích thước nhỏ gọn, là chuỗi ngẫu nhiên 32 ký tự
- Tạo nên từ các chỉ số hệ thập lục phân
- Tokens URL thân thiện và an toàn khi gửi đi trong môi trường non-binary.
- Lưu trữ trong hệ thống backend (như database) bền vững để sẵn sàng cho mục đích xác thực
- UUID không bị xóa trong hệ thống lưu trữ nhưng sẽ bị đánh dấu là "revoked" (bị thu hồi) thông qua DELETE request với token ID tương ứng.
- Do kích thước cực nhỏ nên dễ dàng sử dụng khi truy cập Keystone qua 1 cURL command.

## 2.2. Token Generation Workflow

![alt text](../imgs/32.png)

**Workflow tạo UUID token diễn ra như sau:**
- User request tới keystone tạo token với các thông tin: user name, password, project name
- Chứng thực user, lấy User ID từ backend LDAP (dịch vụ Identity)
- Chứng thực project, thu thập thông tin Project ID và Domain ID từ Backend SQL (dịch vụ Resources)
- Lấy ra Roles từ Backend trên Project hoặc Domain tương ứng trả về cho user, nếu user không có bất kỳ roles nào thì trả về Failure(dịch vụ Assignment)
- Thu thập các Services và các Endpoints của các service đó (dịch vụ Catalog)
- Tổng hợp các thông tin về Identity, Resources, Assignment, Catalog ở trên đưa vào Token payload, tạo ra token sử dụng hàm uuid.uuid4().hex
- Lưu thông tin của Token và SQL/KVS backend với các thông tin: TokenID, Expiration, Valid, UserID, Extra

## 2.3. Token Validation Workflow

![alt text](../imgs/33.png)

- Gửi yêu cầu chứng thực token sử dụng API: GET v3/auth/tokens
- Thu thập token payloads từ token backend KVS/SQL kiểm tra trường valid. Nếu không hợp lệ trả về thông báo Token Not Found. Nếu tìm thấy chuyển sang bước tiếp theo
- Phân tích token và thu thập metadata: User ID, Project ID, Audit ID, Token Expire
- Kiểm tra token đã expired chưa. Nếu thời điểm hiện tại < "expired time" theo UTC thì token chưa expired, chuyển sang bước tiếp theo, ngược lại trả về thông báo token not found
- Kiểm tra xem token đã bị thu hồi chưa (kiểm tra trong bảng revocation_event của database keystone). Nếu token đã bị thu hồi (tương ứng với 1 event trong bảng revocation_event) trả về thông báo Token Not Found. Nếu chưa bị thu hồi trả về token (truy vấn HTTP thành công HTTP/1.1 200 OK )

## 2.4. Token Revocation Workflow

![alt text](../imgs/34.png)

- Gửi yêu cầu thu hồi token với API request DELETE v3/auth/tokens. Trước khi thực hiện sự kiện thu hồi token thì phải chứng thực token nhờ vào tiến trình Token Validation Workflow đã trình bày ở trên.
- Kiểm tra trường Audit ID. Nếu có, tạo sự kiện thu hồi với audit id. Nếu không có audit id, tạo sự kiện thu hồi với token expired
- Nếu tạo sự kiện thu hồi token với audit ID, các thông tin cần cập nhật vào revocation_event table của keystone database gồm: audit_id, revoke_at, issued_before.
- Nếu tạo sự kiện thu hồi token với token expired, các thông tin cần thiết cập nhật vào revocation_event table của keystone database gồm: user_id, project_id, revoke_at, issued_before, token_expired.
- Loại bỏ các sự kiện của các token đã expired từ bảng revocation_event của database "keystone"
- Cập nhật vào token database, thiết lập lại trường "valid" thành false (0)

## 2.5. UUID - Multiple Data Centers

![alt text](../imgs/35.png)

UUID Token không hỗ trợ xác thực và ủy quyền trong trường hợp multiple data centers. Như ví dụ mô tả ở hình vẽ, một hệ thống cloud triển khai trên hai datacenter ở hai nơi khác nhau. Khi xác thực với keystone trên datacenter US-West và sử dụng token trả về để request tạo một máy ảo với Nova, yêu cầu hoàn toàn hợp lệ và khởi tạo máy ảo thành công. Trong khi nếu mang token đó sang datacenter US-East yêu cầu tạo máy ảo thì sẽ không được xác nhận do token trong backend database US-West không có bản sao bên US-East.

# 3. PKI Tokens
## 3.1. Thông tin cơ bản

- Kích thước tương đối lớn - 8KB
- Chứa nhiều thông tin: thời điểm khởi tạo, thời điểm hết hạn, user id, project, domain, role gán cho user, danh mục dịch vụ nằm trong payload.
- Muốn gửi token qua HTTP, JSON token payload phải được mã hóa base64 với 1 số chỉnh sửa nhỏ. Cụ thể, Format=CMS+[zlib] + base64. Ban đầu JSON payload phải được ký sử dụng một khóa bất đối xứng(private key), sau đó được đóng gói trong CMS (cryptographic message syntax - cú pháp thông điệp mật mã). Với PKIz format, sau khi đóng dấu, payload được nén lại sử dụng trình nén zlib. Tiếp đó PKI token được mã hóa base64 và tạo ra một URL an toàn để gửi token đi.
- Các OpenStack services cache lại token này để đưa ra quyết định ủy quyền mà không phải liên hệ lại keystone mỗi lần có yêu cầu ủy quyền dịch vụ cho user.
- Kích thước của 1 token cơ bản với single endpoint trong catalog lên tới 1700 bytes. Với các hệ thống triển khai lớn nhiều endpoint và dịch vụ, kích thước của PKI token có thể vượt quá kích thước giới hạn cho phép của HTTP header trên hầu hết các webserver(8KB). Thực tế khi sử dụng chuẩn token PKIz đã nén lại nhưng kích thước giảm không đáng kể (khoảng 10%).
- PKI và PKIz tokens tuy rằng có thể cached nhưng chúng có nhiều hạn chế
    - Khó cấu hình để sử dụng
    - Kích thước quá lớn làm giảm hiệu suất web
    - Khó khăn khi sử dụng trong cURL command.
    - Keystone phải lưu các token với rất nhiều thông tin trong backend database với nhiều mục đích, chẳng hạn như tạo danh sách các token đã bị thu hồi. Hệ quả là người dùng phải lo về việc phải flush Keystone token database định kì tránh ảnh hưởng hiệu suất.


## 3.2. PKI/PKIZ Configuration - Certificates
Việc cấu hình cho PKI/PKIZ token phải sử dụng ba chứng chỉ:
- Signing Key tạo ra private key dưới định dạng PEM
- Signing Certificates
    - Sử dụng Signing Key để tạo ra CSR (Certificate Signing Request)
    - Submit CSR tới CA (Certificate Authority)
    - Nhận lại chứng chỉ xác thực (cetificate) từ CA (certificate authority)
- Certificate Authority

## 3.3. Token Generation Workflow

Tiến trình tạo ra PKI token:
- Người dùng gửi yêu cầu tạo token với các thông tin: User Name, Password, Project Name
- Keystone sẽ chứng thực các thông tin về Identity, Resource và Asssignment (định danh, tài nguyên, assignment)
- Tạo token payload định dạng JSON
- "Ký" lên JSON payload với Signing Key và Signing Certificate , sau đó được đóng gói lại dưới định dang CMS (cryptographic message syntax - cú pháp thông điệp mật mã)
- Bước tiếp theo, nếu muốn đóng gói token định dạng PKI thì convert payload sang UTF-8, convert token sang một URL định dạng an toàn. Nếu muốn token đóng gói dưới định dang PKIz, thì phải nén token sử dụng zlib, tiến hành mã hóa base64 token tạo ra URL an toàn, convert sang UTF-8 và chèn thêm tiếp đầu ngữ "PKIZ"
- Lưu thông tin token vào Backend (SQL/KVS)


## 3.4. Token Validation Workflow
Tương tự như tiến trình chứng thực UUID token, chỉ khác giai đoạn đầu khi gửi yêu cầu chứng thực token tới keystone, keystone sẽ băm lại pki token với thuật toán băm đã cấu hình trước đó rồi mới kiểm tra trong backend database thu thập payload của token. Các bước chứng thực sau đó hoàn toàn tương tự như UUID token.

![alt text](../imgs/37.png)

## 3.5. Token Revocation Workflow
Hoàn toàn tương tự như tiến trình thu hồi UUID token
## 3.6. PKI/PKIZ - Multiple Data Centers

![alt text](../imgs/38.png)

Cùng kịch bản tương tự như mutiple data centers với uuid, tuy nhiên khi yêu cầu keystone cấp một pki token và sử dụng key đó để thực hiện yêu cầu tạo máy ảo thì trên cả 2 data center US-West và US-East, keystone middle cấu hình trên nova đều xác thực và ủy quyền thành công, tạo ra máy ảo theo đúng yêu cầu. Điều này trông có vẻ như PKI/PKiZ token hỗ trợ multiple data centers, nhưng thực tế thì các backend database ở hai datacenter phải có quá trình đồng bộ hoặc tạo bản sao các PKI/PKIZ token thì mới thực hiện xác thực và ủy quyền được.

# 4. Fernet Tokens
## 4.1. Thông tin cơ bản
- Độ dài 255 ký tự (lớn hơn UUID nhưng nhỏ đáng kể so với PKI và PKIz)
- Chứa đủ thông tin cần thiết mà không phải lưu token trong database: user id, project id, thời gian expire, etc.
- Dựa trên phương pháp xác thực mật mã học - Fernet
- Sử dụng mã hóa khóa đối xứng.

## 4.2. Fernet Keys
- Fernet Keys lưu trữ trong /etc/keystone/fernet-keys:
    - Mã hóa với Primary Fernet Key
    - Giải mã với danh sách các Fernet Key
- Có ba loại file key:
    - Loại 1 - Primary Key sử dụng cho cả 2 mục đích mã hóa và giải mã fernet tokens. Các key được đặt tên theo số nguyên bắt đầu từ 0. Trong đó Primary Key có chỉ số cao nhất.
    - Loại 2 - Secondary Key chỉ dùng để giải mã. -> Lowest Index < Secondary Key Index < Highest Index
    - Stagged Key - tương tự như secondary key trong trường hợp nó sử dụng để giải mã token. Tuy nhiên nó sẽ trở thành Primary Key trong lần luân chuyển khóa tiếp theo. Stagged Key có chỉ số 0.
- Fernet Key format: fernet key là một chuẩn mã hóa base64 của Signing Key (16 bytes) và Encrypting Key (16 bytes): `Signing-key` ‖ `Encryption-key`

## 4.3. Fernet Key rotation

![alt text](../imgs/39.png)

Giả sử triển khai hệ thống cloud với keystone ở hai bên us-west và us-east. Cả hai repo này đều được thiết lập với 3 fernet key như sau:

```
$ ls /etc/keystone/fernet-keys
0 1 2
```

Ở đây 2 sẽ trở thành Primary Key để mã hóa fernet token. Fernet tokens có thể được mã hóa sử dụng một trong 3 key theo thứ tự là 2, 1, 0. Giờ ta quay vòng fernet key bên us-west, repo bên này sẽ đươc thiết lập như sau:

```
$ ls /etc/keystone/fernet-keys
0 1 2 3
```

Với cấu hình như trên, bên us-west, 3 trở thành Primary Key để mã hóa fernet token. Khi keystone bên us-west nhận token từ us-east (mã hóa bằng key 2), us-west sẽ xác thực token này, giải mã bằng 4 key theo thứ tự 3, 2, 1, 0. Keystone bên us-east nhận fernet token từ us-west (mã hóa bằng key 3), us-east xác thực token này vì key 3 bên us-west lúc này trở thành staged key (0) bên us-east, keystone us-east giải mã token với 3 key theo thứ tự 2, 1, 0.
Có thể cấu hình giá trị max_active_keys trong file /etc/keystone.conf để quy định tối đa số key tồn tại trong keystone. Nếu số key vượt giá trị này thì key cũ sẽ bị xóa.

## 4.4. Kế hoạch cho vấn đề rotated keys

Khi sử dụng fernet tokens yêu cầu chú ý về thời hạn của token và vòng đời của khóa. Vấn đề nảy sinh khi secondary keys bị remove khỏi key repos trong khi vẫn cần dùng key đó để giải mã một token chưa hết hạn (token này được mã hóa bởi key đã bị remove).
Để giải quyết vấn đề này, trước hết cần lên kế hoạch xoay khóa. Ví dụ bạn muốn token hợp lệ trong vòng 24 giờ và muốn xoay khóa cứ mỗi 6 giờ. Như vậy để giữ 1 key tồn tại trong 24h cho mục đích decrypt thì cần thiết lập max_active_keys=6 trong file keytone.conf (do tính thêm 2 key đặc biệt là primary key và staged key ). Điều này giúp cho việc giữ tất cả các key cần thiết nhằm mục đích xác thực token mà vẫn giới hạn được số lượng key trong key repos (/etc/keystone/fernet-keys/).

```
token_expiration = 24
rotation_frequency = 6
max_active_keys = (token_expiration / rotation_frequency) + 2
```

## 4.5. Fernet token
Keystone fernet token dựa trên mã hóa base64 bao gồm một số trường sau:   
- Fernet Format Version (0x80) - 8 bits, biểu thị phiên bản của định dạng token
- Current Timestamp – số nguyên 64-bit không dấu, chỉ nhãn thời gian tính theo giây, tính từ 1/1/1970, chỉ ra thời điểm token được tạo ra.
- Initialization Vector (IV) – key 128 bits sử dụng mã hóa AES và giải mã Ciphertext
- Ciphertext: là keystone payload kích thước biến đổi tùy vào phạm vi của token. Cụ thể hơn, với token có phạm vi project, Keystone Payload bao gồm: version, user id, method, project id, expiration time, audit ids
- HMAC: 256-bit SHA256 HMAC (Keyd-Hash Messasge Authentication Code) - Mã xác thực thông báo sử dụng hàm một chiều có khóa với signing key kết nối 4 trường ở trên.

## 4.6. Token Generation Workflow
- Tạo token
Với key và message nhận được, quá trình tạo fernet token như sau:
    - 1. Ghi thời gian hiện tại vào trường timestamp
    - 2. Lựa chọn một IV duy nhất
    - 3. Xây dựng ciphertext:
        - Padd message với bội số là 16 bytes (thao tác bổ sung một số bit cho văn bản trong mã hóa khối AES)
        - Mã hóa padded message sử dụng thuật toán AES 128 trong chế độ CBC với IV đã chọn và encryption-key được cung cấp
    - 4. Tính toán trường HMAC theo mô tả trên sử dụng signing-key mà người dùng được cung cấp
    - 5. Kết nối các trường theo đúng format token ở trên
    - 6. Mã hóa base64 toàn bộ token


![alt text](../imgs/47.png)

- Xác thực và khôi phục token   
Với một key và token, để xác thực token hợp lệ hay không và khôi phục lại thông điệp ban đầu, thực hiện các bước sau:
    - 1. base64url decode token
    - 2. Đảm bảo byte đầu tiên của token là 0x80
    - 3. Nếu đặt time-to-live cho token thì phải đảm bảo timestamp hợp lệ. (không quá xa so với hiện tại)
    - 4. Tính toán lại HMAC từ các trường khác và signing-key mà người dùng được cung cấp.
    - 5. Đảm bảo HMAC tính toán lại phải giống với giá trị trường HMAC trong token
    - 6. Giải mã ciphertext sử dụng AES 128 trong chế độ CBC với giá trị IV đã ghi lại cùng với encryption-key được cung cấp
    - 7. Unpadd plaintext đã giải mã, thu lại thông điệp ban đầu


## 4.7. Token validation workflow

![alt text](../imgs/48.png)

- Gửi yêu cầu xác thực token với phương thức: GET v3/auth/tokens
- Khôi phục lại padding, trả lại token với padding chính xác
- Decrypt sử dụng Fernet Keys để thu lại token payload
- Xác định phiên bản của token payload. (Unscoped token: 1, token trong tầm vực domain: 1, token trong tầm vực project: 2 )
- Tách các trường của payload để chứng thực. Ví dụ với token trong tầm vực project gồm các trường sau: user id, project id, method, expiry, audit id
- Kiểm tra xem token đã hết hạn chưa. Nếu thời điểm hiện tại lớn hơn so với thời điểm hết hạn thì trả về thông báo "Token not found". Nếu token chưa hết hạn thì chuyển sang bước tiếp theo
- Kiểm tra xem token đã bị thu hồi chưa. Nếu token đã bị thu hồi (tương ứng với 1 sự kiện thu hồi trong bảng revocation_event của database keystone) thì trả về thông báo "Token not found". Nếu chưa bị thu hồi thì trả lại token (thông điệp phản hồi thành công HTTP/1.1 200 OK )