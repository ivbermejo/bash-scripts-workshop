#!/bin/bash
# monitor.sh - Script principal para lanzar otras tareas de monitorización

trap 'echo "\n[!] Interrumpido por el usuario."; exit 1' INT

remote_user="ivan"
remote_host="192.168.10.1"

show_menu() {
  echo ""
  echo "========= MENÚ ========="
  echo "1) Comprobar hardware (CPU, RAM, Disco)"
  echo "2) Comprobar servicios (apache2, ssh...)"
  echo "3) Ver puertos abiertos y procesos"
  echo "4) Comprobar archivos clave"
  echo "5) Hacer copia de seguridad"
  echo "6) Salir"
  echo "==========================================="
  echo -n "Selecciona una opción: "
}

read_choice() {
  read opcion
  case $opcion in
    1) bash check_hardware.sh $remote_user $remote_host;;
    2) bash check_services.sh $remote_user $remote_host;;
    3) bash check_ports_processes.sh $remote_user $remote_host;;
    4) bash check_files.sh $remote_user $remote_host;;
    5) bash backup.sh $remote_user $remote_host;;
    6) echo "Saliendo..."; exit 0;;
    *) echo "Opción no válida.";;
  esac
}

while true; do
  show_menu
  read_choice
  echo ""
done
