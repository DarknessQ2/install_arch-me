#!/bin/bash
set -e

clear
echo "========================================="
echo " Instalador Arch + Caelestia (BIOS)"
echo "========================================="
echo

echo "APPS PACMAN que se instalarán:"
echo "-----------------------------------------"
echo "• Hyprland"
echo "• NetworkManager"
echo "• PipeWire (audio)"
echo "• Intel ucode + video integrado"
echo "• Kitty"
echo "• Nano / Neovim"
echo "• BlueZ (Bluetooth)"
echo "• UFW"
echo

echo "APPS FLATPAK que se instalarán:"
echo "-----------------------------------------"
echo "• Discord"
echo "• Firefox"
echo "• Google Chrome"
echo "• Steam"
echo "• PrismLauncher"
echo "• Krita"
echo "• LibreOffice"
echo "• Dolphin Emulator"
echo "• Sober"
echo

read -p "¿Instalar APPS PACMAN? (s/n): " PACMAN_APPS
read -p "¿Instalar APPS FLATPAK? (s/n): " FLATPAK_APPS

echo
echo "Resumen:"
echo "Pacman apps: $PACMAN_APPS"
echo "Flatpak apps: $FLATPAK_APPS"
echo
sleep 2

# ===== EJECUCIÓN =====

./disk.sh
./base.sh

if [[ "$PACMAN_APPS" == "s" || "$PACMAN_APPS" == "S" ]]; then
    echo ">> Instalando apps Pacman"
    ./base.sh
else
    echo ">> Saltando apps Pacman"
fi

if [[ "$FLATPAK_APPS" == "s" || "$FLATPAK_APPS" == "S" ]]; then
    echo ">> Instalando apps Flatpak"
    ./user.sh
else
    echo ">> Saltando apps Flatpak"
fi
