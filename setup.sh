#!/bin/bash



#Ensure user is running script with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run script with sudo:"
    echo "sudo ./setup.sh"
    exit 1
fi



# Manage Permissions for GPIO
# Allow access to GPIO w/o sudo
echo 'SUBSYSTEM=="gpio", KERNEL=="gpio*", MODE="0666", GROUP="gpio"' | sudo tee /etc/udev/rules.d/99-gpio.rules
# Add current user to gpio group for pin control
sudo usermod -a -G gpio "$USER"



#Update System
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

echo "Installing git, build-essential, nodejs, npm..."
sudo apt install -y git build-essential nodejs npm

echo "Installing Node Version Manager and updating Node..."
sudo npm install -g n
sudo n 22

echo "Installing required packages..."
npm install

echo "Making INNERFACE executible..."
chmod +x INNERFACE
chmod +x start.sh



echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡘⢧⡀⠀    ⠀⢰⣶⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀   ⠀⡾⠁⠀⠙⢦⡀    ⢸⡏⠻⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡖⠶⠶⠒⠒⠒⠒⠓⠂⠀⠀⠀⠀⠀⠐⠒⠚⠛⠋⠉⠉⠉⠁⠀⠀⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀  ⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠙⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⢀⣠⣄⡀⠀⠀⠀⠀⢀⣠⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⣰⠏⢉⣼⣧⠀⠀⠀⢠⣿⣅⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⢠⡏⠀⠀⠀⠀⠀<- The Dev :3"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿ ⠀⠀⡯⠀⢸⣿⣿⠀⠀⠀⣾⣿⣿⠀⠀⠀⣷⠀⠀⠀⠀⠀⢀⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠛⠁⢀⠈⠁⠀⢸⣿⣿⠀⠀⠀⢹⣿⣿⠀⠀⠀⠉⠀⠀⠀⠈⠛⢿⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⢸⣧⣴⣀⣄⠉⣁⠐⣳⢀⣨⣟⠋⠀⠀⣀⣴⣠⠀⠀⠀⢀⡼⠃⠀⠀⠀⢰⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢶⡎⢳⣌⡉⠀⠀⠙⠻⣯⣉⢉⣿⠄⠀⠀⢉⣬⡿⠃⠀⠀⢾⡀⠀⠀⠀⠀⣸⠃⠙⠳⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⣀⡈⠙⠛⢳⡶⣤⣤⣭⣽⣭⡴⣶⠛⣿⣥⡄⢠⣤⣤⣼⡇⠀⡄⣾⠀⣿⠀⠀⠀⠀⠙⢦⡄⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢰⡟⠛⠺⠷⢤⣤⣿⣿⣿⣤⡾⠟⣃⡿⠀⠀⠀⠀⠀⠀⠘⠃⡿⢀⡗⠀⠀⠀⠀⠀⠈⢻⣆⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣆⠀⠀⠀⢸⣏⣌⡙⡇⠀⠀⠺⣦⠀⠀⠀⠀⠀⠀⣼⣄⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠹⣇⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢙⣷⠀⠀⠀⠛⠛⠛⠁⠀⠀⣾⠁⠀⠀⠀⠀⠀⢰⡟⢹⣆⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠁⠀⠀⠀⠀⣤⠀⠀⠀⢰⣾⠀⠀⠀⠀⠀⣠⡟⠀⠀⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⡟⠛⠛⠀⣠⡟⠀⠀⠀⢸⢹⡄⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⣿⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⣿⡇⠀⠀⠀⢸⠸⣇⣀⡴⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⢻⠀⡄"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠀⠀⠀⣿⠀⠀⠀⠀⣿⠀⠻⣏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⢼⣰⡇"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⠶⠛⠋⣿⠀⠀⢠⡏⠀⠀⠀⠀⡿⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⢁⡿⠾⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⠿⠀⠀⠀⣿⠀⠀⣸⠃⠀⠀⠀⢠⡏⠀⠀⠀⠀⢹⡷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠈⠁⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣟⠁⠀⠀⠀⠀⢶⣿⠀⢠⡟⠀⠀⠀⠀⢸⠅⠀⠀⠀⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠃⠀⠀⠀⠀⠘⣿⢀⡾⠁⠀⠀⠀⠀⣿⠀⠀⠀⠀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠿⢦⣄⡀⠀⠀⠀⠀⡏⣼⠃⠀⠀⠀⠀⢀⡿⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⢀⣴⠟⠓⠤⡀⠈⠹⣦⡀⠀⠐⣷⣷⡇⠀⢠⡄⠀⣼⣃⣀⣀⣀⠀⠀⡇⠀⠀⠀⠲⣄⡀⠀⠀⠀⣈⡽⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⣠⠿⠅⣀⠀⠀⠈⠳⡄⠸⣧⠀⣠⡿⠿⢷⢤⣬⣿⡾⠛⠉⠉⠉⠉⠷⣴⡇⠀⠀⠀⠀⠈⠙⠛⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⣠⡾⢁⡀⠀⠀⠑⢄⠀⠀⠸⣄⣿⠟⠉⠀⠀⠀⠀⠀⢸⣇⠤⠤⠦⠤⠤⢀⣹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⢀⣴⠋⠀⠀⠈⠑⢄⠀⠀⢣⠀⣠⡟⠁⠀⠀⠀⠀⠀⠀⠀⢸⠇⠀⠀⠀⠀⠀⠀⠉⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⢰⡏⣴⠉⠑⣢⣄⠀⠀⢳⣀⣴⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠈⠿⣏⠀⠀⢿⠀⣳⣤⡶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣀⣀⡀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠋⠙⠛⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠉⠓⠢⣼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣀⠀⣀⣀⡀⠀⣸⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⢰⡇⠀⠀⢿⢑⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣷⣀⣤⣼⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo ""
echo ""
echo ""
echo ""
echo "v1.0.0"
echo "Thank you for installing INNERFACE."
echo "Setup complete. Restart your device or continue with installation guide."
