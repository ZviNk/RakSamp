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
        libx11-6 \
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

# Установка переменной окружения DISPLAY для работы с Wine без графики
ENV DISPLAY=:0

# Запуск wine в безголовом режиме (без зависимости от X-сервера)
RUN winecfg || true
RUN wineboot --init || true

WORKDIR /usr/src/app

# Копирование package.json и установка зависимостей
COPY package*.json ./
RUN npm install

# Копирование оставшихся файлов
COPY . .

# Запуск Node.js приложения
CMD ["node", "index.js"]
