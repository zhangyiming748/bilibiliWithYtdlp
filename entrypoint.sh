#!/bin/ash

# 读取网址列表文件
url_list="/list.txt"

# 按行读取网址列表
while IFS= read -r url
do
  # 在这里处理每个网址，例如访问网址、下载内容等
  echo "处理网址： $url"
  yt-dlp --cookies /cookies.txt -f bestvideo[height<=?1080]+bestaudio/best[height<=?1080]/mp4 --paths /data $url
done < "$url_list"