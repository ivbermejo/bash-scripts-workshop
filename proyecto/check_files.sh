#!/bin/bash
# check_files.sh - Verificar archivos importantes

usuario=$1
host=$2

trap 'echo "[!] Cancelado."; exit 1' INT

echo "Comprobando archivo /etc/passwd..."
ssh "$usuario@$host" "ls -l /etc/passwd && stat -c '%y' /etc/passwd"

echo ""
echo "Comprobando archivo /etc/shadow..."
ssh "$usuario@$host" "ls -l /etc/shadow && stat -c '%y' /etc/shadow"

echo ""
echo "Comprobando archivo /etc/hostname..."
ssh "$usuario@$host" "ls -l /etc/hostname && stat -c '%y' /etc/hostname"
