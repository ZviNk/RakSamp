# Используем официальный образ Node.js (например, Node 14)
FROM node:14

# Добавляем архитектуру i386 и обновляем пакеты, устанавливаем wine, wine32 и Xvfb
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine wine32 xvfb && \
    rm -rf /var/lib/apt/lists/*

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
