#!/bin/bash
set -e

chmod +x disk.sh base.sh user.sh

echo "===> DISK"
./disk.sh

echo "===> BASE"
./base.sh

echo "===> USER / APPS / CAELESTIA"
./user.sh

echo "✅ Instalación completa. Reinicia."
