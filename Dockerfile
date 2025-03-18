FROM node:22.9.0-bookworm

# Установка зависимостей
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

# Установка часового пояса
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Создание логов директории
RUN mkdir -p /home/crow/RakSamp/Arizona/logs

# Запуск Xvfb и инициализация wine
RUN Xvfb :99 -screen 0 1024x768x16 & \
    export DISPLAY=:99 && \
    sleep 2 && \
    wineboot --init || true

# Устанавливаем переменную окружения для DISPLAY
ENV DISPLAY=:99

WORKDIR /usr/src/app

# Копирование package.json и установка зависимостей
COPY package*.json ./
RUN npm install

# Копирование оставшихся файлов
COPY . .

# Запуск Node.js приложения
CMD ["node", "index.js"]
