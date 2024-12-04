#!/bin/bash

# URL de la API de IP-API
API_URL="http://ip-api.com/json"

# Obtener la IP del usuario
#IP=$(curl -s ifconfig.me)
echo "introduce IP"
read IP
# Realizar la solicitud a la API
RESPONSE=$(curl -s "$API_URL/$IP")

# Verificar si la solicitud fue exitosa
if [ $? -eq 0 ]; then
  # Extraer la información de geolocalización
  COUNTRY=$(echo "$RESPONSE" | jq -r '.country')
  CITY=$(echo "$RESPONSE" | jq -r '.city')
  REGION=$(echo "$RESPONSE" | jq -r '.regionName')
  LATITUD=$(echo "$RESPONSE" | jq -r '.lat')
  LONGITUD=$(echo "$RESPONSE" | jq -r '.lon')
  AS=$(echo "$RESPONSE" | jq -r '.as')
  ZIP=$(echo "$RESPONSE" | jq -r '.zip')

  # Mostrar la información de geolocalización
  echo "País: $COUNTRY"
  echo "Ciudad: $CITY"
  echo "Región: $REGION"
  echo "Latitud: $LATITUD"
  echo "Longitud: $LONGITUD"
  echo "Operador: $AS"
  echo "Código Postal: $ZIP"
else
  echo "Error al realizar la solicitud a la API"
fi
