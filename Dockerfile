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

# Инициализируем wineprefix (важно делать до копирования и запуска приложения)
RUN wineboot --init

# Создаём рабочую директорию и устанавливаем дополнительные пакеты
WORKDIR /usr/src/app
RUN apt-get update && \
    apt-get install -y dbus-x11 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Копируем файлы зависимостей и устанавливаем node-модули
COPY package*.json ./
RUN npm install

# Копируем весь исходный код приложения
COPY . .

# Запускаем приложение
CMD ["node", "index.js"]
