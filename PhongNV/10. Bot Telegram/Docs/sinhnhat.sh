#!/bin/bash

# Cài đặt các biến cần thiết
TOKEN="Your Token"
CHAT_ID="Your ID"
BIRTHDAY_FILE="/home/phong123/sinhnhat.txt"
TODAY=$(date +%m-%d)
TMPFILE=$(mktemp)

# Đọc tệp tin chứa ngày sinh nhật
while IFS= read -r line; do
  IFS=';' read -r -a bday <<< "$line"
  if [[ "${bday[1]}" == "$TODAY" ]]; then
    # Gửi thông báo đến Telegram
    MESSAGE="Chúc mừng sinh nhật ${bday[0]}!"
    curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" -d "chat_id=${CHAT_ID}&text=${MESSAGE}" > "$TMPFILE"
    if grep -q '"ok":false' "$TMPFILE"; then
      echo "Gửi thông báo không thành công."
    else
      echo "Gửi thông báo thành công."
    fi
  fi
done < "$BIRTHDAY_FILE"

# Xóa tệp tin tạm
rm "$TMPFILE"