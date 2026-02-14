#!/bin/bash

# ---- ตรวจว่า python3-venv มีไหม ----
if ! dpkg -s python3-venv >/dev/null 2>&1; then
    echo "Installing python3-venv..."
    sudo apt update
    sudo apt install -y python3-venv
fi

# ---- ตรวจว่า venv มีไหม ----
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# ---- Activate venv ----
source venv/bin/activate

# ---- ตรวจว่า requirements ลงแล้วไหม ----
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install -r requirements.txt
fi

# ---- Run app ----
echo "Starting Flask app..."
python3 app.py