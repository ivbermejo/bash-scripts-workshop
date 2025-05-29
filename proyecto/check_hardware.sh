#!/bin/bash
# check_hardware.sh - Comprobar uso de CPU, RAM y disco

usuario=$1
host=$2

trap 'echo "[!] Cancelado."; exit 1' INT

echo "Comprobando CPU..."
ssh "$usuario@$host" "top -bn1 | grep 'Cpu(s)'"

echo ""
echo "Comprobando memoria RAM..."
ssh "$usuario@$host" "free -h"

echo ""
echo "Comprobando espacio en disco..."
ssh "$usuario@$host" "df -h"
