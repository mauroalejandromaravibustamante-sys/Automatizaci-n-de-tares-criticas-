#!/bin/bash

LOG_SISTEMA="/var/log/syslog" # En distros basadas en RHEL/CentOS usa /var/log/messages
LOG_ALERTAS="/var/log/alertas_criticas.log"
PALABRAS_CLAVE="ERROR|CRITICAL|Failed|denied"

if [ ! -f "$LOG_SISTEMA" ]; then
    echo "Error: El archivo de log $LOG_SISTEMA no existe o no hay permisos."
    exit 1
fi

echo "=========================================" >> "$LOG_ALERTAS"
echo "Reporte de Monitoreo - $(date)" >> "$LOG_ALERTAS"

echo "Analizando logs en busca de eventos críticos..."
RESULTADOS=$(tail -n 500 "$LOG_SISTEMA" | egrep -i "$PALABRAS_CLAVE")

if [ -z "$RESULTADOS" ]; then
    echo "No se encontraron eventos críticos en la revisión actual." | tee -a "$LOG_ALERTAS"
else
    echo "¡ATENCIÓN! Se encontraron los siguientes eventos críticos:" | tee -a "$LOG_ALERTAS"
    echo "$RESULTADOS" | tee -a "$LOG_ALERTAS"
fi
