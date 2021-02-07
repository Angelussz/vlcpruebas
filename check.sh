#!/bin/bash

SITIO1=8.8.8.8
SITIO2=8.8.4.4

while true
do
	ping -c8 ${SITIO1} >/dev/null
	respuesta1=$?
	if [ $respuesta1 -eq 1 ];
	then
		sleep 10
		ping -c3 ${SITIO2} >/dev/null 2>/dev/null

		respuesta2=$?

		if [ $respuesta2 -eq 1 ];
		then
			logger NO HAY INTERNET. HORA: $(date)
			echo "NO HAY INTERNET. HORA: $(date)"
		fi
	fi
	sleep 10
done

