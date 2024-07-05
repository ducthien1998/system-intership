# Viết script "Hello World" để bot gửi qua telegram

Ta tạo 1 file script `hltlbot.sh`

```
touch hltlbot.sh
```

Bên trong file lần lượt khai báo các thông tin 
- USERID : ID group chat trên telegram muốn gửi thông báo đến
- TOKEN : API con bot của bạn 
- URL : url gửi tin nhắn của bot
- TEXT : Nội dung thông báo 

```
#!/bin/bash
# ID chat Telegram
USERID="-1001905581046"

# API Token bot
TOKEN="7003171125:AAGErRwQ31uMrLlaICRQfpqQwGNuni5uVjo"

# URL gui tin nhan cua bot
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

TEXT=$(echo -e "Hello World   ")
curl -s -X POST  $URL -d "chat_id=$USERID" -d text="$TEXT" > /dev/null
```

Cấp quyền thực thi cho file

```
chmod +x hltlbot.sh
```
