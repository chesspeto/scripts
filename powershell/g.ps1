# script para realizar busquedas con firefox

param(
    [Parameter(Mandatory=$true)]
    [string]$searchTerm
)

# Crear la URL de búsqueda de Google
$searchUrl = "https://www.google.com/search?q=" + $searchTerm.Replace(' ', '+')

# Abrir Firefox con la URL de búsqueda
Start-Process -FilePath 'C:\Program Files\Mozilla Firefox\firefox.exe' -ArgumentList $searchUrl
