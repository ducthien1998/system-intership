# ID chat Telegram
USERID="Your ID"

# API Token bot
TOKEN="Your TOKEN"

TIMEOUT="10"

# URL gửi tin nhắn của bot
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

# Thời gian hệ thống
DATE_EXEC="$(date "+%d %b %Y %H:%M")"

# File temp
TMPFILE='/tmp/ipinfo.txt'

if [ -n "$SSH_CLIENT" ]; then
    IP=$(echo $SSH_CLIENT | awk '{print $1}')
    PORT=$(echo $SSH_CLIENT | awk '{print $3}')
    HOSTNAME=$(hostname -f)
    IPADDR=$(echo $SSH_CONNECTION | awk '{print $3}')

    # Lấy các thông tin từ IP người truy cập theo trang ipinfo.io
    PUBLIC_IP=$(curl -s https://ipinfo.io/ip)
    curl http://ipinfo.io/$PUBLIC_IP -s -o $TMPFILE
    CITY=$(cat $TMPFILE | jq -r '.city')
    REGION=$(cat $TMPFILE | jq -r '.region')
    COUNTRY=$(cat $TMPFILE | jq -r '.country')
    ORG=$(cat $TMPFILE | jq -r '.org')

    # Nội dung cảnh báo
    TEXT=$(echo -e "Thời gian: $DATE_EXEC\nUser: $USER logged in to $HOSTNAME($IPADDR) \nFrom $IP - $ORG - $CITY, $REGION, $COUNTRY on port $PORT")

    # Gửi cảnh báo
    curl -s -X POST --max-time $TIMEOUT $URL -d "chat_id=$USERID" -d text="$TEXT" > /dev/null

    # Xóa file temp khi script thực hiện xong
    rm $TMPFILE
fi