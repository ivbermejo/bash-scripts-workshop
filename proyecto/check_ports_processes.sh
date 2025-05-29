#!/bin/bash
# check_ports_processes.sh - Ver puertos abiertos y procesos

usuario=$1
host=$2

trap 'echo "[!] Cancelado."; exit 1' INT

# Comprobar puertos abiertos con ss o netstat
echo "Comprobando puertos abiertos en $host..."
ssh "$usuario@$host" "command -v ss >/dev/null && ss -tuln || netstat -tuln"

# Mostrar procesos activos
echo ""
echo "Mostrando procesos activos en $host..."
ssh "$usuario@$host" "ps aux --sort=-%mem | head -n 10"
