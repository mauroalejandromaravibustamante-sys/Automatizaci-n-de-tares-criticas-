#!/bin/bash

DIRECTORIO_ORIGEN="/etc" # Cambia esto por el directorio que deseas respaldar
DIRECTORIO_DESTINO="/var/backups/diarios"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVO_BACKUP="backup_etc_$FECHA.tar.gz"
ARCHIVO_REPORTE="/var/log/backup_reporte.log"

if [ ! -d "$DIRECTORIO_DESTINO" ]; then
    mkdir -p "$DIRECTORIO_DESTINO"
fi

echo "----------------------------------------" >> "$ARCHIVO_REPORTE"
echo "Iniciando backup: $(date)" >> "$ARCHIVO_REPORTE"

if [ ! -d "$DIRECTORIO_ORIGEN" ]; then
    echo "ERROR: El directorio origen $DIRECTORIO_ORIGEN no existe." | tee -a "$ARCHIVO_REPORTE"
    exit 1
fi

echo "Comprimiendo archivos desde $DIRECTORIO_ORIGEN..."
tar -czf "$DIRECTORIO_DESTINO/$ARCHIVO_BACKUP" "$DIRECTORIO_ORIGEN" 2>/dev/null

if [ $? -eq 0 ]; then
    TAMANO=$(du -sh "$DIRECTORIO_DESTINO/$ARCHIVO_BACKUP" | awk '{print $1}')
    MENSAJE="ÉXITO: Backup completado. Archivo: $ARCHIVO_BACKUP | Tamaño: $TAMANO"
    echo "$MENSAJE" | tee -a "$ARCHIVO_REPORTE"
else
    MENSAJE="CRÍTICO: Ocurrió un error al crear el backup."
    echo "$MENSAJE" | tee -a "$ARCHIVO_REPORTE"
    exit 2
fi
