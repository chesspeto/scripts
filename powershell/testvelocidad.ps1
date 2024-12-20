$url = "http://speedtest.tele2.net/100MB.zip"

# Ruta del archivo temporal para la descarga
$file = "C:\temp\100MB.zip"

# Tiempo de inicio
$start_time = Get-Date

# Descargar el archivo
Invoke-WebRequest -Uri $url -OutFile $file

# Tiempo de finalización
$end_time = Get-Date

# Eliminar el archivo descargado
Remove-Item -Path $file

# Calcular la duración de la descarga
$duration = $end_time - $start_time

# Calcular la velocidad de descarga en Mbps
$speed = (100 / $duration.TotalSeconds) * 8

# Imprimir la velocidad de descarga
Write-Output "Velocidad de descarga: $speed Mbps"
