# Путь до exe-файла
$exePath = "/app/arizona.exe"

if (-Not (Test-Path $exePath)) {
    Write-Host "Файл $exePath не найден!"
    exit 1
}

try {
    # Запускаем .exe через Wine в виртуальном X-сервере с помощью xvfb-run
    Start-Process "xvfb-run" -ArgumentList "wine", $exePath, "-project", "1", "-server", "102" -NoNewWindow
    Write-Host "Процесс запущен успешно."
}
catch {
    Write-Host "Ошибка при запуске процесса: $_"
}

# Бесконечное ожидание, чтобы контейнер не завершался
while ($true) {
    Start-Sleep -Seconds 3600
}
