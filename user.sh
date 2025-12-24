#!/bin/bash
set -e

useradd -m luis
echo "luis:luis" | chpasswd
usermod -aG wheel luis

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

su - luis << 'EOF'

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y flathub \
com.discordapp.Discord \
org.mozilla.firefox \
com.google.Chrome \
com.valvesoftware.Steam \
org.prismlauncher.PrismLauncher \
org.kde.krita \
org.libreoffice.LibreOffice

git clone https://github.com/caelestia-dots/caelestia.git ~/.local/share/caelestia
fish ~/.local/share/caelestia/install.fish

EOF

