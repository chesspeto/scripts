#!/bin/sh
echo "introduce IP:"
read IP
echo "introduce min-rate:"
read MINRATE
echo "nombre del informe"
read INFORME
<<<<<<< HEAD

ruta=$(hostname -I)
nmap -sSCV -n -Pn -vvv -p- --open $IP --min-rate=$MINRATE -oX escaneo.xml
xsltproc escaneo.xml -o escaneo.html
=======
URL=$(hostname -I)

#nmap
nmap -sSCV -n -Pn -vvv -p- --open $IP --min-rate=$MINRATE -oX escaneo.xml

#convert html
xsltproc escaneo.xml -o escaneo.html

#clean
>>>>>>> 45d1eec3c09050f8b4dae905e272ba285acc16cb
mv ./escaneo.html  "$INFORME"
rm ./escaneo.xml

echo "el informe se llama $INFORME"
<<<<<<< HEAD
echo "los puedes descargar en http://$ruta" 
echo "pulsa CTRL+C para terminar"
=======
echo "los puedes descargar en http://$URL" 
echo "pulsa CTRL+C para terminar"

>>>>>>> 45d1eec3c09050f8b4dae905e272ba285acc16cb
python3 -m http.server 80 2>/dev/null

