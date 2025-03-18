FROM node:22.9.0-slim

RUN apt-get update && apt-get install -y \
    tzdata \
    software-properties-common \
    wget \
    gnupg2 \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libx11-6 \
    xvfb

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
        wine \
        wine32 \
        wine64 \
        libwine \
        libwine:i386 \
        fonts-wine && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /logs

RUN Xvfb :99 -screen 0 1024x768x16 & \
    env DISPLAY=:99 wineboot --init && \
    sleep 5 && \
    wineserver -k

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

ENV DISPLAY=:99

CMD [ "node", "index.js" ]
