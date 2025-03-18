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
        xserver-xorg-video-dummy \
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

RUN mkdir -p /home/crow/RakSamp/Arizona/logs

RUN Xvfb :99 -screen 0 1024x768x16 & \
    sleep 2 && \
    env DISPLAY=:99 wineboot --init || true

ENV DISPLAY=:99

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

CMD ["node", "index.js"]
