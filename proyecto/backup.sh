#!/bin/bash
# backup_info.sh - Realiza copia de seguridad de archivos importantes

usuario=$1
host=$2

trap 'echo "[!] Cancelado."; exit 1' INT

fecha=$(date +%Y%m%d-%H%M%S)
echo "Conectando a $host para hacer backup de /etc/passwd, /etc/shadow, /etc/hostname, configuración de Apache y redes..."

ssh -tt "$usuario@$host" 'fecha=$(date +%Y%m%d-%H%M%S)
backup_name="backup-$fecha.tar.gz"

sudo mkdir -p /tmp/backup
sudo cp /etc/passwd /tmp/backup/
sudo cp /etc/shadow /tmp/backup/
sudo cp /etc/hostname /tmp/backup/
sudo cp -r /etc/apache2 /tmp/backup/apache2
sudo cp -r /etc/netplan /tmp/backup/netplan
cd /tmp && sudo tar -czf "$HOME/$backup_name" backup
sudo rm -r /tmp/backup

if [ -f "$HOME/$backup_name" ]; then
  echo "Backup creado en la máquina remota: $HOME/$backup_name"
else
  echo "Error: El archivo de backup no se ha generado correctamente."
fi'
