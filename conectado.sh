#!/bin/bash
while true
do
	wget -q --tries=10 --timeout=20 --spider http://google.com
	if [[ $? -eq 0 ]]; 
	then
		echo "online"
		vlc http://167.114.100.40:5859/stream &
		
	else
		echo "offline"
		pkill vlc
	fi
	sleep 10
done

