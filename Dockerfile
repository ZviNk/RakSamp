FROM node:22.9.0-bookworm

# Установка зависимостей (Wine, Xvfb и прочее)
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
        fonts-wine \
        xvfb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Установка часового пояса
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Создание директории для логов
RUN mkdir -p /home/crow/RakSamp/Arizona/logs

# Инициализация Wine и отключение автоматического запуска explorer.exe (NoDesktop)
RUN wineboot --init || true
RUN wine reg add "HKCU\\Software\\Wine\\Explorer" /v NoDesktop /t REG_SZ /d 1 /f || true

# Устанавливаем переменные окружения для Wine
ENV DISPLAY=:99
ENV WINEDEBUG=-ole

WORKDIR /usr/src/app

# Копирование package.json и установка зависимостей
COPY package*.json ./
RUN npm install

# Копирование остальных файлов приложения
COPY . .

# Запуск Xvfb в фоне (на дисплее :99) и затем Node.js приложения
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x16 & node index.js"]
