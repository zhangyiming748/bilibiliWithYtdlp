FROM python:3.9-alpine3.20
# docker run -dit --name bili -v ./data:/data -v ./videos:/videos bili:latest ash
# docker exec -it bili ash
# RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN apk add ffmpeg
# RUN pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/simple
RUN pip install --upgrade pip
RUN pip install yt-dlp

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
# docker build -t bili:latest .