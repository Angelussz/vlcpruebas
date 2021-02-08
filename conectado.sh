#!/bin/bash

contador=0;
while true
do
	wget -q --tries=10 --timeout=20 --spider http://google.com
	if [[ $? -eq 0 ]]; 
	then
		if [[ contador -eq 0 ]];
		then
			echo "radio online"
			vlc http://167.114.100.40:5859/stream &
			((contador=contador+1))
			echo $contador
		fi

	else
		if [[ contador -eq 1 ]]
		then
			pkill vlc
			echo "radio offline"
			((contador=contador-1))
			echo $contador
		fi
		echo "REVISE SI TIENE CONEXION A INTERNET O SI EL SERVIDOR DE RADIO VIDA CUSCO SIGUE FUNCIONANDO "
	fi
	sleep 10

done

