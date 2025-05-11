#!/bin/bash

# Установка Docker
echo "⏳ Устанавливаем Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
rm -f get-docker.sh

# Добавляем текущего пользователя в группу docker
echo "🔐 Добавляем пользователя $USER в группу docker..."
sudo usermod -aG docker $USER

# Запускаем Docker
echo "🚀 Запускаем Docker..."
sudo systemctl enable docker
sudo systemctl start docker

# Клонируем Blockcast и запускаем контейнеры
echo "📦 Клонируем Blockcast..."
sudo bash -c '
    git clone https://github.com/stanislavcrypto/Blockcast.git || exit 1
    cd Blockcast || exit 1
    docker compose pull
    docker compose up -d
    docker compose exec blockcastd blockcastd init
'


