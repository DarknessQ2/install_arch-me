# install_arch-me

## Hola 👋
Esto **NO es un dotfile**.  
Es mi configuración personal para instalar **Arch Linux automáticamente**
con todo lo que uso.

El repo es público porque no puedo hacerlo privado 😅  
Si te sirve, úsalo o modifícalo.

---

## ⚠️ ADVERTENCIAS IMPORTANTES

🚨 **BORRA TODO EL DISCO**  
🚨 **SOLO BIOS / LEGACY**  
🚨 **SOLO Intel con gráfica integrada (vieja)**  

❌ NO NVIDIA  
❌ NO AMD  
❌ NO UEFI  

Si tu hardware no cumple esto, **NO lo uses tal cual**.

---

## 📦 Qué instala

### Sistema base
- Arch Linux
- GRUB BIOS (legacy)
- NetworkManager
- PipeWire (audio)
- Intel ucode + mesa
- ZRAM (swap en RAM)

### Escritorio
- Hyprland
- Caelestia

### Apps (Pacman)
- Kitty
- mpvpaper
- swww
- BlueZ
- UFW
- Pavucontrol

### Apps (Flatpak)
- Discord
- Firefox
- Chrome
- Steam
- PrismLauncher
- Krita
- LibreOffice
- Dolphin Emulator
- Sober

---
ojo este repo usa caelestial y no uses esto si no lo corre tu compu

## 🚀 Uso (desde Arch ISO)

```bash
git clone https://github.com/DarknessQ2/install_arch-me.git
cd install_arch-me
chmod +x *.sh
./install_all.sh
