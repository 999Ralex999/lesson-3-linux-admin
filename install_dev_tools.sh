#!/bin/bash
# Встановлення Docker
if ! command -v docker &> /dev/null; then
    echo "👉 Встановлюємо Docker..."
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
    echo "✅ Docker встановлено."
else
    echo "✅ Docker вже встановлений."
fi

# Встановлення Docker Compose

if ! command -v docker-compose &> /dev/null; then
    echo "👉 Встановлюємо Docker Compose..."
    sudo apt update
    sudo apt install -y docker-compose
    echo "✅ Docker Compose встановлено."
else
    echo "✅ Docker Compose вже встановлений."
fi

# Встановлення Python 3.9+

if ! command -v python3 &> /dev/null || [[ "$(python3 --version | cut -d " " -f2)" < "3.9" ]]; then
    echo "👉 Встановлюємо Python 3.9..."
    sudo apt update
    sudo apt install -y python3 python3-pip
    echo "✅ Python 3.9+ встановлено."
else
    echo "✅ Python 3 вже встановлений і має відповідну версію."
fi

# Встановлення Django через pip

if ! python3 -m django --version &> /dev/null; then
    echo "👉 Встановлюємо Django через pip..."
    pip3 install --break-system-packages django
    echo "✅ Django встановлено."
else
    echo "✅ Django вже встановлений."
fi
