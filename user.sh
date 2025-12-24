#!/bin/bash
set -e

USERNAME="luis"
PASSWORD="luis"

arch-chroot /mnt /bin/bash <<EOF

# Usuario
useradd -m -G wheel $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd

# Sudo seguro
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Paquetes necesarios
pacman -S --noconfirm --needed \
flatpak \
git \
fish

# Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Apps Flatpak
flatpak install -y flathub \
com.discordapp.Discord \
org.mozilla.firefox \
com.google.Chrome \
com.valvesoftware.Steam \
org.prismlauncher.PrismLauncher \
org.kde.krita \
org.libreoffice.LibreOffice

EOF

# Caelestia como usuario
arch-chroot /mnt sudo -u "$USERNAME" bash <<EOF
git clone https://github.com/caelestia-dots/caelestia.git /home/$USERNAME/.local/share/caelestia
fish /home/$USERNAME/.local/share/caelestia/install.fish
EOF
