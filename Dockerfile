FROM node:22.9.0-bookworm

# Чтобы apt-get install не ждал ввода
ENV DEBIAN_FRONTEND=noninteractive

# Добавляем i386-архитектуру и устанавливаем необходимые пакеты
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        tzdata \
        xvfb \
        xauth \
        libgl1-mesa-glx \
        libgl1-mesa-dri \
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

# Задаём временную зону
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Удаляем старый wineprefix (если существует)
RUN rm -rf /root/.wine

# Инициализируем новый wineprefix с помощью winecfg (через xvfb-run для поддержки X)
RUN xvfb-run winecfg

# Дополнительная инициализация wine
RUN wineboot --init

# Создаём рабочую директорию и устанавливаем пакет dbus-x11
WORKDIR /usr/src/app

# Копируем файлы зависимостей и устанавливаем node-модули
COPY package*.json ./
RUN npm install

# Копируем весь исходный код приложения
COPY . .

# Запускаем приложение
CMD ["node", "index.js"]
