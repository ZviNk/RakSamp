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

# Создание директории для логов
RUN mkdir -p /home/crow/RakSamp/Arizona/logs

# (Удаляем переменную DISPLAY, так как она не требуется)

# Инициализация Wine (если не требуется, можно убрать winecfg)
RUN winecfg || true
RUN wineboot --init || true

WORKDIR /usr/src/app

# Копирование package.json и установка зависимостей
COPY package*.json ./
RUN npm install

# Копирование остальных файлов
COPY . .

# Запуск Node.js приложения
CMD ["node", "index.js"]
