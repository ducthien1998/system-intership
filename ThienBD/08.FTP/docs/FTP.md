# TÌM HIỂU VỀ FTP
# 1.FTP là gì 
## 1.1.Khái niệm

FTP(file transfer protocol) là giao thức truyền tải tập tin , được dùng trong việc trao đổi dữ liệu trong mạng thông qua giao thức TCP/IP , thường hoạt động trên 2 cổng 20 và 21 . Với giao thức này , các máy client trong mạng có thể truy cập đến máy chủ FTP để gửi hoặc lấy dữ liệu , đặc biệt người dùng có thể truy cập vào máy chủ FTP để truyền và nhận dữ liệu dù đang ở xa 

![Alt text](../imgs/1.png)

## 1.2.FTP dùng để làm gì 
- Được sử dụng để trao đổi tập tin qua mạng lưới truyền thông sử dụng TCP/IP (internet, mạng nội bộ,...)
- Sử dụng để tải xuống máy tính các file từ máy chủ 

Mặc dù việc truyền file từ hệ thống này sang hệ thống khác rất đơn giản và dễ hiểu, nhưng đôi khi xảy ra những vấn đề khác nhau. Ví dụ, 2 hệ thống có thể có các quy ước tập tin khác nhau, 2 hệ thống có các cách khác nhau để thể hiện văn bản và dữ liệu hay 2 hệ thống có cấu trúc thư mục khác nhau, … Giao thức FTP khắc phục những vấn đề này bằng cách thiết lập 2 kết nối giữa các máy chủ. Một kết nối để sử dụng truyền dữ liệu, 1 kết nối còn lại được sử dụng để điều khiển kết nối.

## 1.3. Ưu - Nhược điểm 
**Ưu điểm**
- Cho phép truyền nhiều tin cùng 1 lúc 
- Cho phép chuyển tệp tin nếu không may mất kết nối 
- Tự động chuyển tập tin bằng các Script
- Cho phép thêm dữ liệu vào khung chờ , và lên lịch truyền 
- Khả năng đồng bộ hóa tệp tin

**Nhược điểm**
- Khả năng bảo mật kém
- Không phù hợp cho các tổ chức , do yêu cầu phải tạo cổng kết nối khi truyền 
- Máy chủ có khả năng bị qua mặt , gửi thông tin đến các cổng ngẫu nhiên

# 2.Mô hình và nguyên lý hoạt động 
## 2.1.Mô hình cơ bản FTP
**Kết nối TCP trong FTP**

Giống như hầu hết các giao thức TCP/IP, FTP dựa trên mô hình Client – Server. Tuy nhiên, khác với các ứng dụng khác chạy trên nền TCP/IP, FTP cần tới 2 kết nối TCP:

![Alt text](../imgs/2.png)

- Control connection (sử dụng port 21 – trên server): Đây là kết nối TCP logic chính được tạo ra khi phiên làm việc được thiết lập. Nó được thực hiện giữa các quá trình điều khiển. Nó được duy trì trong suốt phiên làm việc và chỉ cho các thông tin điều khiển đi qua như lệnh hay response(phản hồi)
- Data connection (sử dụng port 20 – trên server): Kết nối này sử dụng các quy tắc rất phức tạp vì các loại dữ liệu có thể khác nhau. Nó được thực hiện giữa các quá trình truyền dữ liệu. Kết nối này mở khi có lệnh chuyển tệp và đóng khi tệp truyền xong.

**Mô hình FTP**

Do chức năng điều khiển và dữ liệu được truyền tải bằng cách sử dụng các kênh riêng biệt nên mô hình FTP chia mỗi thiết bị thành 2 phần giao thức logic chịu trách nhiệm cho mỗi kết nối ở trên:

![Alt text](../imgs/3.png)

- Protocol interpreter (PI): Là thành phần quản lý kênh điều khiển, phát và nhận lệnh và trả lời.
- Data transfer process (DTP): chịu trách nhiệm gửi và nhận dữ liệu giữa client và server.

**Chức năng từng thành phần trong mô hình FTP**
***Phía Server***
- Server Protocol Interpreter (Server-PI) : Chịu trách nhiệm quản lí Control Connection trên Server. Nó lắng nghe yêu cầu kết nối hướng từ User trên cổng 21. Khi kết nối được thiết lập, nó nhận lệnh từ User-PI, gửi phản hồi và quản lí tiến trình truyền dữ liệu trên Server.
- Server Data Transfer Process (Server-DTP) : chịu trách nhiệm nhận và gửi file từ User-DTP. Server-DTP vừa làm nhiệm vụ thiết lập Data Connection và lắng nghe Data Connection của User thông qua cổng 20. Nó tương tác với Server File System trên hệ thống cục bộ để đọc và chép file.

***Phía Client***
- User Interface: Đây là chương trình được chạy trên máy tính, nó cung cấp giao diện xử lí cho người dùng, chỉ có trên phía Client. Nó cho phép người dùng sử dụng những lệnh đơn giản để điều khiển các session FTP, từ đó có thể theo dõi được các thông tin và kết quả xảy ra trong quá trình.
- User Protocol Interpreter (User-PI): Chịu trách nhiệm quản lí Control Connection phía Client. Nó khởi tạo phiên kết nối FTP bằng việc phát hiện ra Request tới Server-PI. Sau khi kết nối được thiết lập, nó xử lí các lệnh nhận được trên User Interface, gửi chúng tới Server-PI rồi đợi nhận Response trở lại. Nó cũng quản lí các tiến trình trên Client.
- User Data Transfer Process (User-DTP): Có nhiệm vụ gửi hoặc nhận dữ liệu từ Server-DTP. User-DTP có thể thiết lập hoặc lắng nghe DataConnection từ Server thông qua cổng 20. Nó tương tác với Client File System trên Client để lưu trữ file.


## 2.2.Nguyên lý hoạt động
Cần có 2 kết nối TCP trong phiên làm việc của FTP : TCP Data connection trên cổng 20, TCP Control connection trên cổng 21
- Control connection : luôn được mở ở mọi thời điểm khi dữ liệu hoặc lệnh được gửi 
- Data connection : chỉ được mở khi có trao đổi dữ liệu thực

**Trình tự chung của FTP hoạt động như sau**
1. FTP Client mở Control connection đến FTP server (trên port 21) và chỉ định 1 cổng trên Client để Server gửi lại phản hồi. Đường kết nối này dùng để truyền lệnh và không phải là dữ liệu. Control connection sẽ mở trong suốt thời gian của phiên làm việc (telnet giữa 2 hệ thống)
2. Client chuyển tiếp thông tin như username, password tới Server để thực hiện xác thực (authentication). Server sẽ trả lời bằng mã chấp nhận hay từ chối của các request.
3. Client gửi thêm các lệnh với tên tệp, kiểu dữ liệu, … để vận chuyển, thêm luồng dữ liệu(tức là chuyển tập tin từ máy khách đến máy chủ hoặc ngược lại). Server sẽ phản hồi với mã (reply code) chấp nhận hoặc từ chối.
4. Khi dữ liệu đã sẵn sàng, 2 bên sẽ mở kết nối TCP trên cổng 20
5. Dữ liệu có thể được vận chuyển giữa Client và Server trên cổng 20. Dữ liệu vận chuyển được mã hóa theo 1 số định dạng bao gồm NVT-ASCII hoặc nhị phân(binary)
6. Khi quá trình vận chuyển dữ liệu được hoàn thành, phiên làm việc của FTP Server sẽ đóng lại Data Connection trên cổng 20. Nhưng vẫn giữ Control Connection trên công 21.
7. Control connection có thể được sử dụng để thiết lập truyền dữ liệu khác hoặc đóng liên kết.

## 2.3.Một số lệnh command sử dụng trên FTP

|Command|Đối số|Mô tả|
|---|---|---|
|USER|username|Username|
|PASS|password|Password|
|ACCT|account info|User account|
|CWD|pathname|Thay đổi thư mực làm việc|
|CDUP|none|Thay đổi thư mục cha|
|SMNT|pathname|Kết cấu|
|REIN|none|Dừng và khởi động lại|
|QUIT|none|Đăng xuất khỏi FTP|
|RETR|pathname|Láy tập tin từ máy chủ|
|STOR|pathname|Lưu trữ dữ liệu trên máy chủ|
|RNFR|pathname|Đổi tên từ |
|RNTO|pathname|Đổi tên thành|
|DELE|pathname|Xóa file|
|RMD|pathname|Xóa thư mục|
|MKD|pathname|Tạo thư mục|
|LIST|pathname|Liệt kê tập tin hoặc văn bản|
|STAT|pathname|Status|
|HELP|subject|Hiện màn hình trợ giúp|
|PORT|host-port|Chỉ định cổng vận chuyển|
|TYPE|type code|Kiểu vận chuyển(ASCII,image..)|
|MODE|mode code|Chế độ truyền(stream.block...)|

## 2.4.FTP reply
Mỗi lần User-PI gửi lệnh đến Server-PI qua Control connection, server sẽ gửi lại phản hồi dưới dạng các code. Code reply nhằm các mục đích sau:
- Xác nhận máy chủ đã nhận dược lệnh
- Cho biết lệnh từ phía người dùng có được chấp nhận hay không , nếu xảy ra lỗi thì đó là lỗi gì 
- Cho biêt nhiều thông tin khác nhau cho người dùng về phiên , ví dụ như : tình trạng truyền file....

**Cáu trúc của FTP reply code : `Xyz`**

*Ý nghĩa của X trong FTP reply code*

|Reply code format|Description|
|---|---|
|1yz|Đã khởi tạo hành động , chờ 1 reply trước khi gửi 1 lệnh khác |
|2yz|Hành động hoàn thành. Có thể gửi lệnh mới|
|3yz|Lệnh được chấp nhận. Nhưng bị giữ do thiếu thông tin|
|4yz|Lệnh không chấp nhận hoặc không hoàn thành . Tình trang lỗi tồn tại tạm thời .Lệnh có thể được ban hành lại|
|5yz|Lệnh không được chấp nhận hoặc đã hoàn thành .Không ban hành lại lện , ban hành lại lệnh sẽ dẫn đến cùng một lỗi |


Tham số y cung cấp thêm thông tin như bảng dưới. z cũng cung cấp thêm thông tin nhưng ý nghĩa chính xác có thể khác nhau giữa các cài đặt.

|Reply code format|Description|
|---|---|
|x0z|Lỗi cú pháo hoặc lệnh bất hợp pháp|
|x1z|Trả lời request thông tin |
|x2z|Trả lời đề cập đến Connection Management|
|x3z|Trả lời lệnh xác thực |
|x4z|Trả lời trạng thái máy chủ |
|x5z|Thông điệp trả lời là hồi âm liên quan đến hệ thống tập tin|


# 3.Kênh dữ liệu trong FTP
Kênh điều khiển được tạo ra giữa Server-PI và User-PI, sử dụng quá trình thiết lập kết nối và chứng thực được duy trì trong suốt phiên kết nối FTP. Các lệnh và các hồi đáp được trao đổi giữa bộ phận PI (Protocol Interpreter) qua kênh điều khiển, những dữ liệu thì không.

Mỗi khi cần phải truyền dữ liệu giữa các server và client, một kênh dữ liệu cần phải được tạo ra. Kênh dữ liệu kết nối bộ phận User-DTP và Server-DTP. Kết nối này cần thiết cho cả hoạt động truyền file trực tiếp (gửi hoặc nhận một file) cũng như đối với việc truyền dữ liệu ngầm, như là yêu cầu một danh sách file trong thư mục nào đó trên server.

Để tạo ra kênh dữ liệu, FTP sử dụng 2 phương thức khác nhau: Normal (Active) Data Connections (mặc định) và Passive Data Connections.

Khác biệt giữa 2 phương thức này là phía Client hay bên Server đưa ra yêu cầu khởi tạo kết nối.

## 3.1.Normal (Active) Data Connections
Phương thức tạo kết nối dữ liệu bình thường hay còn gọi là Kết nối kênh dữ liệu ở dạng chủ động.

Phía Server-DTP tạo kênh dữ liệu bằng cách mở một cổng kết nối tới User-DTP. Server sử dụng cổng đặc biệt được dành riêng cho kết nối dữ liệu là cổng số 20. Trên máy Client, cổng mặc định được sử dụng chính là cổng được sử dụng để kết nối điều khiển, nhưng Server sẽ thường chọn mỗi cổng khác nhau cho mỗi chuyển giao.

## 3.2.Passive Data Connections

Phương thức tạo kết nối bị động.
- Server sẽ chấp nhận 1 yêu cầu kết nối dữ liệu được khởi tạo từ Client.
- Server sẽ trả lời lại phía Client với địa chỉ IP cũng như địa chỉ cổng mà Server sẽ sử dụng.
- Sau đó phía Server-DTP lắng nghe trên cổng này một kết nối TCP đến từ User-DTP.
- Theo mặc định, phía Client sẽ sử dụng cùng cổng mà nó sử dụng cho Control Connection như trong trường hợp chủ động. Tuy nhiên, trong phương pháp này, Client cũng có thể chọn sử dụng một cổng khác cho Data Connection nếu cần thiết.


# 4.Các phương thức truyền dữ liệu trong FTP
Giao thức FTP có 3 phương thức truyền dữ liệu từ máy Server đến máy Client và ngược lại. Đó là các phương thức Compressed mode, Stream mode và Block mode:

## 4.1. Stream mode
- Dữ liệu truyền đi liên tiếp dưới dạng các byte không cấu trúc.
- Thiết bị gửi chỉ đơn thuần đẩy luồng dữ liệu qua kết nối TCP tới phía nhận.
- Không có trường tiêu đề nhất định
- Không có cấu trúc dạng Header, nên việc báo hiệu kết thúc file sẽ đơn giản được thực hiện khi thiết bị gửi ngắt kênh kết nối dữ liệu khi đã truyền dữ liệu xong.
- Được sử dụng nhiều nhất trong 3 phương thức trong triển khai FTP thực tế. Do
  - Là phương thức mặc định và đơn giản nhất.
  - Là phương thức phổ biến nhất, vì nó xử lí các file chỉ đơn thuần là xử lí dòng byte, mà không cần để ý tới nội dung.
  - Không tốn 1 lượng byte “overload” nào để thông báo Header

## 4.2.Block mode
- Phương thức truyền dữ liệu mang tính quy chuẩn hơn.
- Dữ liệu được chia thành nhiều khối nhỏ và đóng gói thành các FTP block.
- Mỗi block có 1 trường Header 3 byte: báo hiệu độ dài, và chứa thông tin về các khối dữ liệu đang được gửi.
- Một thuật toán đặc biệt được sử dụng để kiểm tra các dữ liệu đã truyền đi. Và để phát hiện, khởi tạo lại đối với 1 phiên truyền dữ liệu đã bị ngắt kết nối.

## 4.3. Compressed mode
- Phương thức truyền dữ liệu sử dụng 1 kỹ thuật nén đơn giản, là “run-lenght encoding (mã hóa chiều dài)” – có tác dụng phát hiện và xử lí các đoạn lặp trong dữ liệu được truyền đi để giảm chiều dài của toàn bộ thông điệp.
- Thông tin sau khi được nén, sẽ được xử lí như Block mode, với trường Header.
- Trong thực tế, việc nén dữ liệu thường được thực hiện ở chỗ khác, làm cho phương thức Compressed mode trở nên không cần thiết.


# 5.Dữ liệu trong FTP

Các tập tin được coi như một tập hợp các byte. FTP không quan tâm nội dung tập tin, sẽ chỉ đơn giản là di chuyển các tệp tin, các byte cùng 1 thời điểm, từ nơi này sang nơi khác.

## 5.1.FTP Data Types:
Phần đầu tiên của thông tin có thể được đưa ra về tập tin là kiểu dữ liệu của nó.

Có 4 kiểu dữ liệu khác nhau được quy định trong chuẩn của FTP.

- **ASCII**: file văn bản ASCII
- **EBCDIC**: tương tự ASCII, nhưng sử dụng kiểu kí tự EBCDIC do IBM đặt.
- **Image**: Các tập tin không có cấu trúc nội bộ chính thức.
- **Local**: Kiểu dữ liệu này được sử dụng để xử lí các tập tin có thể lưu trữ dữ liệu trong byte logic. Cách xác định loại này cùng với cách dữ liệu có cấu trúc cho phép dữ liệu được lưu trữ trên hệ thống đích một cách phù hợp với đại diện local của nó.

Trong thực tế, hai loại kiểu dữ liệu thường xuyên nhất được sử dụng là ASCII và Image. Kiểu ASCII được sử dụng cho các tập tin văn bản, và cho phép chúng được di chuyển giữa các hệ thống với dòng kết thúc mã chuyển đổi tự động. Loại Image được sử dụng cho các tập tin nhị phân, chẳng hạn như đồ họa hình ảnh, tập tin ZIP và các dữ liệu khác. Nó cũng thường được gọi là kiểu nhị phân vì lý do đó.


## 5.2.FTP Format Control
Đối với các loại ASCII và EBCDIC, FTP xác định 1 tham số tùy chọn được gọi là “format control” (điều khiển định dạng), nó cho phép người dùng chỉ định một đại diện cụ thể cho cách sử dụng định dạng dọc để mô tả tệp.

Các tùy chọn kiểm soát định dạng được tạo ra cho mục đích cụ thể đúng cách xử lý các tập tin chuyển giao từ các thiết bị máy chủ đến máy in. Nó không được sử dụng ngày nay, hoặc nếu nó được sử dụng, nó chỉ là trong ứng dụng đặc biệt.

3 tùy chọn trong FTP Format Control:

- **Non Print** : Đây là tùy chọn mặc định, cho biết không có định dạng dọc
- **Telnet Format** : Tệp sử dụng các kí tự điều khiển định dạng dọc, như được chỉ định trong giao thức Telnet
- **Carriage Control/FORTRAN** : Tệp sử dụng kí tự điều khiển được định dạng đưa ra làm kí tự đầu tiên của mỗi dòng, như được xác định cho ngôn ngữ lập trình FORTRAN.

## 5.3.FTP Data Structures
Ngoài việc xác định một loại dữ liệu tệp tin, ta cũng có thể xác định cấu trúc tệp tin theo 3 cách:

- **File Structure** : Tệp là 1 luồng byte liền kề không có cấu trúc bên trong. Đây là cách mặc định và được sử dụng cho hầu hết các loại tệp.
- **Record Structure** : Tệp bao gồm một tập hợp các bản ghi, mỗi bản ghi được phân định bằng đánh dấu end-of-record. Cấu trúc bản ghi có thể sử dụng cho các tệp văn bản ASCII, nhưng chúng thường được gửi với cấu trúc tệp thông thường sử dụng kiểu dữ liệu ASCII.
- **Page Structure** : Tệp chứa 1 trang dữ liệu được lập chỉ mục đặc biệt. Cấu trúc này không được sử dụng phổ biến. Nó được tạo ra cho 1 máy tính cổ xưa được sử dụng trong ARPAnet đời đầu.

*Tài liệu tham khảo*

[1] [https://kb.pavietnam.vn/ftp-la-gi-cach-su-dung-uu-diem-va-nhuoc-diem-cua-ftp.html](https://kb.pavietnam.vn/ftp-la-gi-cach-su-dung-uu-diem-va-nhuoc-diem-cua-ftp.html)
[2] [https://news.cloud365.vn/ftp-tim-hieu-ve-giao-thuc-ftp/](https://news.cloud365.vn/ftp-tim-hieu-ve-giao-thuc-ftp/)
[3] [https://vi.wikipedia.org/wiki/FTP](https://vi.wikipedia.org/wiki/FTP)