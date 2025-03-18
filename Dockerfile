FROM node:22.9.0-bookworm

# Чтобы apt-get install не ждал ввода
ENV DEBIAN_FRONTEND=noninteractive

# Добавляем i386-архитектуру и ставим все нужные пакеты
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
        winetricks corefonts \
        winetricks gdiplus \
        winetricks dotnet462 \
        libwine \
        libwine:i386 \
        fonts-wine && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Задаём временную зону
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Инициализируем wineprefix (важно делать до копирования и запуска)
RUN wineboot --init

# Создадим рабочую директорию
WORKDIR /usr/src/app

# Устанавливаем зависимости
COPY package*.json ./
RUN npm install

# Копируем весь код
COPY . .

# Запускаем через xvfb-run
CMD ["node", "index.js"]
