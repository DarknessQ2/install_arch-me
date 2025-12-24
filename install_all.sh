#!/bin/bash
set -e

chmod +x disk.sh base.sh user.sh

echo "===> DISK"
./disk.sh

echo "===> BASE"
export DISK
./base.sh

echo "===> USER + CAELESTIA"
./user.sh

echo "✅ Instalación completada. Reinicia."
