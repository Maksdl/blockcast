#!/bin/bash

# Клонируем Blockcast и запускаем контейнеры
echo "📦 Клонируем Blockcast..."
sudo bash -c '
    git clone https://github.com/stanislavcrypto/Blockcast.git || exit 1
    cd Blockcast || exit 1
    docker compose pull
    docker compose up -d
    docker compose exec blockcastd blockcastd init
'


