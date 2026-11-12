#!/bin/bash
# WPS Office Nora Theme Uninstaller

set -e

SKINS_DIR="/opt/kingsoft/wps-office/office6/skins"
SKIN_NAME="2018white_dark"

if [ "$EUID" -ne 0 ]; then
  echo "Silakan jalankan installer ini dengan sudo (hak root)."
  echo "Contoh: sudo bash uninstall.sh"
  exit 1
fi

if [ -d "$SKINS_DIR/$SKIN_NAME" ]; then
  echo "Menghapus $SKIN_NAME dari $SKINS_DIR..."
  rm -rf "$SKINS_DIR/$SKIN_NAME"
  echo "Selesai! Tema $SKIN_NAME telah dihapus."
else
  echo "Folder $SKIN_NAME tidak ditemukan di $SKINS_DIR."
fi
