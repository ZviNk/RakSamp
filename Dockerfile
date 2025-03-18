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

# Создаем непользователь root, например "app"
RUN useradd -ms /bin/bash app

# Переключаемся на пользователя "app"
USER app
WORKDIR /home/app

# Копируем файлы и устанавливаем зависимости с корректными правами
COPY --chown=app:app package*.json ./
RUN npm install
COPY --chown=app:app . .

# Инициализируем Wine-префикс (он будет создан в /home/app/.wine)
RUN xvfb-run -a wineboot --init || true

ENV DISPLAY=:99

# Запускаем Xvfb и node-приложение
CMD Xvfb :99 -screen 0 1024x768x16 & node index.js
