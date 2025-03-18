FROM node:22.9.0-bookworm

# Подключаем i386-архитектуру и ставим нужные пакеты
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
        libwine \
        libwine:i386 \
        fonts-wine && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем часовой пояс
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Говорим Wine (и другим приложениям), что X-сервер будет "на 99-ом дисплее"
ENV DISPLAY=:99

WORKDIR /usr/src/app

# Устанавливаем зависимости node.js
COPY package*.json ./
RUN npm install

# Копируем исходники
COPY . .

# В production-контейнере используем единый CMD,
# где сначала запускаем Xvfb, а затем – node index.js
CMD Xvfb :99 -screen 0 1024x768x16 & node index.js
