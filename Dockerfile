FROM node:22.9.0-bookworm

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        tzdata \
        software-properties-common \
        wget \
        gnupg2 \
        libgl1-mesa-glx \
        libgl1-mesa-dri \
        libx11-6 \
        xvfb \
        xauth \
        libnss3 \
        libasound2 \
        wine \
        wine32 \
        wine64 \
        winbind \
        libwine \
        libwine:i386 \
        fonts-wine && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

# 
# 1) Инициализируем Wine-префикс ещё во время сборки
#    (запускаем wineboot внутри виртуального X, чтобы Wine не
#    ругался на отсутствие дисплея).
#
RUN xvfb-run -a wineboot --init || true

#
# 2) В самом контейнере (в runtime) выставляем DISPLAY=:99
#    и стартуем Xvfb + node-приложение
#
ENV DISPLAY=:99

CMD Xvfb :99 -screen 0 1024x768x16 & node index.js
