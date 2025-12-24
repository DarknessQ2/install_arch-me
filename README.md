# install_arch-me

## Hola 👋
Esto **NO es un dotfile**, es **mi configuración personal** para instalar **Arch Linux automáticamente** con todo lo que uso.

El repo es público porque no se puede hacer privado 😅,  
siéntete **libre de usarlo o modificarlo**, especialmente si quieres Arch ya listo con apps.

---

## ⚠️ IMPORTANTE

**ESTE SCRIPT BORRA TODO EL DISCO**

- ✅ **SOLO BIOS (Legacy)**
- ✅ **SOLO gráficas integradas Intel**

❌ NO NVIDIA  
❌ NO AMD  
❌ NO UEFI  

---

## 📦 Qué incluye

- Arch Linux base  
- GRUB BIOS (legacy)  
- NetworkManager  
- PipeWire (audio)  
- Hyprland (Wayland)  
- Caelestia  

### Apps vía Flatpak
- Discord  
- Firefox  
- Chrome  
- Steam  
- PrismLauncher  
- Krita  
- LibreOffice  

---

## 🚀 Uso (desde Arch ISO)

Clona el repositorio
y dale permiso y ejecutalo
```bash
git clone https://github.com/DarknessQ2/install_arch-me.git
cd install_arch-me

chmod +x *.sh

./install_all.sh
