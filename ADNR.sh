#!/bin/sh
#Automatically detects network restart

logNum=0
while true
do
	netok=$(ping 114.114.114.114 -c3 |grep "time=")
	if [ "$netok" ];
	then
		unset logNum
		logger network is ok
		echo "network is ok"
		break
		
	else
		if [ $logNum > 5 ];
		then
			logger Stop for 5 minutes
			echo "Stop for 5 minutes"
			sleep 5m
			logNum=0
		fi
		/etc/init.d/network restart
		logNum++
	fi
done