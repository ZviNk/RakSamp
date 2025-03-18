# Используем официальный образ Ubuntu как базовый
FROM ubuntu:20.04

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем переменные окружения для недавней версии Wine
ENV DEBIAN_FRONTEND=noninteractive

# Обновляем и устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    unzip \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    lsb-release \
    sudo \
    build-essential \
    libx11-dev \
    libxrandr-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxi-dev \
    libasound2-dev \
    libgl1-mesa-glx \
    nodejs \
    npm && \
    apt-get clean

# Добавляем репозиторий WineHQ и устанавливаем Wine
RUN dpkg --add-architecture i386 && \
    wget -nc https://dl.winehq.org/wine-builds/Release.key && \
    apt-key add Release.key && \
    sudo add-apt-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ focal main" && \
    apt-get update && \
    apt-get install -y --install-recommends winehq-stable && \
    apt-get clean

# Устанавливаем Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем все файлы из текущей директории в контейнер
COPY . .

# # Открываем порты (если нужно для взаимодействия с сервером)
# EXPOSE 8080

# Устанавливаем переменные окружения для Wine
ENV WINEPREFIX=/wineprefix
ENV WINEARCH=win64

# Команда для запуска приложения
CMD ["node", "index.js"]
