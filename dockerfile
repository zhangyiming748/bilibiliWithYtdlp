FROM python:3.9-alpine3.20 as builder

# 合并 RUN 命令并在同一层清理缓存
RUN apk update && \
    apk add --no-cache ffmpeg && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir yt-dlp && \
    rm -rf /var/cache/apk/* /root/.cache

# 设置别名
RUN echo 'alias ytb="yt-dlp --cookies /data/cookies.txt"' >> /root/.ashrc && \
    echo "echo 'ashrc is running'" >> /root/.ashrc

CMD [ "ash" ]
# docker build -t bili:latest .