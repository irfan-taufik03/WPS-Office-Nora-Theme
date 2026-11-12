#!/bin/bash
# WPS Office Nora Theme Installer
# Copy and replace folder 2018white_dark into WPS Office skins directory

set -e

SKINS_DIR="/opt/kingsoft/wps-office/office6/skins"
SKIN_NAME="2018white_dark"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$EUID" -ne 0 ]; then
  echo "Silakan jalankan installer ini dengan sudo (hak root)."
  echo "Contoh: sudo bash install.sh"
  exit 1
fi

if [ ! -d "$SCRIPT_DIR/$SKIN_NAME" ]; then
  echo "Error: Folder $SKIN_NAME tidak ditemukan di $SCRIPT_DIR"
  exit 1
fi

if [ ! -d "$SKINS_DIR" ]; then
  echo "Directory skins tidak ditemukan di $SKINS_DIR, membuat baru..."
  mkdir -p "$SKINS_DIR"
fi

# Backup folder lama jika ada
if [ -d "$SKINS_DIR/$SKIN_NAME" ]; then
  echo "Membackup folder lama $SKIN_NAME ke $SKIN_NAME.bak.$(date +%s)..."
  mv "$SKINS_DIR/$SKIN_NAME" "$SKINS_DIR/$SKIN_NAME.bak.$(date +%s)"
fi

# Copy folder skin baru
echo "Menyalin $SKIN_NAME ke $SKINS_DIR..."
cp -r "$SCRIPT_DIR/$SKIN_NAME" "$SKINS_DIR/"

# Set permission
chmod -R 755 "$SKINS_DIR/$SKIN_NAME"
chown -R root:root "$SKINS_DIR/$SKIN_NAME"

echo "Selesai! Tema $SKIN_NAME telah terpasang di $SKINS_DIR/$SKIN_NAME"
echo "Silakan restart WPS Office untuk melihat perubahan tema."
