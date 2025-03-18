# Используем официальный образ Node.js (например, Node 14)
FROM node:14

# Добавляем архитектуру i386, обновляем пакеты и устанавливаем wine, wine32, xvfb и winetricks
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 xvfb winetricks && \
    rm -rf /var/lib/apt/lists/*

# Устанавливаем wine-gecko с помощью winetricks в неинтерактивном режиме
RUN winetricks --unattended gecko

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Копируем файлы package.json и package-lock.json (если есть)
COPY package*.json ./

# Устанавливаем зависимости проекта
RUN npm install

# Копируем весь исходный код проекта в контейнер
COPY . .

# Запускаем приложение
CMD [ "node", "index.js" ]
