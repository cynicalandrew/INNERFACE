#!/bin/bash



#Ensure user is running script with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run script with sudo:"
    echo "sudo ./start.sh"
    exit 1
fi



#Execute Scripts
sudo python3 controller.py
./INNERFACE --no-sandbox