FROM python:3.9-alpine3.20 as builder

# 合并 RUN 命令并在同一层清理缓存
RUN apk update && \
    apk add --no-cache ffmpeg && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir yt-dlp && \
    rm -rf /var/cache/apk/* /root/.cache

# 复制启动脚本
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
# docker build -t bili:latest .