#!/bin/sh
echo "introduce IP:"
read IP
echo "introduce min-rate:"
read MINRATE
echo "nombre del informe"
read INFORME
URL=$(hostname -I)

#nmap
nmap -sSCV -n -Pn -vvv -p- --open $IP --min-rate=$MINRATE -oX escaneo.xml

#convert html
xsltproc escaneo.xml -o escaneo.html

#clean
mv ./escaneo.html  "$INFORME"
rm ./escaneo.xml

echo "el informe se llama $INFORME"
echo "los puedes descargar en http://$URL" 
echo "pulsa CTRL+C para terminar"

python3 -m http.server 80 2>/dev/null

