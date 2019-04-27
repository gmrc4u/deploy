#!/bin/bash

if [ $ENVIRONMENT = "QA" ];then
	for i in `cat ips.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "kalyan" scp target/gamutkart.war kalyan@$i:/home/kalyan/soft/apache-tomcat-8.5.38/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "gamut" ssh gamut@$i "JAVA_HOME=/home/kalyan/soft/jdk1.8.0_201" "/home/kalyan/soft/apache-tomcat-9.0.17/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
fi
