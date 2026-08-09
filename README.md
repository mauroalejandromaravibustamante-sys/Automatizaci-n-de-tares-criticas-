# Automatización De Tares Criticas.

1.	El menú principal.
   
"Es la Interfaz de Usuario Central. Su objetivo es integrar todas las herramientas desarrolladas en una sola consola interactiva, facilitando la ejecución de tareas operativas sin requerir que el operador recuerde comandos ni rutas complejas".

<img width="776" height="417" alt="image" src="https://github.com/user-attachments/assets/b8c7f807-e129-4c9f-b907-f7d10dd784e7" />

"Con el propósito de estandarizar la ejecución de las herramientas desarrolladas y reducir el margen de error humano en la operación diaria"

2.	Bash de backup.
   
"Es el módulo de Copias de Seguridad Diarias de Directorios Clave con Envío de Reporte. Su objetivo es automatizar el respaldo comprimido de configuraciones o archivos críticos del sistema, garantizando la integridad de la información y generando un historial de eventos"

<img width="886" height="401" alt="image" src="https://github.com/user-attachments/assets/e39bbec0-d8b2-4898-883a-c9a4972e2bfd" />

"Para la protección de datos y continuidad del negocio, se implementó el script 01_backup.sh, el cual automatiza las copias de seguridad del directorio crítico /etc. La herramienta incorpora la generación dinámica de nombres de archivo mediante marcas de tiempo (date), compresión en formato .tar.gz y validación de existencia previa de las rutas de origen y destino".

3.	Bash de Gestión de Usuarios.

Es el módulo de Gestión de Usuarios y Permisos basada en Roles (RBAC). Su objetivo es automatizar el alta de nuevos colaboradores en el sistema operativo, aprovisionando sus grupos, carpetas de trabajo, permisos de seguridad y credenciales iniciales de forma estandarizada.

<img width="766" height="433" alt="image" src="https://github.com/user-attachments/assets/9c02573f-0b56-4b67-ba90-a103097a2ea9" />
<img width="779" height="170" alt="image" src="https://github.com/user-attachments/assets/dcff5b77-f480-432a-aba1-cb183e9ee563" />

"Para la administración de identidades y accesos, se desarrolló el script 03_gestion_usuarios.sh, el cual automatiza el aprovisionamiento de cuentas"

4.	Bash de monitoreo.

"Es el Sistema de Monitoreo de Logs con Detección de Eventos Críticos. Su objetivo es analizar automáticamente el registro principal del sistema operativo para encontrar fallos o amenazas y guardar un reporte con los hallazgos.2

<img width="886" height="284" alt="image" src="https://github.com/user-attachments/assets/2e41e84a-2b82-4c7a-80af-f428a804d560" />

"Para el cumplimiento del módulo de monitoreo, se desarrolló el script 02_monitor_logs.sh, el cual automatiza la inspección de registros del sistema (/var/log/syslog). El script analiza las últimas 500 entradas en busca de patrones de error predefinidos (ERROR, CRITICAL, Failed, denied)".

. Una vez creada el directorio y los scripts de solución se le otorga ciertos permisos y mostramos el contenido del directorio creado:

<img width="885" height="63" alt="image" src="https://github.com/user-attachments/assets/ff589b8a-b40f-447c-a7a6-dce7e07bf620" />
<img width="886" height="60" alt="image" src="https://github.com/user-attachments/assets/7e73d6d4-e2b2-4203-87d1-5b61e2c4ca1f" />
<img width="886" height="44" alt="image" src="https://github.com/user-attachments/assets/6bc0f03d-0ea5-4511-b76d-c71e76e2bd60" />

Por otro lado configuramos el Crontab.

<img width="761" height="403" alt="image" src="https://github.com/user-attachments/assets/2b57a2d6-ccd6-4362-a577-67fb23d25f6f" />

Verificamos que este activo.

<img width="757" height="272" alt="image" src="https://github.com/user-attachments/assets/7323b091-07f8-415f-89ac-009259bb70ca" />

"Para garantizar la ejecución desatendida y periódica de las tareas críticas, se configuró la tabla de planificación crontab. El script 01_backup.sh fue programado para ejecutarse diariamente a las 02:00 horas (0 2 * * *), mientras que la inspección de logs con 02_monitor_logs.sh se efectúa de manera recurrente cada hora (0 * * * *)".

. Pruebas correspondientes

Ejecucion del Menu_principal.

<img width="886" height="243" alt="image" src="https://github.com/user-attachments/assets/77985203-0a16-41ac-befe-2d292ea408fb" />

Ejecución de Copias de seguridad.

<img width="886" height="272" alt="image" src="https://github.com/user-attachments/assets/8a3997f2-583e-472d-8d74-f81a83628891" />

Ejecución de monitoreos de Logs.

<img width="886" height="452" alt="image" src="https://github.com/user-attachments/assets/219fcbe2-b06d-4888-bd63-4b226d5848fb" />
<img width="886" height="224" alt="image" src="https://github.com/user-attachments/assets/aea4da36-c0ac-451d-b853-3e124be97e5e" />

Ejecución de Gestión de usuarios y Permisos

<img width="886" height="301" alt="image" src="https://github.com/user-attachments/assets/10234413-f59d-4e5a-9346-cfb0f11cc048" />

.Conclusiones y Recomendaciones

Conclusión:

La automatización mediante Shell Scripting optimiza la administración del sistema operativo, reduce los tiempos de respuesta y minimiza los errores de configuración manual.

Recomendación de Seguridad:

Se sugiere aplicar el principio de menor privilegio en los scripts ejecutados por cron, restringir el acceso a los archivos de logs generados (chmod 600) y evitar el uso de permisos SUID en archivos ejecutables de procesamiento interactivo.
