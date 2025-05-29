#!/bin/bash
# check_services.sh - Comprobar estado de servicios

usuario=$1
host=$2

trap 'echo "[!] Cancelado."; exit 1' INT

# Comprobar y gestionar Apache2
echo "Comprobando estado del servicio Apache2..."
ssh -tt "$usuario@$host" 'if ! command -v apache2 >/dev/null; then
  echo "Apache2 no está instalado. Instalando..."
  sudo apt update && sudo apt install -y apache2
fi

estado=$(systemctl is-active apache2)
if [ "$estado" != "active" ]; then
  echo "Apache2 no estaba activo. Iniciando..."
  sudo systemctl start apache2
else
  echo "Apache2 ya está activo."
fi'

# Comprobar y gestionar cron
echo ""
echo "Comprobando estado del servicio cron..."
ssh -tt "$usuario@$host" 'estado=$(systemctl is-active cron)
if [ "$estado" != "active" ]; then
  echo "cron no estaba activo. Iniciando..."
  sudo systemctl start cron
else
  echo "cron ya está activo."
fi'

# Comprobar y gestionar UFW
echo ""
echo "Comprobando estado del firewall UFW..."
ssh -tt "$usuario@$host" 'estado=$(systemctl is-active ufw)
if [ "$estado" != "active" ]; then
  echo "UFW no estaba activo. Iniciando..."
  sudo systemctl start ufw
else
  echo "UFW ya está activo."
fi'
