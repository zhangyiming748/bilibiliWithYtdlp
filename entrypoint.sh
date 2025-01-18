#!/bin/ash

# 读取网址列表文件
url_list="/data/list.txt"

# 按行读取网址列表
while IFS= read -r url
do
  # 在这里处理每个网址，例如访问网址、下载内容等
  echo "处理网址： $url"
  # 使用 awk 按空格分割并处理
  link=$(echo "$url" | awk '{print $1}')
  name=$(echo "$url" | awk '{print $2}')
  echo $link
  echo $name
  fname=${name}.mp4
  echo $fname
  yt-dlp --cookies /data/cookies.txt -f 'bestvideo[height<=?1080]+bestaudio/best[height<=?1080]/mp4' --paths /videos --output ${fname} $link
done < "$url_list"
# yt-dlp --cookies cookies.txt -f 'bestvideo[height<=?1080]+bestaudio/best[height<=?1080]/mp4' https://www.bilibili.com/video/BV1eJ411B7to
# 输入的字符串按照空格分割 空格前为真正的网址 空格后为文件名 shell实现