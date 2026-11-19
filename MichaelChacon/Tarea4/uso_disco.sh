#!/bin/bash

echo "=========================================="
echo "  REPORTE GENERAL DEL SERVIDOR"
echo "  Fecha: $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="

echo -e "\n[1] USO DE DISCO (/):"
df -h /

echo -e "\n[2] MEMORIA RAM Y SWAP:"
free -h

echo -e "\n[3] TIEMPO ENCENDIDO Y CARGA DE CPU:"
uptime

echo -e "\n[4] TOP 5 PROCESOS CON MAYOR CONSUMO DE RAM:"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6

echo -e "\n[5] SERVICIOS CON ERRORES (FAILED):"
if command -v systemctl &> /dev/null && systemctl is-system-running &> /dev/null; then
    systemctl --failed --no-pager
else
    echo "Systemd no está activo en este entorno (ej. WSL)."
fi

echo "=========================================="
