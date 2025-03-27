FROM ubuntu:20.04

# Добавляем поддержку i386 и обновляем репозитории
RUN dpkg --add-architecture i386 && apt-get update

# Устанавливаем Wine, xvfb и необходимые пакеты
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wine wine32 wget apt-transport-https software-properties-common xvfb

# Устанавливаем PowerShell Core
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell

# Задаем рабочую директорию
WORKDIR /app

# Копируем необходимые файлы и каталоги в контейнер
COPY raksamp/arizona.exe /app/
COPY raksamp/lua51.dll /app/
COPY run_bot.ps1 /app/
COPY raksamp/scripts /app/scripts
COPY raksamp/settings /app/settings

# Запускаем PowerShell-скрипт с обходом политики выполнения
CMD ["pwsh", "-ExecutionPolicy", "Bypass", "-File", "/app/run_bot.ps1"]
