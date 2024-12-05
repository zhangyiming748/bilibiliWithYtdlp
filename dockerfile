FROM python:3.9-alpine3.20
# docker run -dit --name ytdlp python:3.9-alpine3.20 ash
# docker exec -it ytdlp ash
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN apk add ffmpeg
RUN pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple
RUN pip install --upgrade pip
RUN pip install yt-dlp