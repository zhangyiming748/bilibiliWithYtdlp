FROM python:3.9-alpine3.20
# docker run -dit --name ytdlp -v ./cookies.txt:/cookies.txt zhangyiming748/ytdlp ash
# docker exec -it ytdlp ash
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN apk add ffmpeg
# RUN pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple
RUN pip install --upgrade pip
RUN pip install yt-dlp

# 创建并编辑.ashrc 文件来定义别名（确保交互式 shell 中可用）
RUN echo 'alias ytb="yt-dlp --cookies /cookies.txt --paths /data"' >> /etc/profile
RUN echo 'echo "profile is run"' >> /etc/profile
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]