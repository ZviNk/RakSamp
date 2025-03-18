FROM node:22.9.0-bookworm

# Устанавливаем необходимые пакеты
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

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Рабочая директория
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json, ставим зависимости
COPY package*.json ./
RUN npm install

# Копируем остальные файлы (код)
COPY . .

# Запускаем приложение через xvfb-run. 
# --server-args позволяет вам задавать конфигурацию экрана.
CMD ["xvfb-run", "--server-args=-screen 0 1024x768x16 -nolisten tcp", "node", "index.js"]
