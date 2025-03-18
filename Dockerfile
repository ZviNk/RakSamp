# Используем официальный образ Node.js (например, Node 14)
FROM node:14

# Добавляем архитектуру i386, обновляем пакеты и устанавливаем wine, wine32, xvfb и wget
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 xvfb wget && \
    rm -rf /var/lib/apt/lists/*

# Скачиваем winetricks и делаем его исполняемым
RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/local/bin/winetricks && \
    chmod +x /usr/local/bin/winetricks

# Устанавливаем wine-gecko через winetricks в неинтерактивном режиме
RUN winetricks --unattended gecko

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Копируем файлы package.json и package-lock.json (если есть)
COPY package*.json ./

# Устанавливаем зависимости проекта
RUN npm install

# Копируем весь исходный код проекта в контейнер
COPY . .

# (При необходимости) открываем порт, если приложение его использует
# EXPOSE 3000

# Запускаем приложение
CMD [ "node", "index.js" ]
